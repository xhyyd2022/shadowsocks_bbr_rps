#!/bin/bash
# 服务器上安装frp的脚本

# 下载frp
wget https://github.com/fatedier/frp/releases/download/v0.53.2/frp_0.53.2_linux_arm64.tar.gz

# 解压frp
tar -zxvf frp_0.53.2_linux_arm64.tar.gz

# 重命名frp文件夹
mv frp_0.53.2_linux_arm64 frp

# 进入frp文件夹
cd frp

# 编辑frps.toml
echo "请按照以下格式输入frps.toml的参数："
read -p "服务端端口bind_port=" bind_port
read -p "服务端密码token=" token
read -p "管理页面端口dashboard_port=" dashboard_port
read -p "管理页面用户名dashboard_user=" dashboard_user
read -p "管理页面密码dashboard_pwd=" dashboard_pwd

cat > frps.toml <<EOF
[common]
bind_addr = 0.0.0.0
bind_port = $bind_port
token = $token

dashboard_port = $dashboard_port
dashboard_user = $dashboard_user
dashboard_pwd = $dashboard_pwd
EOF

# 创建frp.service
cd /usr/lib/systemd/system
cat > frp.service <<EOF
[Unit]
Description=The nginx HTTP and reverse proxy server
After=network.target remote-fs.target nss-lookup.target

[Service]
Type=simple
ExecStart=/root/frp/frps -c /root/frp/frps.toml
KillSignal=SIGQUIT
TimeoutStopSec=5
KillMode=process
PrivateTmp=true
StandardOutput=syslog
StandardError=inherit

[Install]
WantedBy=multi-user.target
EOF

# 设置frp开机启动
systemctl daemon-reload
systemctl enable frp

# 启动frp
systemctl start frp

# 检查frp状态
systemctl status frp