安装 wget

apt-get install wget

安装shadowsocks

wget –no-check-certificate -O shadowsocks.sh https://github.com/xhyyd2022/vpn-frps/blob/main/shadowsocks.sh

获取shadowsocks.sh读取权限

chmod +x shadowsocks.sh

置密码和端口号

./shadowsocks.sh 2>&1 | tee shadowsocks.log

BBR安装

wget -N --no-check-certificate https://github.com/xhyyd2022/vpn-frps/blob/main/tcp.sh && chmod +x tcp.sh && ./tcp.sh
重启VPS

./tcp.sh

设置ipv6支持

cd /etc/shadowsocks.json

"server":"0.0.0.0",更改为"server":"::",

重启

reboot

frp软件下载

https://github.com/fatedier/frp/releases/download

看清楚设备CPU型号再下载以arm64架构举例

wget https://github.com/fatedier/frp/releases/download/v0.53.2/frp_0.53.2_linux_arm64.tar.gz

将文件解压

tar -zxvf frp_0.53.2_linux_arm64.tar.gz

文件夹改名为frp

mv frp_0.53.2_linux_arm64 frp

进入frp目录

cd frp

编辑frps.toml

[common]
bind_addr = 0.0.0.0
bind_port = 根据实际情况调整端口号
token = 根据实际情况调整密码

dashboard_port = 根据实际情况调整端口号
dashboard_user = 用户名
dashboard_pwd = 根据实际情况调整密码

运行frps服务端

./frps -c ./frps.toml

开机自启动配置文件

cd /usr/lib/systemd/system

编辑frp.service

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


设置frp开机启动

systemctl daemon-reload

systemctl enable frp

启动frp

systemctl start frp

查看frp是否启动

ps aux | grep frps

看到有两个进程说明成功
