# docker-ansible #

A simple docker container to run Ansible. Available in Docker Hub as j842/ansible and github as j842/docker-ansible.


Example:
```
docker run -d -v "$(pwd)/data:/data" -v "$(pwd)/sshkeys:/sshkeys" j842/ansible ansiblerun COMMAND [OPTIONS]...

```
