#!/bin/env bash

# Check if root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root!"
  exit
fi

# Install git if not installed
printf "'git' installed?"
if ! dpkg -s git >/dev/null 2>&1
then
    printf ' [NO]\n'
    echo "Installing 'git'..."
    apt update >/dev/null
    if apt -y install git
    then
        echo "'git' successfully installed"
    else
        echo "Failed to install 'git'!"
        exit
    fi
else
    printf ' [YES]\n'
fi

# Install build-essential if not installed
printf "'build-essential' installed?"
if ! dpkg -s build-essential >/dev/null 2>&1
then
    printf ' [NO]\n'
    echo "Installing 'build-essential'..."
    apt update >/dev/null 2>&1
    if apt -y install build-essential
    then
        echo "'build-essential' installed"
    else
        echo "Failed to install 'build-essential'!"
        exit
    fi
else
    printf ' [YES]\n'
fi

cd /tmp
mkdir hashcat_install
cd hashcat_install


echo "Cloning 'hashcat' repository..."
if ! git clone https://github.com/hashcat/hashcat.git >/dev/null
then
    echo "Could not clone 'hashcat' repository!"
    exit
fi
cpu_count=$(nproc)
echo "Building 'hashcat' with $cpu_count cores..."
cd hashcat
if ! make -j$cpu_count >/dev/null
then
    echo "Could not build 'hashcat'!"
    rm -rf /tmp/hashcat_install
    exit
fi

if ! make install >/dev/null
then
    echo "Could not install 'hashcat'!"
    rm -rf /tmp/hashcat_install
    exit
fi

echo "Cleaning up..."
rm -rf /tmp/hashcat_install
echo "Done."
