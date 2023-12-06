#!/bin/sh

ENDPOINT_URL=$1
BASIC_AUTH_USERNAME=$2
BASIC_AUTH_PASSWORD=$3
TIMEOUT=5

if curl --output /dev/null --silent --head --fail --max-time $TIMEOUT -u "$BASIC_AUTH_USERNAME:$BASIC_AUTH_PASSWORD" $ENDPOINT_URL; then
    echo "Endpoint está OK: $ENDPOINT_URL"
    exit 0
else
    echo "Erro ao acessar o endpoint: $ENDPOINT_URL"
    exit 1
fi