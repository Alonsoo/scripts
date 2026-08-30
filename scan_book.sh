#! /bin/bash

if [[ $# -eq 0 ]] ; then
	echo 'Please provide output file name'
	exit 1
fi

pause(){
	echo -e '\e[1A\r\e[KPress SPACE or ENTER to continue, q to finish.'
	while [[ 1 -eq 1 ]]; do
		
		read -n 1 -s  key

		if [ "$key" = "" ]; then
			return 0
		elif [ "$key" = 'q' ]; then
			echo -e "\nPreparing file..."
			magick "$TEMPDIR"/*.tif pdf:"$OUTPUT_FILE"
			rm -rf "$TEMPDIR"
			exit
		fi
	done
}

echo Press SPACE to start
read -s -d " "

TEMPDIR=$(mktemp -d)
OUTPUT_FILE="$1"
SCANNER="hpaio:/net/officejet_pro_8600?ip=192.168.1.71&queue=false" #search for scanner names with 'scanimage -L'
WIDTH=212
HEIGHT=299
RESOLUTION=300 # 75 | 100 | 200 | 300

declare -i pages=0
while true ; do
	echo -e '\e[1A\r\e[KScanning...'
	pages+=1
	filename=$(printf "$TEMPDIR/scan%03d.tif" "$pages")

	until scanimage --format tiff --mode color --device "$SCANNER" --resolution "$RESOLUTION" -o "$filename" -x "$WIDTH" -y "$HEIGHT" > /dev/null 2>&1; do
		sleep 1
	done

	echo -n -e "\r\e[KPages scanned: $pages"
	pause
done


