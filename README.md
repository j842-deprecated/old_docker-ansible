# docker-ansible #

A simple docker container to run Ansible. Available in Docker Hub as j842/ansible and github as j842/docker-ansible.


Example:
```
docker run -d -v "$(pwd)/data:/data" -v "$(pwd)/sshkeys:/sshkeys" j842/ansible ansiblerun COMMAND [OPTIONS]...

```

Script to do basic setup on a clean debian host:
```
#!/bin/bash

# install package if it doesn't exist, updating cache
function checkinstall {
if [ $(dpkg-query -W -f='${Status}' ${1} 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  apt-get update
  apt-get install -y ${1};
fi
}

# create a command run via docker
function makefile {
cat <<EOF | tr -s ' ' >/usr/local/bin/$1 
#!/bin/bash

docker run --name=ansible -ti --rm                              \
       -v "/root/dockeransible/ansible:/data"                   \
       -v "/root/dockeransible/sshkeys:/sshkeys"                \
       -v "/root/dockeransible/ansible.cfg:/root/.ansible.cfg"  \
       j842/docker-ansible /usr/local/bin/ansiblerun $1 \$@
EOF
chmod a+x /usr/local/bin/$1
}

# ------------ INSTALL DOCKER --------------------------

checkinstall apt-transport-https

# add the dockerproject repository
if [ ! -e /etc/apt/sources.list.d/docker.list ]; then
  apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  echo deb https://apt.dockerproject.org/repo debian-jessie main > /etc/apt/sources.list.d/docker.list
fi

checkinstall docker-engine

systemctl enable docker
systemctl start docker

# ------------ CONFIGURE ANSIBLE CONTAINER --------------------------

# configure ansible commands
COMMANDS=(ansible ansible-doc ansible-galaxy ansible-playbook ansible-pull ansible-vault)
for CMD in ${COMMANDS[@]}; do
  makefile $CMD
done

# get the latest docker image
docker pull j842/docker-ansible

```
