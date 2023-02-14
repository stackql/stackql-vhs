FROM stackql/stackql:latest AS stackql
FROM ghcr.io/charmbracelet/vhs
COPY --from=stackql /srv/stackql/stackql /usr/local/bin/stackql