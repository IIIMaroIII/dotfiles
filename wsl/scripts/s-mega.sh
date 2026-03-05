#!/bin/bash

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
	mega-cmd.mega-sync -d $id
echo 	" Starting new sync"

	mega-cmd.mega-sync "/mnt/d/projects/" "/lavada/"
fi
