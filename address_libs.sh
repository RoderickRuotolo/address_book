

# Global variables
BOOK=~/.addressbook
export BOOK

confirm()
{
	echo -en "$@"
	read ans
	ans =`echo $ans | tr '[a-z]' '[A-Z]'`
	if [ "$ans" == "Y" ]; then 
		return 0
	else 
		return 1
	fi
}

num_lines()
{
	grep -i "$@" $BOOK|wc -l| awk '{ print $1 }'
}

find_lines()
{
	res=-1
	if [ ! -z "$1" ]; then 
		grep -i "$@" $BOOK
		res=$?
	fi
	return $res
}

list_items()
{
	if [ "$#" -eq "0" ]; then 
		echo -en "Busca por: (retorna para toda lista) "
		read search 
		if [ -z "$search" ]; then
			search="."
		fi
		echo
	else 
		search="$@"
	fi
	find_lines "${search}" | while read i
	do
		echo "$i" | tr ':' '\t'
	done
	echo -en "Contatos encontrados: "
	num_lines
}

add_item()
{
	echo "Add Item"
}

locate_single_item()
{
	echo "Locate item"
}

remove_item()
{
	echo "Remove Item"
}

edit_item()
{
	echo "Edit Item"
}
