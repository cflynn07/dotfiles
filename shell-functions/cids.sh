#!/bin/bash
# functions/cid.sh

# Container ID Search
# quickly grab docker container ID for first match of search pattern
# Ex:
#   $ docker exec `cids blog` cat /some/file
#   $ docker diff `cids blog`
cids() {
  docker ps | awk "/$1/{print \$1}"
}
