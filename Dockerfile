FROM php:8.1.0-apache-buster

RUN echo "[PHP]\nmemory_limit = 256M" > /usr/local/etc/php/php.ini

WORKDIR /var/www/html/

RUN apt-get clean \
    && apt-get update \
    && apt-get install --fix-missing -y \
        vim \
        pwgen \
        unzip \
        libpng-dev \
        libjpeg-dev \
        libjpeg62-turbo-dev 

COPY ./soft/Single_File_PHP_Gallery_4.8.1.zip .
COPY ./soft/sfpg_test_1.5.1.zip .

RUN unzip Single_File_PHP_Gallery_4.8.1.zip \
    && rm Single_File_PHP_Gallery_4.8.1.zip \
    && unzip sfpg_test_1.5.1.zip \
    && rm sfpg_test_1.5.1.zip \
    && mkdir _sfpg_data \
    && chown www-data:www-data _sfpg_data \ 
    && sed -i "s/define('GALLERY_ROOT', '.\\/')/define('GALLERY_ROOT', '.\\/images\\/')/" index.php \
    && export PHRASE=$(pwgen -n1 40) \
    && sed -i "s/define('SECURITY_PHRASE', '')/define('SECURITY_PHRASE', '${PHRASE}')/" index.php \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install exif

VOLUME /var/www/html/images
