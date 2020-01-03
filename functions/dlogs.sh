#!/bin/bash
# functions/dlogs.sh

# Docker logs
# quickly tail logs of first matching container
# Ex:
#   $ dlogs blog
dlogs() {
  cids "$1" | xargs docker logs -f
}
