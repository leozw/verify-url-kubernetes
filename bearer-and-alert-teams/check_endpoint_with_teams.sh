#!/bin/sh

ENDPOINT_URL=$1
BEARER_TOKEN=$2
TEAMS_WEBHOOK_URL=$3
TIMEOUT=5

# Variável para verificar se já foi enviado o status
STATUS_SENT=false

# Função para enviar a mensagem para o Teams
send_teams_message() {
  MESSAGE=$1
  curl -H "Content-Type: application/json" -X POST -d "{\"text\": \"$MESSAGE\"}" $TEAMS_WEBHOOK_URL
}

# Verifica se o endpoint está acessível
if curl --output /dev/null --silent --head --fail --max-time $TIMEOUT -H "Authorization: Bearer $BEARER_TOKEN" $ENDPOINT_URL; then
    echo "Endpoint está OK: $ENDPOINT_URL"
    
    # Verifica se o status já foi enviado
    if [ "$STATUS_SENT" = false ]; then
      send_teams_message "Endpoint está OK: $ENDPOINT_URL"
      STATUS_SENT=true
    fi
    
    exit 0
else
    ERROR_MESSAGE="Erro ao acessar o endpoint: $ENDPOINT_URL"
    echo $ERROR_MESSAGE
    
    # Verifica se o status já foi enviado
    if [ "$STATUS_SENT" = false ]; then
      send_teams_message "$ERROR_MESSAGE"
      STATUS_SENT=true
    fi
    
    exit 1
fi
