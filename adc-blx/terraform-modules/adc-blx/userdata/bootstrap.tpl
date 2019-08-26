#!/bin/bash

mkdir /var/blxinstall

cd /var/blxinstall

wget -O ${adc_blx_object_name} ${install_package_url}

tar -xvzf ${adc_blx_object_name}

rpm -ivh epel-release-latest-7.noarch.rpm

yum install -y systemd crontabs ethtool glibc libstdc++ libgcc zlib perl perl-Sys-Syslog

adc_blx_version=$(basename "${adc_blx_object_name}" .tgz)

cd $adc_blx_version

yum install -y blx-*

systemctl start blx

systemctl status blx