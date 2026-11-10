#! /bin/bash


#path=$(find ~/ -type f -not -path "*/.*" -name "*.pdf" -or -name "*.epub" -or -name "*.djvu" | rev | cut -c -160 | rev |  wmenu-colors -i -l 10 -c)

#path=$(find ~/Documents/ ~/Downloads/ ~/Music/ -type f -not -path "*/.*" -name "*.pdf" -or -name "*.epub" -or -name "*.djvu" | rev | cut -c -160 | rev |  wmenu-colors -i -l 10 -c)
path=$(find ~/Documents/ ~/Downloads/ ~/Music/ -type f -not -path "*/.*" -name "*.pdf" -or -name "*.epub" -or -name "*.djvu" | rev | cut -c -160 | rev |  rofi -dmenu -i -p "" -theme-str "configuration{show-icons: false; font: 'mono 10';} window{width:1000;} element{padding: 4;}")

if [[ -n "$path" ]]; then
	zathura "$path"
fi


