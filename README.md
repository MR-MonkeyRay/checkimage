checkimage
---------------

本项目是一个图片鉴黄`api`接口，支持`jpg`、`png`、`jpeg`格式文件，参考[nsfwjs][1]。

### 镜像构建状态

[![构建状态](https://caidog.coding.net/badges/mirai-plugin/job/1401703/build.svg)](https://caidog.coding.net/p/mirai-plugin/ci/job)

使用方法
---------------

### 使用Docker

```
docker run -d -p 3027:3027 --name check-image monkeyray/check-image:latest
```

### 使用Docker-Compose

```
> mkdir ~/checkimage
> cd ~/checkimage
> cat << EOF > docker-compose.yaml
version: '3'
services:
  check-image:
    container_name: check-image
    image: monkeyray/check-image:latest
    restart: always
    ports:
    - 3027:3027
EOF
> docker-compose up -d
```

访问地址：ip:3027，使用看下方演示。

接口地址
---------------

    http://127.0.0.1:3027/api

使用示例
---------------

    #/root/xx.png为图片路径
    curl https://checkimage.querydata.org/api -F "image=@/root/xx.png;type=image/jpeg" 

返回信息：

    [
        {
            "className": "Neutral",
            "probability": 0.9277840852737427
        },
        {
            "className": "Drawing",
            "probability": 0.07143104821443558
        },
        {
            "className": "Hentai",
            "probability": 0.0007780276937410235
        },
        {
            "className": "Porn",
            "probability": 0.000005075656645203708
        },
        {
            "className": "Sexy",
            "probability": 0.0000018030658566203783
        }
    ]

类型参考：

    Drawing和Neutral：均为正常图片
    hentai：二次元类型的暴露图片指数
    sexy：露点图片的指数
    porn：就是色情图片的指数

图片指数越高，越接近该类型，最高的基本可以判定为该类型。

[1]: https://github.com/infinitered/nsfwjs
