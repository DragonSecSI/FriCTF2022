FROM php:7.4-apache as build

RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip

WORKDIR /app

COPY html.zip .
COPY util ./util

RUN unzip html.zip

# Only args can be passed to build stage
ARG FLAG
ENV FLAG=${FLAG}

RUN chmod 0755 /app/util/flagSwitcher.sh
RUN /app/util/flagSwitcher.sh /app/html

FROM php:7.4-apache as production

# Copy php code
COPY --from=build /app/html /var/www/html

# Expose port 80
EXPOSE 80

USER www-data

# Start apache
CMD ["apache2-foreground"]
