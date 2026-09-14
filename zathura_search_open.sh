#! /bin/bash


#path=$(find ~/ -type f -not -path "*/.*" -name "*.pdf" -or -name "*.epub" -or -name "*.djvu" | rev | cut -c -160 | rev |  wmenu-colors -i -l 10 -c)

path=$(find ~/Documents/ ~/Downloads/ ~/Music/ -type f -not -path "*/.*" -name "*.pdf" -or -name "*.epub" -or -name "*.djvu" | rev | cut -c -160 | rev |  wmenu-colors -i -l 10 -c)

if [[ -n "$path" ]]; then
	zathura "$path"
fi


