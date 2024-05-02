FROM base_router

COPY scripts/bgp_router.sh /startup.sh

ENTRYPOINT [ "sh", "/startup.sh" ]