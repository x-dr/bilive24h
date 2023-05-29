# bilive24h
我搭建7 * 24小时的测试直播间：[http://live.bilibili.com/2504721](http://live.bilibili.com/2504721)


### 安装ffmpeg

```shell
wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz
tar -xJf ffmpeg-release-amd64-static.tar.xz
cp -r ffmpeg-6.0-amd64-static /usr/local/ffmpeg
```

> 在~/.bashrc文件添加一行
```shell
export PATH=$PATH:/usr/local/ffmpeg
```
> 然后运行使其生效

```shell
source .bashrc
```


### 执行脚本
```shell
wget https://raw.githubusercontent.com/x-dr/bilive24h/main/bilive.sh
```


> 运行

```shell
bash bilive.sh
```
> ps：推流地址是b站我的直播，服务器地址和串流密钥连在一起中间无需空格和逗号
![1685276828190.png](https://s1.img.ink/2023/05/28/c60b9eb81f023.png)
