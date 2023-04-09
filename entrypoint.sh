#!/bin/sh -l
set -e

GITHUB_FULL_REPO_URL="${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}"

git clone "${GITHUB_FULL_REPO_URL}".wiki.git wiki
cd wiki
git remote add main "${GITHUB_FULL_REPO_URL}".git
git push main master:"${TARGET_BRANCH}"