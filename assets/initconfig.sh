#!/bin/bash
# Create some defaults in the ansible configuration directory.
# returns 0 if changed, 3 if nothing changed.

RVAL=3

if [ ! -d /config/sshkeys ]; then
  echo "Creating sshkeys directory"
  mkdir /config/sshkeys
  RVAL=0
fi

if [ ! -e /config/ansible.cfg ]; then
echo "Creating default ansible.cfg"
cat <<EOF > /config/ansible.cfg
[defaults]
host_key_checking = false
pipelining = true
EOF
RVAL=0
fi

exit ${RVAL}
