FROM almalinux:latest

COPY dnf.conf /etc/dnf/dnf.conf

RUN curl https://cli.github.com/packages/rpm/gh-cli.repo -o /etc/yum.repos.d/gh-cli.repo &\
    dnf install -y --nogpgcheck --repo=terra terra-gpg-keys && \
    dnf up -y && \
    dnf install -y epel-release && \
    dnf install -y \
        terra-mock-configs terra-mock-gpg-keys anda-srpm-macros terra-appstream-helper redhat-rpm-config epel-rpm-macros almalinux-release adoptium-temurin-java-repository \
        subatomic-cli anda{,-srpm-macros} rpm-build podman fuse-overlayfs mold dnf-plugins-core \
        wget less gh util-linux bash bzip2 cpio diffutils findutils gawk glibc-minimal-langpack grep info patch sed tar gzip unzip which xz jq &&\
    dnf clean all
