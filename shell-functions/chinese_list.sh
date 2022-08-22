#!/bin/bash
# functions/中文單字.sh

# $1 ip address
# $2 filename
chinese_list() {
  # PLECO_FILE="2022-5-w4.xml";
  HOST=$1;
  PLECO_FILE=$2;
  PLECO_TO_ANKI_DIR=/Users/caseyflynn/workspace/plecoToAnki;
  curl "http://$HOST:50505/$PLECO_FILE.xml" > "$PLECO_TO_ANKI_DIR/$PLECO_FILE.xml";
  node "$PLECO_TO_ANKI_DIR/index.js" "$PLECO_TO_ANKI_DIR/$PLECO_FILE.xml" > "$HOME/Desktop/$PLECO_FILE.csv";
  tail -n +2 "$HOME/Desktop/$PLECO_FILE.csv" > "$HOME/Desktop/$PLECO_FILE.csv.tmp"
  rm "$HOME/Desktop/$PLECO_FILE.csv"
  mv "$HOME/Desktop/$PLECO_FILE.csv.tmp" "$HOME/Desktop/$PLECO_FILE.csv"
}
