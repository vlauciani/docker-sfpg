FROM php:8.2.0-apache-buster

ENV VERSION_SFPG=4.12.0
ENV VERSION_SFPG_TEST=1.5.3
ENV CFLAGS="-O1"

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

COPY ./soft/Single_File_PHP_Gallery_${VERSION_SFPG}.zip .
COPY ./soft/sfpg_test_${VERSION_SFPG_TEST}.zip .

RUN unzip Single_File_PHP_Gallery_${VERSION_SFPG}.zip \
    && rm Single_File_PHP_Gallery_${VERSION_SFPG}.zip \
    && unzip sfpg_test_${VERSION_SFPG_TEST}.zip \
    && rm sfpg_test_${VERSION_SFPG_TEST}.zip \
    && mkdir _sfpg_data \
    && chown www-data:www-data _sfpg_data 
RUN docker-php-ext-configure gd --with-jpeg 
RUN docker-php-ext-install gd 
RUN docker-php-ext-install exif

# Add personal configurations
RUN mv index.php sfpg.php \
    && echo "<?php" > index.php \
    && echo "define('GALLERY_ROOT', './images/');" >> index.php \
    && echo "define('SORT_DIVIDER', '---');" >> index.php \
    && echo "define('IMAGE_EXCLUDE_REGEX', '/.*\.i\.png/i');" >> index.php \
    && echo "define('DATA_ROOT', './_sfpg_data/');" >> index.php \
    && echo "include '/var/www/html/sfpg.php';" >> index.php \
    && echo "?>" >> index.php

# Add pass phrase
RUN export PHRASE=$(pwgen -n1 40) \
    && echo "<?php if(function_exists('option')) option('SECURITY_PHRASE', '${PHRASE}'); ?>" > _sfpg_data/sp.php

VOLUME /var/www/html/images
