# k8s-install

	00-init.yml
	创建BIN_PATH路径,复制k8s_env.sh环境变量

	01-ssl.yml
    本地生成ca，安装cfssl，复制ca证书


## version
etcd Version: 3.1.6
kube Version: v1.8.8


#calico
calico-node主要包含 felix,confd,bird等模块，控制iptables,route等主机信息以便通信
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
