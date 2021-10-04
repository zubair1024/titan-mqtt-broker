#!/bin/bash

echo $PWD

read -p "Please enter the DNS: " DNS

SUBJECT_CA="/C=SE/ST=Stockholm/L=Stockholm/O=himinds/OU=CA/CN=$DNS"
SUBJECT_SERVER="/C=SE/ST=Stockholm/L=Stockholm/O=himinds/OU=Server/CN=$DNS"

function generate_CA () {
   echo "$SUBJECT_CA"
   openssl req -x509 -nodes -sha256 -newkey rsa:2048 -subj "$SUBJECT_CA"  -days 365 -keyout $PWD/../config/certs/ca.key -out $PWD/../config/certs/ca.crt
}

function generate_server () {
   echo "$SUBJECT_SERVER"
   openssl req -nodes -sha256 -new -subj "$SUBJECT_SERVER" -keyout $PWD/../config/certs/server.key -out $PWD/../config/certs/server.csr
   openssl x509 -req -sha256 -in $PWD/../config/certs/server.csr -CA $PWD/../config/certs/ca.crt -CAkey $PWD/../config/certs/ca.key -CAcreateserial -out $PWD/../config/certs/server.crt -days 365
}

generate_CA
generate_server