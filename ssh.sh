#!/usr/bin/env bash

echo "Generating ssh keypair"
echo 'What is the name of this machine (comment for pub ssh key)'
IFS=
read machineName

ssh-keygen -t rsa -C $machineName
echo "To copy your public key later use 'pubkey' alias"