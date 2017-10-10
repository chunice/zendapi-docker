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

## How to use this image

~~~
git clone https://github.com/chunice/zendapi-docker
cd zendapi-docker
docker build -t zendapi_dev . && docker run -it zendapi_dev
~~~

## 使用中国镜像
速度过慢的话，可以使用中国镜像来加速执行
将 Dockerfile 的 4 行和第 33 行前的 #号删掉，再将第 34 行注释掉即可开启 ubuntu 软件源和 php 中国镜像