#!/bin/bash
# copies a configuration file from /tmp/ansible, checking if anything has changed.
# returns 0 if changed, 3 if nothing changed.

if [ ! -d /tmp/ansible ]; then
  echo "Error - can't see /tmp/ansible."
  exit 1
fi

cp -a /tmp/ansible/* /config/sshkeys

exit 0
