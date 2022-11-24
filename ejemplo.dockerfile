#
FROM  node:16
#
ENV   VERSION="4.0"
#
RUN    whoami \
    && mkdir -p  /app/src \
    && chown adduser:0 -R /app/src   \
    && chmod -R 777       /app/src
#
WORKDIR  /app/src
#
COPY  package.json .
COPY  index.js     .
ADD   https://my.domain.com/image/my_image.jpg .
##
RUN  npm install
#
USER app-user
#
ENTRYPOINT ["node","index.js"]
#