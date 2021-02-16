#!/bin/sh

# Decrypt file
# --batch to prevent interactive command --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="$SECRETS_GPG_PASSPHRASE" \
--output secrets.tar.gz secrets.tar.gz.gpg
# Extract secrets folder
tar -xzf secrets.tar.gz
