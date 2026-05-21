ARG RUST_VERSION=1.95.0-trixie
FROM rust:${RUST_VERSION}

LABEL org.opencontainers.image.source="https://github.com/vishvish/forgejo-rust-job-image"
LABEL org.opencontainers.image.description="Rust job image for Forgejo runners with a writable /var/run/act directory."

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates git nodejs \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f /var/run \
    && mkdir -p /var/run/act \
    && chmod 755 /var/run /var/run/act

WORKDIR /workspace
