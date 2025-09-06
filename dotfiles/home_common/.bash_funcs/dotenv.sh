#!/usr/bin/bash

dotenv_export(){
  # Export the dotenv file to env vars
  if [ -f "$1" ]; then
    # Check if the file exist
    f=$1
  else
    f=.env
  fi
  export $(cat $f | xargs)
  echo "Dotenv file $1 exported to env vars!"
}