# Sync Wiki to Branch

Github action to one-way synchronize changes from the repository wiki to a specific branch in the repository, where it is easier to backup the wiki.

This is possible because under the hood Github Wikis are themselves git repos that are converted to wikis using something like a custom fork of [Gollum](https://github.com/gollum/gollum/wiki).

Note that this action will only work on Github and will not function correctly in Github Enterprise.

## Usage

The following is an example workflow. Note that the action executes `on: gollum`, an event that runs when someone creates or updates a Wiki page. Note also that this sets `permissions` for `contents: write`. The token is [automatically created](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#using-the-github_token-in-a-workflow) per run, but you must specify the [necessary permission](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#permissions-for-the-github_token) in order for the job to be able to push changes. If you see an error like `remote: Write access to repository not granted.`, check to ensure you have the right permissions.

```yml
name: Synchronize the Wiki

jobs:
  on: gollum
  sync:
    runs-on: ubuntu-latest
    permissions:
      contents: write
    steps:
      - uses: lonnen/sync-wiki-to-branch-action@v1.2.3
        with:
          branch: wiki
          github_token: ${{ secrets.GITHUB_TOKEN }}
```

## inputs

- `branch` The name of the repository branch that shouldbe used to track the wiki, default: wiki
- `github_token` A token with sufficient write permissions. It is recommended that you use automatic token generation as shown in the example

## License

This project is released under the MIT License as described in the LICENSE file