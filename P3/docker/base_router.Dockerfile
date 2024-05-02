FROM frrouting/frr
ENV ENV="/root/.shrc"

RUN apk add --no-cache iproute2

COPY configs/frr_daemons.conf /etc/frr/daemons
COPY configs/vtysh.conf /etc/frr/
COPY configs/.shrc /root
