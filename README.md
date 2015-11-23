# simplicity
A set of Bash scripts to ease Duplicity usage.

Designed for using [Amazon Simple Storage Service (S3)](https://aws.amazon.com/s3) as the backup server in mind.

### Getting Started

#### Edit your custom credentials and paths `vi scripts\.credentials.conf` 

```shell
PASSPHRASE='XXXXXXXXX'
AWS_ACCESS_KEY_ID='XXXXXXXXX'
AWS_SECRET_ACCESS_KEY='XXXXXXXXX'

GPG_KEY='XXXXXXX'
BACKUP_SERVER="s3://s3-us-west-2.amazonaws.com/mybucket/backup"
```
#### Make the scripts executable and adjust credentials permissions

```shell
$ chmod 755 scripts/*.sh
$ chmod 700 scripts/.credentials.conf
```

### Overview

There are two basic scripts that are just wrappers of the main duplicity program, that makes it easy to use them from the console with the proper configuration already set.

* `duplicity_to_target.sh <parameters>` -> RUNS -> `duplicity <parameters> ${BACKUP_SERVER}`

* __TO-DO__ `duplicity_from_target.sh <parameters>` -> RUNS -> `duplicity <parameters except last one> ${BACKUP_SERVER} <last parameter>`

### Usage example

```shell
$ duplicity_to_target.sh cleanup --extra-clean

Command to run: duplicity cleanup --extra-clean s3://s3-us-west-2.amazonaws.com/mybucket/backup
1) Confirm
2) Quit
Please enter your choice: 1
/usr/bin/duplicity cleanup --extra-clean s3://s3-us-west-2.amazonaws.com/mybucket/backup
```
