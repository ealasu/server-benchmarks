#!/bin/bash

mkdir results

hostname > results/hostname
uname -a > results/uname
curl https://icanhazip.com > results/public_ip

curl -O https://byte-unixbench.googlecode.com/files/UnixBench5.1.3.tgz
tar -xf UnixBench5.1.3.tgz

cd UnixBench
make all
./Run | tee ../results/bench.txt
cd ..

./memory_test.py | tee results/memory_test.txt

tar -czf results.tar.gz results
#curl -X POST -d @results.tar.gz https://my-server


