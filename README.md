# SwiftUI Concepts

A set of proo-of-concept (PoC) projects centered around the SwiftUI framework.

## Repo structure

All projects are added as a sub-folder at the root of the repository.

Special folders are `script` and `template`.

## Creating a new project

Create from default template:

    ./scripts/from-template My-Concept myconcept

### Renaming a project

Create from another project/template:

    ./scripts/from-template Your-Concept yourconcept My-Concept myconcept

## Signing your commits

Create a `gitconfig.user` file filling in the following fields:

```
[user]
  signingkey = ABCDEF012345678
  name = YOUR_USERNAME
  email = YOUR_USERNAME@users.noreply.github.com
```

Include your configuration.

    git config include.path ../gitconfig

To encrypt your configuration.

    gpg --output gitconfig.YOUR_USERNAME.gpg --encrypt --recipient YOUR_USERNAME gitconfig.user

To decrypt your configuration.

    gpg --output gitconfig.user --decrypt gitconfig.YOUR_USERNAME.gpg

Where `YOUR_USERNAME` is your user name.
