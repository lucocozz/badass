FROM base_router

COPY scripts/router.sh /startup.sh

ENTRYPOINT [ "sh", "/startup.sh" ]