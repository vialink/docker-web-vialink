FROM alpine

LABEL maintainer="Vialink"

# Atualiza a imagem com os pacotes
RUN apk -U upgrade

# Instala o NGINX para testar
RUN apk add nginx php7-gd php7-mysqli php7-zlib php7-curl php7 php7-fpm php7-opcache php7-sqlite3 php7-pdo_mysql php7-mysqlnd php7-pdo_sqlite php7-pdo_pgsql php7-pgsql openrc

#RUN rc-update add nginx default && rc-service nginx restart

#RUN rc-update add php-fpm7 default && rc-service php-fpm7 restart

COPY entrypoint.sh .

# Expoe a porta 80
EXPOSE 80

ENTRYPOINT [ "sh", "entrypoint.sh" ]