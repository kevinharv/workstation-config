FROM rockylinux:9
ENV container docker
ENV pip_packages "ansible"

RUN [ ! -f /usr/sbin/init ] && dnf -y install systemd;
RUN ([ -d /lib/systemd/system/sysinit.target.wants ] && cd /lib/systemd/system/sysinit.target.wants/ && for i in *; do [ $i == \
    systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

# Install requirements.
RUN dnf -y install rpm dnf-plugins-core \
    && dnf -y update \
    && dnf -y install \
    epel-release \
    sudo \
    which \
    hostname \
    python3 \
    python3-pip \
    python3-pyyaml \
    iproute \
    && dnf clean all

# Upgrade pip to latest version.
RUN pip3 install --upgrade pip

# Install Ansible via Pip.
RUN pip3 install $pip_packages

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]