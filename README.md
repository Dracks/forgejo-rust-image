# forgejo-rust-job-image

Custom Rust job image for Forgejo runners.

## Why this exists

`rust:1.95.0-trixie` trips Forgejo Runner / act when it tries to copy job content into `/var/run/act`:

```text
mkdirat var/run/act: path escapes from parent
```

This image removes the `/var/run` symlink and creates a real writable `/var/run/act` directory.

## Local build

```sh
docker compose build
docker compose run --rm rust-job-image
```

## GitHub Container Registry

The workflow publishes:

```text
ghcr.io/<owner>/forgejo-rust-job
```

## Configuration

Set these GitHub repository secrets or environment variables for local testing:

```text
GHCR_OWNER=vishvish
RUST_VERSION=1.95.0-trixie
```
