# Ansible in a Docker container, accessed via ssh.

FROM debian
MAINTAINER j842

RUN apt-get update && \
    apt-get install -y \
    apt-transport-https software-properties-common \
    python-apt python-pycurl python-httplib2 \
    build-essential libssl-dev libffi-dev python-dev \
    python-pip git nano

RUN pip install ansible cryptography

RUN rm -rf /root/.ssh
RUN ln -s /config/sshkeys /root/.ssh 
RUN ln -s /config/ansible.cfg /root/.ansible.cfg 

RUN echo 'export EDITOR=nano' >> /root/.bashrc

VOLUME ["/config","/data"]
WORKDIR ["/data"]
CMD ["/bin/bash"]
