# dockerfiles-for-testing

This repo contains several Dockerfiles, which were created with the intention of being use for testing of containers, kubernetes, Openshift, ECS, EKS


# Install

```bash

git clone https://github.com/sebaeze/dockerfiles-for-testing.git

podman build -t my-image -t echo-hostname.dockerfile
podman login -u 'my_user' -p 'my_password' quay.io

podman push my-image quay.io/my_user/my-image
```

# Dockerfiles

## echo-hostname.dockerfile
Display timestamps and hostname 1 time then It ends.


## Dockerfile

```Dockerfile
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
```