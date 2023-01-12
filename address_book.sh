#!/bin/sh
# Address Book

# Roderick Ruotolo

trap 'do_menu' 2

. ./address_libs.sh

show_menu()
{
	echo ''
	echo '    *** Agenda de Contatos em ShellScript by ___'
	echo ''
	echo '  -------------------------------------------------------------------------------+'
	echo ' /|                                                                              |' 
	echo ' /|   /$$$$$$$                  /$$                     /$$           /$$        | ' 
	echo ' /|  | $$__  $$                | $$                    |__/          | $$        |' 
	echo ' /|  | $$  \ $$  /$$$$$$   /$$$$$$$  /$$$$$$   /$$$$$$  /$$  /$$$$$$$| $$   /$$  |'
	echo ' /|  | $$$$$$$/ /$$__  $$ /$$__  $$ /$$__  $$ /$$__  $$| $$ /$$_____/| $$  /$$/  |'
	echo ' /|  | $$__  $$| $$  \ $$| $$  | $$| $$$$$$$$| $$  \__/| $$| $$      | $$$$$$/   |' 
	echo ' /|  | $$  \ $$| $$  | $$| $$  | $$| $$_____/| $$      | $$| $$      | $$_  $$   |'
	echo ' /|  | $$  | $$|  $$$$$$/|  $$$$$$$|  $$$$$$$| $$      | $$|  $$$$$$$| $$ \  $$  |'
	echo ' /|  |_ /  |__/ \______/  \_______/ \_______/|__/      |__/ \_______/|__/  \__/  |'
	echo ' /|______________________________________________________________________________|'
	echo ' /////////////////////////////////////////////////////////////////////////////////'
	echo ''
	echo '    +------------------------------------+'
	echo '    |  Escolha uma das Opções Abaixo     |'
	echo '    +------------------------------------+'
	echo '    |  1) Listar / Buscar                |'
	echo '    +------------------------------------+'
	echo '    |  2) Adicionar Contato              |'
	echo '    +------------------------------------+'
	echo '    |  3) Editar Contato                 |'
	echo '    +------------------------------------+'
	echo '    |  4) Remover Contato                |'
	echo '    +------------------------------------+'
	echo '    |  q) Sair                           |'
	echo '    +------------------------------------+'
	echo ''
	echo -en " Entre com sua opção: "
}

do_menu()
{
	i=-1

	while [ "$i" != "q" ]; do
		show_menu

		read i
		
		i=`echo $i | tr '[A-Z]' '[a-z]'`

		case "$i" in 
			"1")
			list_items
			;;

		        "2")
			add_item
			;;

		        "3")
			edit_item
			;;

			"4")
			remove_item
			;;

			"q")
			echo "   Confirmada saida do programa, até mais ;)"
			;;

			*)
			echo "Entrada não reconhecida."
			;;
		esac
	done
}

#########################################################################
################# Main Script inicia aqui ###############################
#########################################################################

if [ ! -f $BOOK ]; then
	echo "Criando $BOOK ..."
	touch $BOOK
fi

if [ ! -r $BOOK ]; then 
	echo "Erro: $BOOK sem permissão de leitura"
	exit 1
fi

if [ ! -w $BOOK ]; then
	echo "Erro: $BOOK sem permissão de escrita"
	exit 2
fi

do_menu
