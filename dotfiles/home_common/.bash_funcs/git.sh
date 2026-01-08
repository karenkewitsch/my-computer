
git_branch_done() {
    feature_branch=$(git rev-parse --abbrev-ref HEAD)
    default_branch=$(git remote show origin | sed -n '/HEAD branch/s/.*: //p')
    git checkout $default_branch
    git pull
    git branch -d $feature_branch
}