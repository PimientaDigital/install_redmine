#!/usr/bin/env bash

PROGRAM="puppet"
PACKAGE="puppet-common"
PACKAGE_CENTOS="puppet"

$(which puppet > /dev/null 2>&1)

FOUND=$?

if [ "$FOUND" -ne '0' ]; then
  echo "Attempting to install  ${PROGRAM} ."
  $(which apt-get > /dev/null 2>&1)
  FOUND_APT=$?
  $(which yum > /dev/null 2>&1)
  FOUND_YUM=$?
 
  if [ "${FOUND_YUM}" -eq '0' ]; then
    sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
    #sudo yum update
    sudo yum repolist
    yum -q -y install "${PACKAGE_CENTOS}"
    echo '${PROGRAM} installed.'
  elif [ "${FOUND_APT}" -eq '0' ]; then
    apt-get -q -y update
    apt-get -q -y install "${PACKAGE}"
    echo '${PROGRAM} installed.'
  else
    echo 'No package installer available. You may need to install ${PACKAGE} manually.'
  fi
else
  echo '${PROGRAM} found.'
fi
