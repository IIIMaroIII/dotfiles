#!/bin/bash
LA_TEMPL="/mnt/c/Users/INTEL I9/AppData/Roaming/SketchUp/SketchUp 2019/LayOut/"
SK_TEMPL="/mnt/c/Users/INTEL I9/AppData/Roaming/SketchUp/SketchUp 2019/SketchUp/"

[[ $(uname -a | grep -i wsl) ]] && {
	echo "Running on WSL in Windows"
	cp -ru "$SK_TEMPL" "/mnt/d/projects/templates/sk_templ/"
	cp -ru "$LA_TEMPL" "/mnt/d/projects/templates/la_templ/"
}
echo "	Entering the mega.nz"

echo "	Login into the mega.nz"

if ! mega-cmd.mega-whoami &>/dev/null; then
	mega-cmd.mega-login "$MEGA_LOGIN" "$MEGA_PASSWD"
fi

echo " Sync local folder to mega.nz"

if [[ ! $(mega-cmd.mega-sync | grep "/mnt/d/projects") ]]; then
	echo "	Starting sync..."
	mega-cmd.mega-sync "/mnt/d/projects/" "/lavada/"
else
	echo " Trying to get id of current sync"
	id=$(mega-cmd.mega-sync |grep "/mnt/d/projects" | awk '{print $1}')
	echo "	id: $id"
	echo " Removing current sync by id: $id"
	mega-cmd.mega-sync -d -- "$id"
	echo 	" Starting new sync"

	mega-cmd.mega-sync "/mnt/d/projects/" "/lavada/"

	echo "Synced at: $(date +%Y-%m-%d:%H-%M)" >> /mnt/d/projects/logs/log.md
fi
