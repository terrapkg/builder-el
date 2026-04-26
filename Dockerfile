FROM registry.fedoraproject.org/eln:latest

COPY dnf.conf /etc/dnf/dnf.conf

RUN curl https://cli.github.com/packages/rpm/gh-cli.repo -o /etc/yum.repos.d/gh-cli.repo
RUN dnf install -y --nogpgcheck --repo=terra terra-gpg-keys
RUN dnf up -y
RUN dnf install -y \
        terra-mock-configs anda-srpm-macros terra-appstream-helper redhat-rpm-config epel-rpm-macros almalinux-release adoptium-temurin-java-repository \
        subatomic-cli anda{,-srpm-macros} rpm-build podman fuse-overlayfs mold dnf-plugins-core \
        wget less gh util-linux bash bzip2 cpio diffutils findutils gawk glibc-minimal-langpack grep info patch sed tar gzip unzip which xz jq
RUN dnf clean all
