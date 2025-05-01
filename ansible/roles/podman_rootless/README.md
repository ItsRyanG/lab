# Podman Rootless Role

This role sets up a rootless Podman installation for a dedicated user (default: `poduser`).

## What it does:
- Creates a non-root user (`poduser` by default)
- Installs Podman
- Configures lingering so user services can persist
- Starts and enables the Podman API socket under that user