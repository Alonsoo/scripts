#!/bin/bash

bonsai=$(bonsai -L 22 -m "Hola guapo" | tail -n +2 | head -n -1 | grep -v '^ *$') # remove first and last lines which contain terminal commands, and then remove empty lines

min_len=1000
while IFS= read -r line; do
	len=$(expr match "$line" " *")
	if (( len < min_len )); then
		min_len=$len
	fi
done < <(echo "$bonsai")

echo "$(echo -e "\n$bonsai" | cut --characters "$(( $min_len - 3 ))"-)"
 
