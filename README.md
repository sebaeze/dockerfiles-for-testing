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


