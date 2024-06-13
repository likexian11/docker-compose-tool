#!/bin/bash

# 卸载旧版本
echo ""
echo ""
echo "#########################################################"
echo "# 卸载旧版本 -- 开始                                    #"
echo "#########################################################"
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine  \
                  docker-selinux
echo "#########################################################"
echo "# 卸载旧版本 -- 结束                                    #"
echo "#########################################################"

# 安装需要的依赖软件包
echo ""
echo ""
echo "#########################################################"
echo "# 安装需要的软件包 -- 开始                              #"
echo "#########################################################"
yum install -y yum-utils device-mapper-persistent-data lvm2
echo "#########################################################"
echo "# 安装需要的软件包 -- 结束                              #"
echo "#########################################################"

# 设置 yum 源，清华镜像仓库，速度很快
echo ""
echo ""
echo "#########################################################"
echo "# 设置 yum 源 -- 开始                                   #"
echo "#########################################################"
#安装wget，如果已安装则会跳过
yum -y install wget
#根据你的发行版下载repo文件:
#wget -O /etc/yum.repos.d/docker-ce.repo https://download.docker.com/linux/centos/docker-ce.repo
#把软件仓库地址替换为 TUNA:
#sed -i 's+download.docker.com+mirrors.huaweicloud.com/docker-ce+' /etc/yum.repos.d/docker-ce.repo

yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
sed -i 's+download.docker.com+mirrors.aliyun.com/docker-ce+' /etc/yum.repos.d/docker-ce.repo

echo "#########################################################"
echo "# 设置 yum 源 -- 结束                                   #"
echo "#########################################################"

# 安装 docker-ce
echo ""
echo ""
echo "#########################################################"
echo "# 安装 docker-ce -- 开始                                #"
echo "#########################################################"
#安装指定版本
#sudo yum -y install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io docker-compose-plugin
sudo yum -y install docker-ce-24.0.6 docker-ce-cli-24.0.6 containerd.io docker-compose-plugin
echo "#########################################################"
echo "# 安装 docker-ce -- 结束                                #"
echo "#########################################################"

# 启动并加入开机启动
echo ""
echo ""
echo "#########################################################"
echo "# 启动并加入开机启动 -- 开始                            #"
echo "#########################################################"
systemctl start docker
systemctl enable docker
echo "#########################################################"
echo "# 启动并加入开机启动 -- 结束                            #"
echo "#########################################################"

# 验证安装是否成功
echo ""
echo ""
echo "#########################################################"
echo "# 验证安装是否成功 -- 开始                              #"
echo "#########################################################"
docker version
echo "#########################################################"
echo "# 验证安装是否成功 -- 结束                              #"
echo "#########################################################"

# 安装docker-compose
echo ""
echo ""
echo "#########################################################"
echo "# 安装docker-compose -- 开始                            #"
echo "#########################################################"
curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
echo "#########################################################"
echo "# 安装docker-compose -- 结束                            #"
echo "#########################################################"

# 验证安装是否成功
echo ""
echo ""
echo "#########################################################"
echo "# 验证安装是否成功 -- 开始                              #"
echo "#########################################################"
docker-compose --version
echo "#########################################################"
echo "# 验证安装是否成功 -- 结束                              #"
echo "#########################################################"

# 添加 docker 国内镜像站点并重启docker
echo ""
echo ""
echo "#########################################################"
echo "# 添加 docker 国内镜像站点并重启docker -- 开始          #"
echo "#########################################################"
#创建目录：/etc/docker
mkdir -p /etc/docker
echo '{ "registry-mirrors": [ "https://h0yohg21.mirror.aliyuncs.com" ] }' >> /etc/docker/daemon.json
systemctl restart docker
echo "#########################################################"
echo "# 添加 docker 国内镜像站点并重启docker -- 结束          #"
echo "#########################################################"

echo ""
echo ""
echo "install OK!" # 提示安装完成
echo ""
echo "Edit By Meepo 2024-03-13"
echo ""
echo ""
