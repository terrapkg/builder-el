FROM registry.fedoraproject.org/eln:latest

COPY dnf.conf /etc/dnf/dnf.conf

RUN dnf install -y --nogpgcheck --repo=terra terra-gpg-keys && \
    dnf up -y && \
    dnf install -y \
terra-mock-configs subatomic-cli anda{,-srpm-macros} terra-appstream-helper terra-sccache epel-rpm-macros podman fuse-overlayfs \
mold dnf5-plugins wget less util-linux-script mold sudo jq @buildsys-build && \
    dnf clean packages dbcache
