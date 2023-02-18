FROM stackql/stackql:latest AS stackql
FROM ghcr.io/charmbracelet/vhs
RUN mkdir -p /stackql/.keys
COPY ./keys/* /stackql/.keys
RUN mkdir -p /stackql/.auth
COPY ./auth/* /stackql/.auth
COPY --from=stackql /srv/stackql/stackql /usr/local/bin/stackql