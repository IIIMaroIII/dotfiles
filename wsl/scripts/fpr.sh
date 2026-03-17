# Desc: Looking for an order, if that exists then open stuff
#!/bin/bash
cd $PR || {
	echo "[		Couldn't switch pwd to a $PR	]"
	exit 1
}

echo "All scripts args: $@"
CMD="$1"
shift
echo "Args after shift: $@"
args=(${@})

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
				yazi "$dir"
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
open | --open | -o)
	clear
	printf '[	Found a project: %s\n' ${args[@]} ]
	echo "[		There are ${#args[@]} projects were found.	]"

	read -rp "  Wanna open them all?" a
	{
		for fol in "$@"; do
			if [[ "${a,,}" == "y" ]]; then
				for match in $PR/$fol; do
					[[ -d "$match" ]] && yazi "$match"
				done
			else
				printf '%s\n' "Exiting..."
				return 0
			fi
		done
	}
	;;

* | --help | -h) echo "	❓ Help ❓" ;;
esac
