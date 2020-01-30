#!/bin/bash
# shell-functions/prepend-exif.sh
# throwaway tool to prepend the dateTimeOriginal exif tag value of images
# in a directory to the image filenames for easy sorting

#old:	desktop-dropbox-mcvp_blog_photo-ftv-press_conference-1-3.jpg
#new:	2014_11_06-17_31_03-desktop-dropbox-mcvp_blog_photo-ftv-press_conference-1-3.jpg

prepend_exif () {
  inc=0
  count=$(ll | wc -l | sed 's/ *//')

  for file in "$(pwd)"/*.jpg; do
    inc=$(( inc + 1 ))
    percent=$(echo "scale=2; $inc/$count*100" | bc)
    fbn=$(basename "$file")

    echo "$inc/$count $percent%"

    if [[ "$fbn" =~ ^[0-9]{4}_[0-9]{2}_[0-9]{2}-[0-9]{2}_[0-9]{2}_[0-9]{2} ]]; then
      echo "already prepended: $fbn"
      continue
    fi

    dateTimeOriginal=$(exiftool -DateTimeOriginal "$file")
    if [[ -n $dateTimeOriginal ]]; then
      dateTimeOriginal=$(echo "$dateTimeOriginal" | awk '{print $4 "-" $5}' | tr ':' '_')
    else
      dateTimeOriginal="0000_00_00-00_00_00"
    fi

    newFileName="$dateTimeOriginal-$fbn"
    printf "old:\t%s\n" "$fbn"
    printf "new:\t%s\n" "$newFileName"
    mv "$fbn" "$newFileName"
  done
}
