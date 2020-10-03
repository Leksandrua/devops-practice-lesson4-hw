FROM nginx
MAINTAINER aleksandr_shevchenko
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
# RUN curl -fsSL https://goss.rocks/install | sh && chmod +rx /usr/local/bin/dgoss
RUN curl -L https://github.com/aelsabbahy/goss/releases/latest/download/goss-linux-amd64 -o /bin/goss
EXPOSE 80
# ENTRYPOINT ["/bin/sh", "-c", "/docker-entrypoint.sh"]
# ENTRYPOINT ["/docker-entrypoint.sh"]
