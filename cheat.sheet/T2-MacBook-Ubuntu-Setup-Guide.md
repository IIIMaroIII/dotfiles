# Ubuntu Post-Installation Guide for MacBook Pro 2019 (16") with T2 Chip

Complete setup guide to get all hardware working properly on Ubuntu 24.04.

---

## Prerequisites

- Fresh Ubuntu installation (official or T2-patched ISO)
- Internet connection (ethernet or USB tethering)
- Terminal access

---

## Step 1: Install T2 Kernel

The T2 kernel enables keyboard, trackpad, Touch Bar, audio, fan, and WiFi.

```bash
# Add T2 Ubuntu repository
curl -s --compressed "https://adnanmkhareedi.github.io/t2-ubuntu-repo/KEY.gpg" | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/t2-ubuntu-repo.gpg >/dev/null

sudo curl -s --compressed -o /etc/apt/sources.list.d/t2.list "https://adnanmkhareedi.github.io/t2-ubuntu-repo/t2.list"

# Update and install T2 kernel
sudo apt update
sudo apt install linux-t2 apple-bce-dkms apple-ib-dkms tiny-dfr

# Reboot to T2 kernel
sudo reboot
```

**Verify installation:**
```bash
uname -r
# Should show something like: 6.x.x-t2-noble
```

---

## Step 2: Configure GRUB Kernel Parameters

Add required kernel parameters for T2 hardware compatibility and sleep functionality.

```bash
# Edit GRUB configuration
sudo nano /etc/default/grub
```

**Modify these lines:**
```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash mem_sleep_default=deep pcie_aspm=off"
GRUB_CMDLINE_LINUX="pcie_ports=compat intel_iommu=on iommu=pt"
```

**Apply changes:**
```bash
sudo update-grub
sudo reboot
```

**Verify after reboot:**
```bash
cat /proc/cmdline
# Should contain: mem_sleep_default=deep pcie_aspm=off pcie_ports=compat intel_iommu=on iommu=pt
```

---

## Step 3: Install Suspend/Resume Fix

This fixes sleep/wake issues and ensures WiFi reconnects after resume.

```bash
# Download and run the T2 suspend fix script
cd ~
wget https://raw.githubusercontent.com/deqrocks/T2Linux-Suspend-Fix/refs/heads/main/t2-suspend-fix.sh
chmod +x t2-suspend-fix.sh
sudo ./t2-suspend-fix.sh
```

- Select **"1) Install"** when prompted
- Reboot when asked

**Verify services are installed:**
```bash
systemctl status suspend-wifi-unload.service
systemctl status resume-wifi-reload.service
systemctl status fix-kbd-backlight.service
# All should show: loaded, enabled (inactive is normal when awake)
```

---

## Step 4: Fix Audio (Speakers)

PipeWire may break during setup. Reset it to defaults.

```bash
# Remove broken PipeWire config (if exists)
sudo mv /etc/pipewire /etc/pipewire.disabled.$(date +%s) 2>/dev/null

# Remove user configs
rm -rf ~/.config/pipewire ~/.local/state/pipewire

# Restart PipeWire services
systemctl --user daemon-reexec
systemctl --user restart pipewire wireplumber pipewire-pulse
```

**Verify audio works:**
```bash
systemctl --user status pipewire wireplumber pipewire-pulse
# All should show: active (running)

# Test speakers
speaker-test -t wav -l 1
```

---

## Step 5: Configure WiFi and Bluetooth (Optional)

WiFi and Bluetooth should work automatically with the T2 kernel. If you need firmware:

Follow the official guide:
https://wiki.t2linux.org/guides/wifi-bluetooth/

---

## Step 6: Load Modules on Boot (Optional)

For encrypted drives (LUKS) or early keyboard access:

```bash
# Add apple-bce to load on boot
echo apple-bce | sudo tee /etc/modules-load.d/t2.conf

# For early boot (LUKS decryption)
sudo bash -c 'cat <<EOF >> /etc/initramfs-tools/modules
# Required modules for getting the built-in apple keyboard to work:
snd
snd_pcm
apple-bce
EOF'

sudo update-initramfs -u
```

---

## Verification Checklist

After completing all steps, verify everything works:

### Check System Status
```bash
# Kernel
uname -r
# Should show: 6.x.x-t2-noble

# Kernel parameters
cat /proc/cmdline
# Should contain all required parameters

# Sleep mode
cat /sys/power/mem_sleep
# Should show: s2idle [deep]
```

### Check Services
```bash
# Audio services
systemctl --user status pipewire wireplumber pipewire-pulse
# All should be: active (running)

# Suspend services
systemctl status suspend-wifi-unload.service
systemctl status resume-wifi-reload.service
# Both should be: loaded, enabled
```

### Check Hardware
```bash
# WiFi
nmcli device status
# wlp5s0 should show: connected

# Loaded modules
lsmod | grep -E "apple|brcmfmac"
# Should show: apple-bce, brcmfmac, hid_appletb_kbd, etc.
```

### Test Functionality
```bash
# Test speakers
speaker-test -t wav -l 1

# Test suspend/resume
systemctl suspend
# Close lid, wait 10 seconds, open lid
# Should wake up properly with WiFi reconnected
```

---

## Testing Suspend/Resume

### Before Suspend - Baseline Check:
```bash
echo "=== BEFORE SUSPEND ==="
nmcli device status
systemctl --user is-active pipewire wireplumber
cat /sys/power/mem_sleep
```

### Perform Suspend:
```bash
systemctl suspend
# Or close the lid, wait 10+ seconds, open lid
```

### After Resume - Verification:
```bash
echo "=== AFTER RESUME ==="
nmcli device status
systemctl --user is-active pipewire wireplumber
speaker-test -t wav -l 1

# Check what happened during suspend/resume
sudo journalctl -u suspend-wifi-unload.service -u resume-wifi-reload.service --since "5 minutes ago"
```

---

## Known Issues and Solutions

### Issue: Microphone produces static/noise
**Status:** Known T2 issue, complex fix required  
**Workaround:** Use external microphone or Bluetooth headset

### Issue: WiFi doesn't reconnect after resume
**Solution:** The suspend fix script handles this automatically  
**Manual fix:** `sudo nmcli radio wifi off && sudo nmcli radio wifi on`

### Issue: PipeWire fails to start
**Solution:** Remove `/etc/pipewire` directory and restart services (Step 4)

### Issue: Keyboard doesn't work for LUKS decryption
**Solution:** Complete Step 6 to load modules on early boot

---

## Uninstallation (Revert Changes)

### Uninstall Suspend Fix:
```bash
cd ~
./t2-suspend-fix.sh
# Select "2) Uninstall"
```

### Revert GRUB Changes:
```bash
sudo nano /etc/default/grub
# Remove the T2-specific kernel parameters
sudo update-grub
sudo reboot
```

---

## Additional Resources

- **T2 Linux Wiki:** https://wiki.t2linux.org/
- **T2 Ubuntu Repository:** https://github.com/AdityaGarg8/t2-ubuntu-repo
- **T2 Suspend Fix:** https://github.com/deqrocks/T2Linux-Suspend-Fix
- **Audio Guide:** https://wiki.t2linux.org/guides/audio-config/
- **Community Support:** 
  - Matrix: https://matrix.to/#/#space:t2linux.org
  - Discord: https://discord.com/invite/68MRhQu

---

## What's Working

✅ Keyboard and trackpad  
✅ Touch Bar (with tiny-dfr)  
✅ WiFi and Bluetooth  
✅ Audio (speakers)  
✅ Suspend/resume (S3 deep sleep)  
✅ Fan control  
✅ Keyboard backlight  
✅ Screen brightness  
✅ USB-C ports  
✅ Thunderbolt  

## What's Not Working

❌ Microphone (produces static - known issue)  
⚠️ TouchID (hardware limitation, will never work on Linux)  

---

**Last Updated:** February 2026  
**Tested On:** MacBook Pro 16,1 (2019) with Ubuntu 24.04 LTS
