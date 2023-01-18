#
FROM  registry.redhat.io/ubi9/ubi:latest
#
ENV   NODE_VERSION="18/common"
ENV   MSG_DEMO="**** NO HAY MENSAJE ****"
ENV   PORT="3002"
#
RUN    whoami && dnf upgrade -y \
    && dnf module list nodejs \
    && dnf module install -y nodejs:${NODE_VERSION} \
    && node --version && npm --version \
    && mkdir -p /app/src && chown -R 1001:0 /app/src
#
WORKDIR  /app/src
#
ADD  package.json .
ADD  index.js     .
##
RUN  npm install
#
USER 1001
#
ENTRYPOINT ["node","index.js"]
#