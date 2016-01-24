# docker-ansible

A simple docker container to run Ansible. Available in Docker Hub as j842/ansible and github as j842/docker-ansible.


## SCRIPTS

After checking out the repo, run the following scripts in bin:

| Script               | Descrption | 
|----------------------|---------------------------------------------------------------------|
| bin/install              | Add ansiblesession script to /usr/local/bin.                        | 
| bin/init                 | Initialise the Docker storage volume for the ansible settings.      | 

## RUNNING

Having completed the above you can run with:
```
ansiblesession PATH
```
where PATH is the root path of the ansible repo/playbooks.

## CONFIGURATION

### SSH Keys

Keys to access ansible clients are configured with:
```
bin/copykeys PATH
```
This will copy all files from PATH into /root/.ssh in the docker container.
No SSH keys are installed by default.

### Default Path

You can set up a default path for the ansible repo/playbooks, e.g.
```
pwd > ~/.ansiblepath
```

### Ansible Configuration File

Set the ansible configuration file (/root/.ansible.cfg) by creating a config file on the host
then running:
```
setconfig CONFIGFILE
```

The ansible config file defaults to:
```
[defaults]
host_key_checking = false
pipelining = true
```

