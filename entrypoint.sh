#!/bin/sh -l

https://github.com/lonnen/legion-of-ravens.wiki.git

echo "${{ github.repository }}.git"
echo "${{ github.repository }}.wiki.git"

# this isn't right, but somethign like this could be...
# git clone ${{ github.github_server_url }}/${{ github.repository }}.git repo
# cd repo
# git remote add ${{ github.github_server_url }}/${{ github.repository }}.wiki.git
# git push repo master: ${{ TARGET_BRANCH }}