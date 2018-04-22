# k8s-install

	00-init.yml
	创建BIN_PATH路径,复制k8s_env.sh环境变量

	01-ssl.yml
    本地生成ca，安装cfssl，复制ca证书


## version
etcd Version: 3.1.6
kube Version: v1.8.8

calico v1.11.4
calico-ipam v1.11.4
calicoctl v1.6.3
calico-node v2.6.3
loopback v0.3.0


#calico
calico-node主要包含 felix,confd,bird等模块，控制iptables,route等主机信息以便通信
以下可通过addon(calico-kube-controllers)的安装自动实现
相关ACL主要由profile文件来修改iptables,根据namespace判断，例如k8s中的default，则需要自己使用calicoctl创建配置文件k8s_ns.default.conf：
------
apiVersion: v1
kind: profile
metadata:
  name: k8s_ns.default
  labels:
    calico/k8s_ns: default
spec:
  ingress:
  - action: allow
  egress:
  - action: allow
--------
同理可以根据namespace来替换default添加多个配置文件.


#addons
1. calico-kube-controllers
2. kube-dns
3. dashboard

#calico-kube-controllers
同步k8s网络信息到calico-node

#kube-dns
在k8s集群内部提供dns服务，为service 添加a记录，使pod可通过service name访问。

#dashboard
k8s UI访问页面,提供3种访问模式:
1.访问Service的NodePort 无需认证
2.访问proxy 需配置
3.访问API接口https://kube-api:6443/api/v1/proxy/namespaces/kube-system/services/kubernetes-dashboard
访问接口时便使用kube-api的安全配置参数作为认证，再通过clusterrolebinding对用户名进行授权

