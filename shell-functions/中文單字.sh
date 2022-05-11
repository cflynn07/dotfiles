#!/bin/bash
# functions/中文單字.sh

# $1 ip address
# $2 filename
chinese_list() {
  # PLECO_FILE="2022-5-w4.xml";
  HOST=$1;
  PLECO_FILE=$2;
  PLECO_TO_ANKI_DIR=/Users/casey/MEGAsync/workspace/plecoToAnki;
  curl "http://$HOST:50505/$PLECO_FILE" > "$PLECO_TO_ANKI_DIR/$PLECO_FILE";
  node "$PLECO_TO_ANKI_DIR/index.js" "$PLECO_TO_ANKI_DIR/$PLECO_FILE" > "$HOME/Desktop/$PLECO_FILE";
}
