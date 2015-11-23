#!/bin/bash

# Check for duplicity 
DUPLICITY=$(which duplicity)
test -x ${DUPLICITY} || exit 0

# Check for credentials and load them
test -f ".credentials.conf" || exit 0
source ".credentials.conf"

export PASSPHRASE
export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export BACKUP_SERVER

bold=$(tput bold)
normal=$(tput sgr0)
echo "Command to run: ${bold}duplicity $@ ${BACKUP_SERVER}${normal}"

PS3='Please enter your choice: '
options=("Confirm" "Quit")
select opt in "${options[@]}"
do
    case $opt in
	"Confirm")
	    ${DUPLICITY} "$@" ${BACKUP_SERVER}
	    break
	    ;;
	"Quit")
	    break
	    ;;
	*) echo invalid option;;
    esac
    done

unset PASSPHRASE
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset BACKUP_SERVER
