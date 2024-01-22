#!/bin/sh -l
set -e

GITHUB_TOKEN_AND_REPO_URL="https://github-actions:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}"

git clone "${GITHUB_TOKEN_AND_REPO_URL}".wiki.git wiki
cd wiki
git remote add main "${GITHUB_TOKEN_AND_REPO_URL}".git
git push main master:"${TARGET_BRANCH}"