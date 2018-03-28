#!/bin/bash
mkdir -p /root/local/bin
echo PATH=/root/local/bin:$PATH > /etc/profile.d/cfssl_env.sh
cd /tmp
wget -T 15 -t 3 https://pkg.cfssl.org/R1.2/cfssl_linux-amd64
chmod  +x cfssl_linux-amd64
mv cfssl_linux-amd64 /root/local/bin/cfssl
wget -T 15 -t 3 https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64
chmod +x cfssljson_linux-amd64
mv cfssljson_linux-amd64 /root/local/bin/cfssljson
wget -T 15 -t 3 https://pkg.cfssl.org/R1.2/cfssl-certinfo_linux-amd64
chmod +x cfssl-certinfo_linux-amd64
mv cfssl-certinfo_linux-amd64 /root/local/bin/cfssl-certinfo
