aws_login(){
  case $1 in
    prod)
      aws_profile=lc-production
      aws sso login --profile lc-production --no-browser
      ;;
    staging)
      aws_profile=lc-staging
      aws sso login --profile $aws_profile
      ;;
    ecr)
      aws_profile=lc-ecr
      aws sso login --profile $aws_profile
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

aws_ecr_docker(){
  aws ecr get-login-password --profile lc-ecr | docker login --username AWS --password-stdin 898565779239.dkr.ecr.eu-central-1.amazonaws.com
}