## linux-dev-profile

> Useful set of dot-files for development on Linux

This repo provides a bunch of dot-files that I find useful during development on a Linux-based machine.

### Descriptions

##### `linux-dev.profile`

By default, if you attempt to access a variable that is not declared, `bash` won't mind and just return that the variable is empty:

```
jas@ubuntu:~> echo $VAR_NO_EXIST

jas@ubuntu:~> 
```

For me, this behaviour is annoying and bad practice. Fortunately you can tell `bash` to error if it finds a variable referenced that doesn't exist with `set -u`:

```
jas@ubuntu:~> set -u
jas@ubuntu:~> echo $VAR_NO_EXIST
bash: VAR_NO_EXIST: unbound variable
jas@ubuntu:~> 
jas@ubuntu:~> echo $?
1
```

*However*, if you enable this in your profile, there is a good chance that some of the auto-complete scripts that you use **will** break with this enabled. *So use at your own risk!* I've commented out the `set` in the committed file.

##### `.ackrc`

##### `.git-branch-shell`

##### `.gitconfig`

##### `.inputrc`

##### `.rpmmacros`

##### `.screenrc`

##### `.vimrc` (and `.vim` Folder)

### Installation

1. Clone, or download, this repository
2. Run `install-profile.sh`:

```
jas@ubuntu:~$ ./git/linux-dev-profile/install-profile.sh 

*** Linux DEV Profile Installer ***

‘/home/jas/.dev-profile’ -> ‘/home/jas/git/linux-dev-profile/.dev-profile’
‘/home/jas/.vim’ -> ‘/home/jas/git/linux-dev-profile/.vim’
Target file (/home/jas/.gitconfig) already exists on disk. Will not overwrite.
‘/home/jas/.inputrc’ -> ‘/home/jas/git/linux-dev-profile/.dev-profile/.inputrc’
‘/home/jas/.rpmmacros’ -> ‘/home/jas/git/linux-dev-profile/.dev-profile/.rpmmacros’
‘/home/jas/.screenrc’ -> ‘/home/jas/git/linux-dev-profile/.dev-profile/.screenrc’
‘/home/jas/.ackrc’ -> ‘/home/jas/git/linux-dev-profile/.dev-profile/.ackrc’
Linux DEV profile has already been sourced. Will not add again.

INSTALL COMPLETE
```

*NOTE*: That this script will not overwrite any scripts if they already exist in the expected target of the file (as shown in the example output above).

[![Analytics](https://ga-beacon.appspot.com/UA-54104883-4/linux-dev-profile/README)](https://github.com/jasraj/linux-dev-profile)
