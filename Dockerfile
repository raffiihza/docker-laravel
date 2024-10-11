FROM ubuntu
ENV TZ=Asia/Jakarta \
    DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y software-properties-common zlib1g unzip git
RUN apt upgrade -y && add-apt-repository ppa:ondrej/php && apt update && apt install -y wget curl php8.3
RUN apt-get install -y php8.3-cli php8.3-common php8.3-fpm php8.3-mysql php8.3-sqlite3 php8.3-pgsql php8.3-zip php8.3-gd php8.3-mbstring php8.3-curl php8.3-xml php8.3-bcmath
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs
