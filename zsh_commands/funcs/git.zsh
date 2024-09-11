
git_branch_done() {
    feature_branch=$(git rev-parse --abbrev-ref HEAD)
    git checkout master
    git pull
    git branch -d $feature_branch
}