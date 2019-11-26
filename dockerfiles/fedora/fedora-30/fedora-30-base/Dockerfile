# fedora-30-base
# Copyright (C) 2015-2019 Intel Corporation
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

FROM fedora@sha256:a97c0f02d78221f48d768a4b32b7d73ee70f098954ff6762551ea57f2ad55719

RUN dnf -y update && \
    dnf -y install \
        gawk \
        make \
        wget \
        tar \
        bzip2 \
        gzip \
        python \
        python3 \
        unzip \
        perl \
        patch \
        diffutils \
        diffstat \
        dumb-init \
        git \
        git-lfs \
        subversion \
        cpp \
        gcc \
        gcc-c++ \
        glibc-devel \
        glibc-langpack-en \
        texinfo \
        chrpath \
        ccache \
        perl-Data-Dumper \
        perl-Text-ParseWords \
        perl-Thread-Queue \
        perl-bignum \
        rpcgen \
        socat \
        findutils \
        which \
        cpio \
        file \
        xz \
        screen \
        tmux \
        sudo \
        hostname \
        procps && \
    useradd -U -m yoctouser

RUN dnf -y clean all

USER yoctouser
WORKDIR /home/yoctouser
CMD /bin/bash
