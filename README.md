# docker-ansible

A simple docker container to run an interactive Ansible session, using playbooks stored on the host.
Configuration (SSH Keys and the Ansible configuration file) are stored in a volume container.
All work is done as root user in the container. 
Available in Docker Hub as [j842/ansible](https://hub.docker.com/r/j842/ansible/) and GitHub as [j842/docker-ansible](https://github.com/j842/docker-ansible).


## INSTALLATION

After checking out the repo, run the following scripts in bin:

| Script               | Descrption | 
|----------------------|---------------------------------------------------------------------|
| bin/install              | Install the main script (ansiblesession) in /usr/local/bin.                        | 
| bin/init                 | Initialise the Docker storage volume (ansible-config-vol) for the ansible settings.      | 

## RUNNING

Having completed the above you can run with:
```
ansiblesession PATH
```
where PATH is the root path of the ansible repo/playbooks on the host. This directory is mapped
to /data in the container.

## CONFIGURATION

### SSH Keys

Keys to access ansible clients are configured with:
```
bin/copykeys PATH
```
This will copy all files from PATH into /root/.ssh in the docker container.
Until this is run there will be no SSH keys.

### Default Path

You can set up a default path for the ansible repo/playbooks, e.g.
```
pwd > ~/.ansiblepath
```

### Ansible Configuration File

Set the ansible configuration file (/root/.ansible.cfg) by creating a config file on the host
then running:
```
bin/setconfig CONFIGFILE
```

The ansible config file defaults to:
```
[defaults]
host_key_checking = false
pipelining = true
```

