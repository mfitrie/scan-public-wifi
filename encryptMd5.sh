#!/bin/zsh

echo "";
echo "Enter your word to encrypt MD5";

read wordToEncrypt;

#echo "Your word is: $wordToEncrypt";


echo "";
echo "Your word encrypted is: ";

echo -n $wordToEncrypt | md5sum | awk '{print $1}'
