#!/usr/bin/env bash
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "You must specify the file extension (jpg or png)"
    exit
fi
if [ $2 != "png" ] && [ $2 != "jpg" ]
  then
    echo "invalid file extension"
    exit
fi
for filename in $(ls $1/*.$2); do
  result=$(ls $filename | sed -r 's/^.+\///' | cut -f 1 -d '.')
  bat $filename --file-name $result --tabs 1
  tiv $filename -h 20 -w 20
done
