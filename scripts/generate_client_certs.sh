#!/bin/bash

read -p "Please enter the CN: " CN

SUBJECT_CLIENT="/C=AE/ST=Dubai/L=Dubai/O=RAZRLAB/OU=Client/CN=$CN"


function generate_client () {
   echo "$SUBJECT_CLIENT"
   openssl req -new -nodes -sha256 -subj "$SUBJECT_CLIENT" -out $PWD/../config/certs/client-${CN//.}.csr -keyout $PWD/../config/certs/client-${CN//.}.key 
   openssl x509 -req -sha256 -in $PWD/../config/certs/client-${CN//.}.csr -CA $PWD/../config/certs/ca.crt -CAkey $PWD/../config/certs/ca.key -CAcreateserial -out $PWD/../config/certs/client-${CN//.}.crt -days 365
}

generate_client