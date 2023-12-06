FROM alpine:latest
RUN apk --no-cache add curl
COPY check_endpoint_with_teams.sh /usr/local/bin/check_endpoint.sh
COPY teams_message.json /teams_message.json
RUN chmod +x /usr/local/bin/check_endpoint.sh
CMD ["/bin/sh", "-c", "/usr/local/bin/check_endpoint.sh $ENDPOINT_URL $BEARER_TOKEN $TEAMS_WEBHOOK_URL"]