## linux-dev-profile

> Useful set of dot-files for development on Linux

This repo provides a bunch of dot-files that I find useful during development on a Linux-based machine.

### Descriptions

##### `linux-dev.profile`

##### `.ackrc`

##### `.git-branch-shell`

##### `.gitconfig`

##### `.inputrc`

##### `.rpmmacros`

##### `.screenrc`

##### `.vimrc` (and `.vim` Folder)

### Installation

1. Clone, or download, this repository
2. Install `linux-dev.profile`, `.vim/` and `.dev-profile` into the root of your home folder
   * It is recommended to use symbolic links to do this as it means you'll easily recieve futures updates by simply running `git pull` in the repository
3. Recommended:
```
ln -s /home/user/git/linux-dev-profile/linux-dev-profile /home/user/linux-dev.profile
ln -s /home/user/git/linux-dev-profile/.dev-profile /home/user/.dev.profile
ln -s /home/user/git/linux-dev-profile/.vim /home/user/.vim
echo "source /home/user/linux-dev.profile" >> ~/.bashrc
```
