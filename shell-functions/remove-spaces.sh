#!/bin/bash
# shell-functions/remove-spaces.sh

# $1 file name match prefix
# $ ll | grep Screen
# -rw-r--r--@ 1 casey  staff   3.2M Jan 29 20:48 Screen Shot 2020-01-03 at 1.57.51 PM.png
# -rw-r--r--@ 1 casey  staff   626K Jan 29 21:23 Screen Shot 2020-01-29 at 9.14.56 PM.png
# remove_spaces "Screen Shot"
# $ ll | grep Screen
# -rw-r--r--@ 1 casey  staff   3.2M Jan 29 20:48 Screen_Shot_2020-01-03_at_1.57.51_PM.png
# -rw-r--r--@ 1 casey  staff   626K Jan 29 21:23 Screen_Shot_2020-01-29_at_9.14.56_PM.png

remove_spaces () {
  for oldname in ./"$1"*; do
    newname=$(echo $oldname | tr ' ' '_')
    mv "$oldname" "$newname"
  done
}
