# zendAPI For Docker

## Quick reference
* zendAPI Github
[https://github.com/qcoreteam/zendapi](https://github.com/qcoreteam/zendapi)

* zendAPI 开源中国主页
[https://www.oschina.net/p/zendapi](https://www.oschina.net/p/zendapi)

* Segmentfault技术圈
[https://segmentfault.com/g/1570000010966072](https://segmentfault.com/g/1570000010966072)

* 官方手册
[http://zendapi.org/manual/](http://zendapi.org/manual/)

## 开始使用镜像

本镜像使用 ubuntu 16.04 制作，安装了 php 7.1.5 版本。镜像内各软件版本与官网手册最佳实践一致。镜像内包含官网手册新手学堂的 hello zapi 项目。

### 1.克隆 Dockerfile 到本地
~~~
git clone https://github.com/chunice/zendapi-docker
~~~

### 2.执行 build 生成镜像 & 创建容器
~~~
cd zendapi-docker
docker build -t zendapi_dev . && docker run -itd zendapi_dev
~~~

也可以将本地目录，容器目录共享，并端口映射
~~~
docker run -itd zendapi_dev -p 88:80 -v /Users/CODE:~/workspace/demo zendapi_dev
~~~

### 3.后续进入容器操作
~~~
docker exec -it zendapi_dev /bin/bash
~~~

## 使用中国镜像
本镜像默认使用 ubuntu 官方源和官网 php 源码包。速度过慢的话，可以使用中国镜像来加速执行。将 Dockerfile 的 4 行和第 33 行前的 #号删掉，再将第 34 行注释掉即可开启 ubuntu 软件源和 php 中国镜像
