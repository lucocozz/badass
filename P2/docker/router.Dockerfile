FROM frrouting/frr

ENV ENV="/root/.shrc"

RUN apk add --no-cache iproute2

COPY conf/frr_daemons.conf /etc/frr/daemons
COPY conf/.shrc /root
COPY conf/router_1.sh .
COPY conf/router_2.sh .
