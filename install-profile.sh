#!/usr/bin/env bash

## Installer for Linux DEV Profile
## Copyright (C) 2014 Jaskirat M.S. Rajasansir
## License BSD, see LICENSE for details

readonly PROGNAME=$(basename $0)
readonly PROGDIR=$(readlink -m $(dirname $0))

readonly INSTALL_FROM=$1

readonly FILES_TO_ROOT=( .gitconfig .inputrc .rpmmacros .screenrc .ackrc )

readonly DEFAULT_INSTALL_FROM=~/git/linux-dev-profile

set -eu

main()
{
    echoInf "\n*** Linux DEV Profile Installer ***\n"

    if [[ $INSTALL_FROM == "" ]]; then
        local source=$DEFAULT_INSTALL_FROM
    else
        local source=$INSTALL_FROM
    fi

    createSymLink ${source}/.dev-profile ~/.dev-profile
    createSymLink ${source}/.vim ~/.vim

    for install_file in ${FILES_TO_ROOT[@]}; do
        local source_file=${source}/.dev-profile/$install_file
        local target_file=~/$install_file

        createSymLink $source_file $target_file
    done

    appendToBashRc

	echoInf "\nINSTALL COMPLETE\n"
}

createSymLink()
{
    local source_file=$1
    local target_file=$2

    if [[ -e $target_file ]]; then
        echoInf "Target file ($target_file) already exists on disk. Will not overwrite."
        return
    fi

    ln -vs $source_file $target_file
}

appendToBashRc()
{
    local is_sourced=$(grep -q linux-dev.profile ~/.bashrc; echo $?)

	if [[ $is_sourced -eq 0 ]]; then
        echoInf "Linux DEV profile has already been sourced. Will not add again."
        return
    fi

    echoInf "Adding linux-dev.profile to be sourced on log in"
    echo -e "\nsource ${source}/linux-dev.profile" >> ~/.bashrc
}

echoInf()
{
    echo -e "$*"
}

echoErr()
{
    echo -e "$*" >&2
}

main
