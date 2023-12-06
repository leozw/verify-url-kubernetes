FROM alpine:latest
RUN apk --no-cache add curl
COPY check_endpoint_bearer_auth.sh /usr/local/bin/check_endpoint.sh
RUN chmod +x /usr/local/bin/check_endpoint.sh
CMD ["/bin/sh", "-c", "/usr/local/bin/check_endpoint.sh $ENDPOINT_URL $BEARER_TOKEN"]