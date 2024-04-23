FROM frrouting/frr

ENV ENV="/root/.shrc"

RUN apk add --no-cache iproute2

COPY conf/frr_daemons.conf /etc/frr/daemons
COPY conf/.shrc /root
COPY scripts/router.sh ./startup.sh

ENTRYPOINT [ "sh", "startup.sh" ]
