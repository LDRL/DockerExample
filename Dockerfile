# imagen de dockerhub que descargara
FROM php:7.2-fpm-alpine

# algunas configuraciones para que funcione el contenedor
RUN docker-php-ext-install pdo pdo_mysql

RUN install git

##
ENV COMPOSER_HOME /composer
## 
ENV PATH /composer/vendor/bin:$PATH


##
# instala composer en el contenedor
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# da permisos para editar los archivos en esta ruta del container
RUN chown -R www-data:www-data /var/www
RUN chmod 755 /var/www