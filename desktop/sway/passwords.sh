#!/usr/bin/env bash

cd $HOME/Passwords
for file in $(find . -name "*.gpg")
do
  echo "${file%.gpg}" | sed "s/^.\///g"
done
