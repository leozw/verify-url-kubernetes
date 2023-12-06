#!/bin/sh

ENDPOINT_URL=$1
TIMEOUT=5

if curl --output /dev/null --silent --head --fail --max-time $TIMEOUT $ENDPOINT_URL; then
    echo "Endpoint está OK: $ENDPOINT_URL"
    exit 0
else
    echo "Erro ao acessar o endpoint: $ENDPOINT_URL"
    exit 1
fi