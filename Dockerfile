FROM almalinux:10-kitten

COPY dnf.conf /etc/dnf/dnf.conf

RUN dnf install -y --nogpgcheck --repo=terra terra-gpg-keys && \
    dnf install -y --repo=extras-common epel-release && \
    dnf up -y && \
    dnf install -y \
terra-mock-configs anda-srpm-macros terra-appstream-helper redhat-rpm-config epel-rpm-macros adoptium-temurin-java-repository \
subatomic-cli anda{,-srpm-macros} rpm-build podman fuse-overlayfs mold dnf-plugins-core \
wget less gh util-linux bash bzip2 cpio diffutils findutils gawk glibc-minimal-langpack grep info patch sed tar gzip unzip which xz jq && \
    dnf clean packages dbcache
