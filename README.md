# docker-ansible #

A simple docker container to run Ansible, accessable via ssh (authorized_keys). Available in Docker Hub as j842/ansible and github as j842/docker-ansible.


```
docker run -d -p 1234:22 -v "$(pwd)/data:/data" -v "$(pwd)/sshkeys:/sshkeys" j842/ansible

```
