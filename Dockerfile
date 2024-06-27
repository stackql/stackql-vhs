# FROM stackql/stackql:latest AS stackql
FROM ghcr.io/charmbracelet/vhs

RUN apt update
RUN apt install -y \
    python3-pip \
    python3-venv \
    curl \
    unzip \
    git

# Create a virtual environment and install pandas
RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install pystackql

RUN cd /usr/local/bin/ && \
    curl -L https://bit.ly/stackql-zip -O && \
    unzip stackql-zip && \
    chmod +x /usr/local/bin/stackql

ENV VHS_NO_SANDBOX=1

# COPY --from=stackql /srv/stackql/stackql /usr/local/bin/stackql

# Ensure the virtual environment is activated by default
ENV PATH="/opt/venv/bin:/usr/local/bin:$PATH"
