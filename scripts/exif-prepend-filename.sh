#!/bin/bash

#old:	desktop-dropbox-mcvp_blog_photo-ftv-press_conference-1-3.jpg
#new:	2014_11_06-17_31_03-desktop-dropbox-mcvp_blog_photo-ftv-press_conference-1-3.jpg

count=0
for file in "$(pwd)"/*.jpg; do
  count=$(( count + 1 ))
  dateTimeOriginal=$(exiftool -DateTimeOriginal "$file")
  if [[ -n $dateTimeOriginal ]]; then
    dateTimeOriginal=$(echo "$dateTimeOriginal" | awk '{print $4 "-" $5}' | tr ':' '_')
    fbn=$(basename "$file")
    echo $count
    printf "old:\t%s" "$fbn"
    printf "new:\t%s" "$dateTimeOriginal-$fbn"
  fi
done
