
1. 安装 wget
    ```
    yum install wget
    ```
2. 安装shadowsocks
```
wget -N --no-check-certificate "https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks.sh" && chmod +x shadowsocks.sh && ./shadowsocks.sh 2>&1 | tee shadowsocks.log
```

3. 设置密码

![ss](https://cdn.jsdelivr.net/gh/xhyyd2022/picx-images-hosting@master/1708169951225.png)
4. 设置端口号

![ss](https://cdn.jsdelivr.net/gh/xhyyd2022/picx-images-hosting@master/1708169945466.png)
5. 选择加密方式，这里选择 7：

![ss](https://cdn.jsdelivr.net/gh/xhyyd2022/picx-images-hosting@master/1708169958910.png)

接着按任意键进行安装。

6. 安装完成
等一会之后，就安装完成了，它会给你显示你需要连接vpn的信息：

![ss](https://cdn.jsdelivr.net/gh/xhyyd2022/picx-images-hosting@master/1708170506048.jpg)

可以看到需要连接ss的ip地址，密码，端口，和加密方式。

将这些信息保存起来，那么这时候你就可以使用它们来科学上网啦。




# [使用Shadowsocks](https://shadowsockshelp.github.io/Shadowsocks/)

这时候就可以科学上网了。


# 使用BBR加速器

让访问速度加速，飞起来！使用 BBR 加速工具。

## 安装 BBR

    wget -N --no-check-certificate "https://gist.github.com/zeruns/a0ec603f20d1b86de6a774a8ba27588f/raw/4f9957ae23f5efb2bb7c57a198ae2cffebfb1c56/tcp.sh" && chmod +x tcp.sh && ./tcp.shh


安装完成一会之后它会提示我们是否重新启动vps，我们输入 y 确定重启服务器。
## 安装完成后选择启动

    ./tcp.sh
