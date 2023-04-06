#!/bin/sh -l

https://github.com/lonnen/legion-of-ravens.wiki.git

echo "${{ github.repository }}.git"
echo "${{ github.repository }}.wiki.git"

# this isn't right, but somethign like this could be...
# git clone ${{ github.github_server_url }}/${{ github.repository }}.wiki.git wiki
# cd wiki
# git remote add main ${{ github.github_server_url }}/${{ github.repository }}.git
# git push main master:${{ TARGET_BRANCH }}