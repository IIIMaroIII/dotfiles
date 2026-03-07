# Ubuntu AV Cheatsheet — iPhone Camera & Audio

## Camera — Iriun Webcam (iPhone via USB)

### Install
```bash
# Download from https://iriun.com → Linux .deb
cd /tmp
sudo dpkg -i --force-depends iriunwebcam-*.deb
sudo apt install libqt5widgets5 libqt5gui5 libqt5core5a
```

### Run
```bash
iriunwebcam
```
- Open Iriun on iPhone first
- Select **iPhone [USB]** in the desktop app
- Set Audio device to **ALSA Loopback**

---

## v4l2loopback — Build from Source (required for kernel 6.19+)

### First time or after kernel update
```bash
cd ~/v4l2loopback          # clone here, NOT /tmp (gets wiped on reboot)
# first time only:
git clone https://github.com/umlaeute/v4l2loopback.git ~/v4l2loopback

make && sudo make install
sudo depmod -a
sudo modprobe v4l2loopback
```

### Verify loaded
```bash
lsmod | grep v4l2
```

### Auto-load on boot
```bash
echo "v4l2loopback" | sudo tee /etc/modules-load.d/v4l2loopback.conf
```

> ⚠️ Must rebuild after every kernel update — the module is kernel-specific.

---

## Audio Sources

### List all sources
```bash
pactl list sources short
```

| Source | Device |
|--------|--------|
| `54` | Built-in Mac mic (Internal Microphone) |
| `101` | ALSA Loopback (Iriun audio channel) |
| `544` | AirPods mic (bluez HFP) |

### Record & playback test
```bash
# Built-in mic
pw-record --target alsa_input.pci-0000_04_00.3.BuiltinMic /tmp/test.wav
# AirPods mic
pw-record --target 544 /tmp/test.wav
# Ctrl+C to stop, then:
aplay /tmp/test.wav
```

---

## AirPods — Bluetooth

### Modes
| Mode | Output quality | Mic |
|------|---------------|-----|
| Headphone / A2DP (codec SBC) | ✅ High quality | ❌ No mic |
| Handsfree / HFP (codec mSBC) | ⚠️ Low quality 16kHz | ✅ Mic works |

> You cannot have high quality output AND mic at the same time — Bluetooth limitation.

### Best combo
- 🔊 **Output** → AirPods in Headphone (A2DP) mode
- 🎤 **Mic** → Built-in Mac mic (quiet but works)

---

## Dummy Package Fix (v4l2loopback-dkms conflict)

If `apt` keeps complaining about broken `v4l2loopback-dkms`:
```bash
sudo apt install equivs
cd /tmp
equivs-control v4l2loopback-dkms-dummy
# Edit: Package: v4l2loopback-dkms, Version: 99.0
equivs-build v4l2loopback-dkms-dummy
sudo dpkg -i v4l2loopback-dkms_99.0_all.deb
```

---

## Hibernate / Hybrid Sleep (MacBook Pro 2019)

### Setup (one time)
```bash
# Swapfile must be >= RAM size (16GB)
sudo swapoff /swapfile && sudo rm /swapfile
sudo fallocate -l 16G /swapfile
sudo chmod 600 /swapfile && sudo mkswap /swapfile && sudo swapon /swapfile

# Get UUID and offset
findmnt -no UUID -T /swapfile
sudo filefrag -v /swapfile | awk 'NR==4{print $4}' | tr -d '.'

# Add to /etc/default/grub:
# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash resume=UUID=<uuid> resume_offset=<offset>"
sudo update-grub && sudo update-initramfs -u
```

### Use
```bash
sudo systemctl hybrid-sleep    # recommended for laptop
sudo systemctl hibernate       # full hibernate
sudo systemctl suspend         # plain suspend
```

### Auto hybrid-sleep on lid close
```bash
# /etc/systemd/logind.conf:
# HandleLidSwitch=hybrid-sleep
# HandleLidSwitchExternalPower=hybrid-sleep
sudo systemctl restart systemd-logind
```
