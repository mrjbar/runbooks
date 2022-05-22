#!/bin/bash

# Test Domain
DOMAIN=$1

# Get list of cipher suite support
CIPHER_LIST=$(openssl ciphers ALL | tr ":" " ")

# Get length of ciphers list
CIPHER_LIST_LENGTH=$(echo $CIPHER_LIST | wc -w | tr -d '[:space:]') 

# Set unsupported cipher color to red
RED='\033[0;31m'

# Set supported cipher color to green
GREEN='\033[0;32m'

# No Color
NC='\033[0m'

# Supported cipher count
SUPPORTED_CIPHER_COUNT=0

printf "Support\tCipher\n"
for cipher in $CIPHER_LIST
do 
    SUPPORTED_CIPHER=$(echo | openssl s_client -connect $DOMAIN:443 -cipher $cipher 2> /dev/null | awk '/Cipher is/ {print $5}')
    if [[ $SUPPORTED_CIPHER =~ "NONE" ]]
    then        
        printf "${RED}✕\t%s\n" $cipher 

    else
        printf "${GREEN}✓\t%s\n" $cipher 
        ((SUPPORTED_CIPHER_COUNT++))
    fi
done
echo -e "${NC}\n--------------------------------------------------"
echo -e "\n$DOMAIN supports $SUPPORTED_CIPHER_COUNT/$CIPHER_LIST_LENGTH ciphers"
