#!/bin/bash

# runbitbake.py
#
# Copyright (C) 2016 Intel Corporation
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

set -e

# DISTRO_TO_BUILD is essentially the prefix to the "base" and "builder"
# directories you plan to use. i.e. "fedora-23" or "ubuntu-14.04"

# First build the base
TAG=$DISTRO_TO_BUILD-base
dockerdir=`find -name $TAG`
workdir=`mktemp --tmpdir -d tmp-$TAG.XXX`

cp -r $dockerdir $workdir
workdir=$workdir/$TAG

cd $workdir

baseimage=`grep FROM Dockerfile | sed -e 's/FROM //'`
podman pull $baseimage

podman build \
       --build-arg http_proxy=$http_proxy \
       --build-arg HTTP_PROXY=$http_proxy \
       --build-arg https_proxy=$https_proxy \
       --build-arg HTTPS_PROXY=$https_proxy \
       --build-arg no_proxy=$no_proxy \
       --build-arg NO_PROXY=$no_proxy \
       -t $REPO:$TAG .
rm $workdir -rf
cd -
