# Desc: Looking for an order, if that exists then open stuff

if [[ -z "${PR// }" ]]; then
	echo -n "	Couldn't resolve a var '$PR'"
	exit 1

fi

printf '%s\n' "Changing a directory to $PR..."
cd "$PR"



r-ord(){
ORDER="$1"

#looking for a folder

while IFS= read -r l; do
	if [[ -e "$l" ]]; then
		echo -n "	Here you are a folder: $l"
	else
		echo -n "	Cant find a folder in: $l"
	fi
		

done< <(find . -type d -iname "$1")
}

r-ord "$@"
