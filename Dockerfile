FROM ubuntu
ENV TZ=US \
    DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y software-properties-common
RUN apt upgrade -y
RUN add-apt-repository ppa:ondrej/php && apt update
RUN apt install -y wget curl php8.2
RUN apt-get install -y php8.2-cli php8.2-common php8.2-fpm php8.2-mysql php8.2-zip php8.2-gd php8.2-mbstring php8.2-curl php8.2-xml php8.2-bcmath
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
