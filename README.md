# Packer Integration: proxmox

[![Container Release (Packer Proxmox)](https://github.com/leberkaslabs/packer-integration-proxmox/actions/workflows/build-push-action.yml/badge.svg)](https://github.com/leberkaslabs/packer-integration-proxmox/actions/workflows/build-push-action.yml)

HashiCorp Packer Docker image with built-in Proxmox and Ansible integrations.

> [!TIP]
> This image is particularly well-suited for isolated environments!

```bash
docker pull dudecalledbro/packer-integration-proxmox:latest
```

## Build

This image build is scheduled with GitHub Actions and will be pushed to DockerHub. The image will also be rebuilt, if the `main` branch is updated. If you need to build the image locally, ensure [Docker](https://docs.docker.com/engine/installation/) is installed and execute the following:

```bash
docker build -t packer-integration-proxmox:latest .
```

## License

Copyright (c) 2026 Niclas Spreng
