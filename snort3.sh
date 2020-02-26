#!/bin/bash
sudo apt-get update
mkdir ~/snort_src;cd ~/snort_src
sudo apt-get install -y build-essential autotools-dev libdumbnet-dev \
libluajit-5.1-dev libpcap-dev zlib1g-dev pkg-config libhwloc-dev \
cmake
sudo apt-get install -y liblzma-dev openssl libssl-dev cpputest \
libsqlite3-dev uuid-dev
sudo apt-get install -y asciidoc dblatex source-highlight w3m
sudo apt-get install -y libtool git autoconf
sudo apt-get install -y bison flex
wget https://github.com/rurban/safeclib/releases/download/v04062019/libsafec-04062019.0-ga99a05.tar.gz
tar -xzvf libsafec-04062019.0-ga99a05.tar.gz
cd libsafec-04062019.0-ga99a05/
./configure
make
sudo make install
cd ~/snort_src
wget https://ftp.pcre.org/pub/pcre/pcre-8.43.tar.gz
tar -xzvf pcre-8.43.tar.gz
cd pcre-8.43
./configure
make
sudo make install
cd ~/snort_src
wget https://github.com/gperftools/gperftools/releases/download/gperftools-2.7/gperftools-2.7.tar.gz
tar xzvf gperftools-2.7.tar.gz
cd gperftools-2.7
./configure
make
sudo make install
cd ~/snort_src
wget http://www.colm.net/files/ragel/ragel-6.10.tar.gz
tar -xzvf ragel-6.10.tar.gz
cd ragel-6.10
./configure
make
sudo make install
cd ~/snort_src
wget https://dl.bintray.com/boostorg/release/1.71.0/source/boost_1_71_0.tar.gz
tar -xvzf boost_1_71_0.tar.gz
cd ~/snort_src
wget https://github.com/intel/hyperscan/archive/v5.2.0.tar.gz
tar -xvzf v5.2.0.tar.gz
mkdir ~/snort_src/hyperscan-5.2.0-build
cd hyperscan-5.2.0-build/

cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DBOOST_ROOT=~/snort_src/boost_1_71_0/ ../hyperscan-5.2.0

make
sudo make install
cd ~/snort_src
git clone https://github.com/snort3/libdaq.git
cd libdaq
./bootstrap
./configure
make
sudo make install
sudo ldconfig
cd ~/snort_src
git clone git://github.com/snortadmin/snort3.git
cd snort3
./configure_cmake.sh --prefix=/usr/local --enable-tcmalloc
cd build
make
sudo make install
echo "Snort version displayed below\n"
/usr/local/bin/snort -V