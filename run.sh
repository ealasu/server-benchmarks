#!/bin/bash

mkdir results

uname -a | tee results/uname
cat /proc/cpuinfo | tee results/cpuinfo
hostname | tee results/hostname
curl https://icanhazip.com | tee results/public_ip

curl -O https://byte-unixbench.googlecode.com/files/UnixBench5.1.3.tgz
tar -xf UnixBench5.1.3.tgz

cd UnixBench
make all
./Run | tee ../results/bench.txt
cd ..

./memory_test.py | tee results/memory_test.txt

tar -czf results.tar.gz results
#curl -X POST -d @results.tar.gz https://my-server

