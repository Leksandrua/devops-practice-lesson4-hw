FROM nginx
MAINTAINER aleksandr_shevchenko
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
RUN curl -fsSL https://goss.rocks/install | sh
EXPOSE 80
# ENTRYPOINT ["/bin/sh", "-c", "/docker-entrypoint.sh"]
# ENTRYPOINT ["/docker-entrypoint.sh"]
