# Ansible in a Docker container, accessed via ssh.

FROM debian
MAINTAINER j842

RUN apt-get update && \
    apt-get install -y \
    apt-transport-https software-properties-common \
    python-apt python-pycurl python-httplib2 \
    build-essential libssl-dev libffi-dev python-dev \
    python-pip git

RUN pip install ansible cryptography

RUN rm -rf /root/.ssh
RUN ln -s /root/.ssh /sshkeys

RUN echo 'export EDITOR=nano' >> /root/.bashrc

ADD ["./assets/ansiblerun","/usr/local/bin/ansiblerun"]

VOLUME ["/sshkeys","/data","/root/.ansible.cfg"]
EXPOSE 22
CMD ["/usr/local/bin/ansiblerun"]
