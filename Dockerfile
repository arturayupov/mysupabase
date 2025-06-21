FROM alpine:latest
COPY configure-kong.sh /app/configure-kong.sh
WORKDIR /app
RUN chmod +x configure-kong.sh
CMD ["./configure-kong.sh"]
