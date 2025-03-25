dotenv_export(){
  # Export the dotenv file to env vars
  if [ -f "$1" ]; then
    # Check if the file exist
    f=$1
    export $(cat $1 | xargs)
    echo "Dotenv file $1 exported to env vars!"
  else
    f=.env
  fi
  export $(cat $f | xargs -L1)
}