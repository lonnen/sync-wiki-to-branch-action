#!/bin/sh -l

if [ -z "$GITHUB_TOKEN" ]; then
    # shellcheck disable=SC2016
    echo '$GITHUB_TOKEN is unset or empty, check your actions configuration'
    exit 1
fi

# GITHUB_REPOSITORY is automatically injected by actions and does not need a check

GITHUB_TOKEN_AND_REPO_URL="https://github-actions:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}"

git clone "${GITHUB_TOKEN_AND_REPO_URL}".wiki.git wiki
if [ $? -ne 0 ]; then
    echo "Failed to check out ${GITHUB_TOKEN_AND_REPO_URL}.wiki.git"
    echo "please check your actions configuration"
    exit 1
fi

cd wiki || echo "cannot change into repository directory" && exit 1

if ! git remote add repo "${GITHUB_TOKEN_AND_REPO_URL}".git; then
    echo "Failed to add remote ${GITHUB_TOKEN_AND_REPO_URL}.git"
    echo "please check your actions configuration"
    exit 1
fi

if git push repo master:"${TARGET_BRANCH}"; then
    echo "Failed to push the wiki's master branch from $GITHUB_TOKEN_AND_REPO_URL.git.wiki to branch $TARGET_BRANCH of $GITHUB_TOKEN_AND_REPO_URL.git"
    echo "please check that $TARGET_BRANCH can receive a fast-forward push from the wiki"
    echo "this may happen if you've updated the branch without going through the wiki,"
    echo "maybe when updating a dotfile or similar that doesn't show up in the GitHub wiki UI."
    echo "You may need to check out the wiki yourself and force push it over $TARGET_BRANCH to fix."
    echo "Please proceed carefully, force pushing may result in data loss."
    exit 1
fi