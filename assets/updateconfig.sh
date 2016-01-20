#!/bin/bash
# copies a configuration file from /tmp/ansible, checking if anything has changed.
# returns 0 if changed, 3 if nothing changed.

if [ ! -d /tmp/ansible ]; then
  echo "Error - can't see /tmp/ansible."
  exit 1
fi

cp /tmp/ansible/* /config/ansible.cfg.new

if [ ! -e /config/ansible.cfg.new ]; then
  echo "New config file does not exist." >&2
  exit 1
fi

diff /config/ansible.cfg.new /config/ansible.cfg >/dev/null 2>&1
if [ $? -eq 0 ]; then 
   rm /config/ansible.cfg.new
   exit 3
fi

cp /config/ansible.cfg.new /config/ansible.cfg
rm /config/ansible.cfg.new

exit 0
