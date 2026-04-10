FROM hashicorp/packer:1.15.1

LABEL org.opencontainers.image.source="https://github.com/leberkaslabs/packer-integration-proxmox"

# Update system packages and install necessary dependencies
ENV TZ=Europe/Berlin
RUN apk upgrade --no-cache \
    && apk add --no-cache \
        bash \
        ca-certificates \
        dotenv \
        openssh-client \
        openssl \
        py3-pip \
        python3 \
        rsync \
        sshpass \
        sudo \
    && ln -fs /usr/sahre/zoneinfo/${TZ} /etc/localtime

# Configure Packer plugin path and initialize plugins
ARG PACKER_PLUGIN_PATH=/root/.config/packer/plugins
RUN --mount=type=bind,source=versions.pkr.hcl,target=versions.pkr.hcl \
    mkdir -p $PACKER_PLUGIN_PATH \
    && packer init .

# Disable Packer telemetry to prevent sending data during builds
ENV CHECKPOINT_DISABLE=1

# Bind and install Python dependencies in a virtual environment
RUN --mount=type=bind,source=requirements.txt,target=requirements.txt \
    python3 -m venv /opt/venv \
    && . /opt/venv/bin/activate \
    && python3 -m pip install --no-cache-dir --requirement requirements.txt \
    && python3 -m pip cache purge
ENV PATH="/opt/venv/bin:${PATH}"

# Clear the default entrypoint, allowing overriding during 'docker run'
ENTRYPOINT []
