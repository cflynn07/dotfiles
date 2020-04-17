#!/bin/bash
# functions/quickjson.sh

# quickjson
# quickly make a JSON string from a bash associative array
# Ex:
# $ JSON=$(quickjson foo=bar biz=bang)
# $ echo $JSON
# {"foo":"bar","biz":"bang"}
quickjson() {
  echo -n "{"
  while [[ $# -gt 0 ]]
  do
    if [[ $(($#%2)) -eq 0 ]]
    then
      echo -n "\"$1\":"
    else
      echo -n "\"$1\""

      if [[ $# -ne 1 ]]
      then
        echo -n ","                
      fi
    fi
    shift
  done
  echo -n "}"
}
