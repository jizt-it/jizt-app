#!/bin/sh

tar -czvf secrets.tar.gz secrets
gpg --symmetric --cipher-algo AES256 secrets.tar.gz
# Enter passphrase as set set it as a secret (SECRETS_GPG_PASSPHRASE) in GitHub
rm secrets.tar.gz
