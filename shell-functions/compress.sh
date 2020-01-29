#!/bin/bash
# functions/compress.sh

# tar & gzip files with visual feedback
# $1 input file/folder
# $2 output file name (.tar.gz will be appended)
# EX:
#   $ compress "$HOME/Desktop/photos" "jessica"
compress() {
  tar cf - "$1" -P | pv -s $(($(du -sk "$1" | awk '{print $1}') * 1024)) | gzip > "$2.tar.gz"
}
