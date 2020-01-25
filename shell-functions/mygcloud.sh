#!/bin/bash

alias mgc="mygcloud"
# shortcuts for things I do too often with gcloud
mygcloud() {
  if [[ -z $1 ]]; then
    echo "usage: $0 resize|..."
    return
  fi
  if [[ $1 == "resize" ]]; then
    # prevent me from doing something insane
    if [[ -z $2 ]] || [[ $2 -lt 1 ]] || [[ $2 -gt 5 ]]; then
      echo "usage: $0 $1 [1..5]"
      return
    fi
    gcloud container clusters resize blog-cluster --node-pool default-pool --num-nodes "$2"
  fi
}
