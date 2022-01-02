# Dockerfile php-fpm
# Set master image
FROM php:7.4-fpm-alpine
 
# Set working directory
WORKDIR /var/www/html
 
# Install Additional dependencies
RUN apk update && apk add --no-cache \
    build-base shadow nano curl \
    php7 \
    php7-fpm \
    php7-common \
    php7-pdo \
    php7-pdo_mysql \
    php7-mysqli \
    php7-mcrypt \
    php7-mbstring \
    php7-xml \
    php7-openssl \
    php7-json \
    php7-phar \
    php7-zip \
    php7-gd \
    php7-dom \
    php7-session \
    php7-zlib \
    nodejs \
    npm 
 
# Add and Enable PHP-PDO Extenstions
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-enable pdo_mysql

# Setup GD extension
RUN apk add --no-cache \
      freetype \
      libjpeg-turbo \
      libpng \
      freetype-dev \
      libjpeg-turbo-dev \
      libpng-dev \
    && docker-php-ext-configure gd \
      --with-freetype=/usr/include/ \
      # --with-png=/usr/include/ \ # No longer necessary as of 7.4; https://github.com/docker-library/php/pull/910#issuecomment-559383597
      --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-enable gd \
    && apk del --no-cache \
      freetype-dev \
      libjpeg-turbo-dev \
      libpng-dev \
    && rm -rf /tmp/*
    
# Remove Cache
RUN rm -rf /var/cache/apk/*
 
# Add UID '1000' to www-data
RUN usermod -u 1000 www-data
 
# Copy existing application directory permissions
COPY --chown=www-data:www-data . /var/www/html
 
# Change current user to www
USER www-data
 
# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]