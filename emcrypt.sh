#!/bin/bash

path=$1
encpath='crypt/'
encoder='aes-256-cbc'
pass=$2

#echo 'FILE: '$file
#echo 'PATH: '$path
#echo 'ENCPATH: '$encpath
#echo 'ENCODER: '$encoder
#echo 'PASS: '$pass

mkdir $encpath

#Creates de alternative folder structure to crypted files
find $path -type d -exec mkdir $encpath{} \;

#Encript all files in the passed pass
find $path -name '*.*' -exec openssl enc -$encoder -e -in {} -out $encpath{}.enc -pass pass:$pass \;

#openssl enc -$encoder -d -in $file.enc -out $file.denc -pass pass:$pass

