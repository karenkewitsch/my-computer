aws_login(){
  case $1 in
    prod)
      aws_profile=lc-production
      aws sso login --profile lc-production --no-browser
      ;;
    staging)
      aws_profile=lc-staging
      aws sso login --profile lc-staging
      ;;
    esac
  export AWS_PROFILE=$aws_profile
}

aws_export_creds(){
  creds=$(aws configure export-credentials --profile $1 --format env-no-export)
  export $(echo $creds | xargs -L1)
  echo $creds | pbcopy
  echo "Profile $1 credentials exported to env vars and in clipboard!"
}