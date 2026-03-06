# Desc: Looking for an order, if that exists then open stuff


dir="$PR/$1"
EXCLUDE_FOLDERS="(bzs|log[s])"

find_order=$(find "$PR" -type d -iname "$1" -regextype egrep ! -regex ".*/$EXCLUDE_FOLDERS/.*")

if [[ -z "$find_order" ]]; then 
	echo "	Order $1 isn't found creating the structure..."
	mkdir -p "$dir"/{src/{skp,xlsx},assets/{docs,pics,appl},send,pdfs}
	tree -a "$dir"
else
	printf '%s\n' "Order $1 exists."
	rm -irv "$dir"
	printf '%s\n' "Exiting..."
fi
