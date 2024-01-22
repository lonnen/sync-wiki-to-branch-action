#!/bin/sh -l
set -e

if [ -z "$GITHUB_TOKEN" ]; then
    # shellcheck disable=SC2016
    echo '$GITHUB_TOKEN is unset or empty, check your actions configuration'
    exit 1
fi

GITHUB_TOKEN_AND_REPO_URL="https://github-actions:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}"

git clone "${GITHUB_TOKEN_AND_REPO_URL}".wiki.git wiki
cd wiki
git remote add repo "${GITHUB_TOKEN_AND_REPO_URL}".git
git push repo master:"${TARGET_BRANCH}"