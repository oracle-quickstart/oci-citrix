#!/bin/bash

########################################
###   Install ADC BLX on a VM        ###
########################################



## Install pre-req packages 
yum install -y epel-release systemd crontabs ethtool glibc libstdc++ libgcc zlib perl perl-Sys-Syslog

mkdir /var/blxinstall

cd /var/blxinstall

wget -O ${adc_blx_object_name} ${install_package_url}

if [ -f ${adc_blx_object_name} ]; then
  tar -xvzf ${adc_blx_object_name}

  adc_blx_version=$(basename "${adc_blx_object_name}" .tgz)

  cd $adc_blx_version
   
  if [ $? -eq 0 ]; then
    yum install -y blx-*
    systemctl start blx    
  else
    echo "Failed to install ADC BLX. Cannot open folder /var/blxinstall/$adc_blx_version "
    exit 1
  fi

else
   echo "Failed to install ADC BLX. Cannot read /var/blxinstall/${adc_blx_object_name} "
   exit 1
fi

echo "ADC BLX $adc_blx_version installed successfully"

echo "waiting up to 300 seconds for blx.service to activate"
timeout 300 /bin/bash -c \
  'until [ "active" == "$(systemctl is-active blx)" ]; do echo waiting for blx.service to activate...; sleep 10; done'
echo "done"

if [ 0 -eq $blx-is-active ]; then
   echo "ADC BLX $adc_blx_version blx service is running"
else
   echo "ADC BLX $adc_blx_version blx service not running"
fi