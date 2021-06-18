#!/bin/bash

mkdir app1
cd app1
git init
git config core.sparseCheckout true
git remote add origin  https://github.com/cswclui/vlab
echo "labconfig/" >> .git/info/sparse-checkout
git pull origin master
