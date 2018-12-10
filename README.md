# git-semver

This is a simple PowerShell script that will generate SemVer 2.0 compatible string for the current commit based only on Git tag and describe command.

## Try it out

### [master](https://github.com/adriangodong/git-semver/tree/master)

This branch has initial unreleased changes. Notice that the we should create `0.0.0` tag as a prequisite.

```
> .\semver.ps1
Commit semver is 0.0.1-1-abcdef01
```

### [release/0.0.1](https://github.com/adriangodong/git-semver/tree/release/0.0.1)

This branch is released as 0.0.1.

```
> .\semver.ps1
Commit semver is 0.0.1
```

### [hotfix/0.0.1](https://github.com/adriangodong/git-semver/tree/hotfix/0.0.1)

This branch is forked from 0.0.1 and contains unreleased changes that would become 0.0.2.

```
> .\semver.ps1
Commit semver is 0.0.2-1-abcdef01
```
