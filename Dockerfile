FROM ubuntu:16.04
MAINTAINER chunice chun@engineer.com

# RUN sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu\//http:\/\/mirrors.163.com\/ubuntu\//g' /etc/apt/sources.list

ENV PHP_VERSION 7.1.5
ENV PHPIZE_DEPS \
		autoconf \
		dpkg-dev \
		file \
		g++ \
		gcc \
		libc-dev \
		libpcre3-dev \
		make \
		pkg-config \
		re2c

RUN apt-get update && apt-get install -y \
		$PHPIZE_DEPS \
		ca-certificates \
        cmake \
		curl \
        wget \
        git \
		libedit2 \
		libsqlite3-0 \
		libxml2 \
        libxml2-dev \
		xz-utils \
	--no-install-recommends && rm -r /var/lib/apt/lists/*

# ENV PHP_DOWNLOAD_PATH http://cn2.php.net/distributions/php-${PHP_VERSION}.tar.gz
ENV PHP_DOWNLOAD_PATH http://php.net/distributions/php-${PHP_VERSION}.tar.gz

RUN cd ~/ && mkdir workspace && cd workspace && \
    mkdir build-php && cd build-php && \
    wget ${PHP_DOWNLOAD_PATH} && \
    tar -xzxvf php-${PHP_VERSION}.tar.gz && cd php-${PHP_VERSION} && \
    ./configure --prefix=/usr/local/php-${PHP_VERSION} \
        --enable-embed=shared \
        --enable-maintainer-zts \
        --with-tsrm-pthreads \
        --enable-debug \
        --with-config-file-path=/usr/local/php-${PHP_VERSION}/etc/ \
        --with-config-file-scan-dir=/usr/local/php-${PHP_VERSION}/etc/conf.d/ && \
    make && make install && \
    cp php.ini-development /usr/local/php-${PHP_VERSION}/etc/php.ini

RUN ln -sf /usr/local/php-${PHP_VERSION}/bin/php /usr/local/bin/php && \
    ln -sf /usr/local/php-${PHP_VERSION}/bin/php-config /usr/local/bin/php-config

RUN cd ~/workspace && \
    git clone https://github.com/Qihoo360/zendAPI.git && \
    mkdir build-zendapi && cd build-zendapi && \
    cmake ../zendAPI && \
    make install

RUN cd ~/workspace && \
    git clone https://github.com/zendapi/demo.git && \
    cd demo && mkdir build-demo && cd build-demo && \
    cmake ../ && \
    make install

# WORKDIR ~/workspace

# 容器命令执行
CMD ["/bin/bash"]
