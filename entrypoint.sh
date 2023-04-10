#!/bin/sh -l
set -e

GITHUB_FULL_REPO_URL="${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}"
GITHUB_TOKEN_AND_REPO_URL="https://${TOKEN}@github.com"

git clone "${GITHUB_TOKEN_AND_REPO_URL}".wiki.git wiki
cd wiki
git remote add main "${GITHUB_TOKEN_AND_REPO_URL}".git
git push main master:"${TARGET_BRANCH}"