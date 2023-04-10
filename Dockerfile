FROM alpine/git:3.10
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]