#!/bin/sh

if [ "$#" -lt 2 ]; then
	echo "Error: Missing required arguments"
	echo "Usage: $0 filedir searchstr"
	exit 1
fi

filedir="$1"
searchstr="$2"

# Check filedir is a directory
if [ ! -d "$filedir" ]; then
	echo "Error: $1 is not directory"
	exit 1
fi

filenum=$(find -L $filedir -type f | wc -l)

strnum=$(grep -R -h -F -- "$searchstr" "$filedir" | wc -l)

echo "The number of files are $filenum and the number of matching lines are $strnum"
exit 0


