FROM frrouting/frr

RUN apk add --no-cache iproute2

COPY conf/frr_daemons.conf /etc/frr/daemons
