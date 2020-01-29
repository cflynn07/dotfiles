# Jan 29, 2020
# Throwaway script I used to help a friend retreive .JPG files from external
# hard drive. Renamed replacing spaces with underscores and directory structure
# with hyphens

# Ex file structure
# /Volumes/Seagate Backup Plus Drive/Seagate Dashboard 2.0/HOS/Jessjess/Backup/9dcf6bd4-9848-49c9-a14d-d87e66893aad/20150425_233615_Jessjess/C/Users/Jessjess/Pictures/2011/Summer 2011/Harrison Hot Springs/DSC00563.JPG

find . -name "*.JPG" 2>/dev/null | 
  while IFS= read -r line; do
    nfn=$(echo $line | sed -E 's/^.+_Jessjess\/C\/Users\/Jessjess\///' | tr ' \/' '_-' | tr '[:upper:]' '[:lower:]')
    echo "$line"
    echo "$nfn"
    cp "$line" "$HOME/Desktop/photos/$nfn"
  done
