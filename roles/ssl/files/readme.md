#please download the cfssl bin file 
wget -T 15 -t 3 https://pkg.cfssl.org/R1.2/cfssl_linux-amd64 -O cfssl
wget -T 15 -t 3 https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64 -O cfssljson
wget -T 15 -t 3 https://pkg.cfssl.org/R1.2/cfssl-certinfo_linux-amd64 -O cfssl-certinfo
#please input the  ca-config.json ca-csr.json
cfssl print-defaults config > config.json
cfssl print-defaults csr > csr.json

#please input the  etcd-csr.json
