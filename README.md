# bilive24h
7 * 24小时的直播间

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
