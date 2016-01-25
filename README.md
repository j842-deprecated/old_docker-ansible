# docker-ansible

A simple docker container to run an interactive Ansible session, using playbooks stored on the host.
Configuration (SSH Keys and the Ansible configuration file) are stored in a volume container.
All work is done as root user in the container. 
Available in Docker Hub as [j842/ansible](https://hub.docker.com/r/j842/ansible/) and GitHub as [j842/docker-ansible](https://github.com/j842/docker-ansible).


## INSTALLATION

After checking out the repo, run the following scripts in bin. NAME is required and allows multiple 
installations on one host.

| Script             | Descrption | 
|--------------------|---------------------------------------------------------------------|
| bin/install NAME   | Install the main script on the host (ansiblesession) in /usr/local/bin.                  | 
| bin/init NAME      | Initialise the Docker storage volume (ansible-config-vol) for the ansible settings.      | 

## RUNNING

Having completed the above you can run with:
```
ansiblesession-NAME
```

## CONFIGURATION

### SSH Keys

Keys to access clients can be copied into the configuration volume with:
```
bin/copykeys NAME PATH
```
This will copy all files from PATH into /root/.ssh in the docker container.
Either run this or create keys in the ansible session (preserving the symlink from /root/.ssh).

### Ansible Configuration File

You can set the standard ansible configuration file (/root/.ansible.cfg) by creating a config file on the host
then running:
```
bin/setconfig NAME CONFIGFILE
```

The ansible config file defaults to:
```
[defaults]
host_key_checking = false
pipelining = true
```

