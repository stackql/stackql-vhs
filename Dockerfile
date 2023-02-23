FROM stackql/stackql:latest AS stackql
FROM ghcr.io/charmbracelet/vhs
RUN mkdir -p /stackql/.keys
COPY ./keys/* /stackql/.keys
RUN mkdir -p /stackql/.auth
RUN apt update
RUN apt install -y python3-pip
RUN apt install -y curl
RUN apt install -y unzip
RUN pip3 install pandas
RUN cd /stackql && curl -L https://bit.ly/stackql-zip -O && unzip stackql-zip 
ENV VHS_NO_SANDBOX=1
COPY ./auth/* /stackql/.auth
COPY --from=stackql /srv/stackql/stackql /usr/local/bin/stackql