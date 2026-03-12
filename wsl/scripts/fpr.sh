# Desc: Looking for an order, if that exists then open stuff
#!/bin/bash

echo "All scripts args: $@"
CMD="$1"
shift
echo "Args after shift: $@"

case "$CMD" in
find | -f)
	dir="$PR/$1"
	EXCLUDE_FOLDERS="(bzs|log[s])"
	order="$1"

	[[ -z "$order" ]] && {
		read -rp "	You didn't pass an argument. Do you wanna pass?" ans
		if [[ "${ans,,}" == "y" ]]; then
			read -rp "	Type the order name: " order
			dir="$PR/$order"
		else
			echo "	Exiting..."
			exit 0
		fi
	}

	#echo "Order is: $order"
	#echo "Dir: $dir"

	find_order=$(find "$PR" -type d -iname "$order" -regextype egrep ! -regex ".*/$EXCLUDE_FOLDERS/.*")

	if [[ -z "$find_order" ]]; then
		echo "	Order $order isn't found."

		read -rp "	Wanna create?	" str_ans
		if [[ "${str_ans,,}" == "y" ]]; then
			mkdir -p "$dir"/{src/{skp,xlsx},assets/{docs,pics,appl},send,pdfs}

			read -rp "	Wanna open the $dir in explorer?	" open_dir

			if [[ "${open_dir,,}" == "y" ]]; then
				explorer.exe "$(wslpath -w "$dir")"
			fi

			echo "	Changing the pwd..."
			cd "$dir"
		fi
	else
		printf '%s\n' "Order $order exists."
		#rm -irv "$dir"
		printf '%s\n' "Exiting..."
	fi
	;;
delete | -d) echo "	❌ You're trying to delete a stuff" ;;
open | --open | -o) [[ -e "$PR/$1" ]] && explorer.exe "$(wslpath -w $PR/$1)" ;;
* | --help | -h) echo "	❓ Help ❓" ;;
esac
