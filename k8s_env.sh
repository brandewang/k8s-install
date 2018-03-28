#集群通用变量
#设置PATH
export PATH=/root/local/bin:$PATH
#TLS Bootstrapping 使用的 Token，可以使用命令 head -c 16 /dev/urandom | od -An -t x | tr -d ' ' 生成
BOOTSTRAP_TOKEN="ed2db97641db32d8c7af29ec5765c46d"
#建议用 未用的网段 来定义服务网段和 Pod 网段
# 服务网段 (Service CIDR），部署前路由不可达，部署后集群内使用 IP:Port 可达
SERVICE_CIDR="10.254.0.0/16"
# POD 网段 (Cluster CIDR），部署前路由不可达，**部署后**路由可达 (flanneld 保证)
CLUSTER_CIDR="172.30.0.0/16"
# 服务端口范围 (NodePort Range)
NODE_PORT_RANGE="8400-9000"
# etcd 集群服务地址列表
ETCD_ENDPOINTS="https://10.28.50.41:2379;https://10.28.50.42:2379;https://10.28.50.43:2379"
# flanneld 网络配置前缀
FLANNEL_ETCD_PREFIX="/kubernetes/network"
# kubernetes 服务 IP (预分配，一般是 SERVICE_CIDR 中第一个IP)
CLUSTER_KUBERNETES_SVC_IP="10.254.0.1"
# 集群 DNS 服务 IP (从 SERVICE_CIDR 中预分配)
CLUSTER_DNS_SVC_IP="10.254.0.2"
# 集群 DNS 域名
CLUSTER_DNS_DOMAIN="cluster.local."
