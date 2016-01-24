# docker-ansible #

A simple docker container to run Ansible. Available in Docker Hub as j842/ansible and github as j842/docker-ansible.

Check out, then edit bin/bash.conf setting ANSIBLE_PATH to the location you want to store you ansible playbooks etc.

Next you need to run the following scripts in bin:

| Script               | Descrption | 
|----------------------|---------------------------------------------------------------------|
| install              | Add ansiblesession script to /usr/local/bin.                        | 
| init                 | Initialise the Docker storage volume for the ansible settings.      | 
| copykeys PATH        | Copy all files from PATH into /root/.ssh in the docker container.   |   
| setconfig CONFIGFILE | Set the ansible configuration file (/root/.ansible.cfg)             |  

Having completed the above you can run with:
```
ansiblesession PATH
```
where PATH is the root path of the ansible repo/playbooks. You can set up a default path
to the present working directory on the host with 
```
pwd > ~/.ansiblepath
```

The ansible config file defaults to:
```
[defaults]
host_key_checking = false
pipelining = true
```

No SSH keys are installed by default - use copykeys to copy across suitable keys to access ansible clients.
