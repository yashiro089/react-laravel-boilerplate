FROM php:7.3.3

WORKDIR /app
COPY . /app

RUN apt-get update -y && apt-get install -y openssl zip unzip git \
&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
&& docker-php-ext-install pdo mbstring \
&& composer install \
&& npm install --production \
&& npm run prod

CMD php artisan serve --host=0.0.0.0 --port=8181
EXPOSE 8181