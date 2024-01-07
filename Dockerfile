FROM alexac/alpine-lighttpd
COPY ./html/ /var/www/localhost/htdocs
COPY ./lighttpd.conf /etc/lighttpd/lighttpd.conf
RUN chmod 777 /var/www/localhost/htdocs/cv.pdf
RUN chmod 777 /var/www/localhost/htdocs/healthcheck.html
EXPOSE 80
