FROM php:7.4-apache-bullseye

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    lsof \
    wget \
    libgmp-dev \
    libjpeg-dev \
    libpng-dev \
    libxml2-dev \
    libxslt-dev \
    libzip-dev \
    zip \
    unzip


# Install PHP extensions
RUN docker-php-ext-install bcmath gd intl pdo_mysql simplexml soap xsl zip

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
