FROM httpd:alpine

# Setting the timezone
# https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo "Asia/Tokyo" > /etc/timezone && \
    apk del tzdata && \
    rm -rf /var/cache/apk/* 

ADD ./src/ /usr/local/apache2/htdocs/

EXPOSE 80
