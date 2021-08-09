#!/bin/bash
# Backup important things every X

DATE=$(date +%y%m%d)
CONFIG_FILE=$HOME/.backup_list
DESTINATION_DIR=$HOME/workspace_archives
readonly DATE
readonly CONFIG_FILE
readonly DESTINATION_DIR

if ! [ -f "$CONFIG_FILE" ]
then
  echo "$CONFIG_FILE does not exist."
  echo "Backup not completed due to missing Configuration File"
  echo
  exit
fi

declare -a FILE_LIST
exec < "$CONFIG_FILE"
while read -r FILE_NAME
do
  if [ -f "$FILE_NAME" ] || [ -d "$FILE_NAME" ]z
  then
    FILE_LIST+=("$FILE_NAME")
  else
    echo
    echo "$FILE_NAME does not exist"
    echo "Continuing to build archive list"
  fi
  read -r FILE_NAME
done

count=1
total=${#FILE_LIST[@]}
for file in "${FILE_LIST[@]}"
do
  archive_destination="$DESTINATION_DIR/$(basename "$file")-$DATE.tar.gz"
  echo "archiving ($count/$total): $file @ $archive_destination"
  tar -czf "$archive_destination" "$file" &> /dev/null
  count=$(( count + 1 ))
done
