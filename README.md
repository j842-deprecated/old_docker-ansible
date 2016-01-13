# ansible #

A simple docker container to run Ansible, accessable via ssh (authorized_keys).


```
docker run -d -p 1234:22 -v "$(pwd)/data:/data" -v "$(pwd)/sshkeys:/sshkeys" j842/ansible

```
