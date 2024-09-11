aws_login(){
  case $1 in
    prod)
      aws sso login --profile lc-production --no-browser
      ;;
    staging)
      aws sso login --profile lc-staging
      ;;
    esac 
}

aws_export_creds(){
  echo "Exporting profile $1 credentials to env vars"
  export $(aws configure export-credentials --profile $1 --format env-no-export | xargs -L1)
}