FROM busybox:musl

COPY scripts/host.sh ./startup.sh

ENTRYPOINT [ "sh", "startup.sh" ]
