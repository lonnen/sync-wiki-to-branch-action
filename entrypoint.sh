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

git remote add repo "${GITHUB_TOKEN_AND_REPO_URL}".git
git push repo master:"${TARGET_BRANCH}"