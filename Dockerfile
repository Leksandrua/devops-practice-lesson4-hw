FROM nginx
MAINTAINER aleksandr_shevchenko
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
EXPOSE 80
