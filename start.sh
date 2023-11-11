#!/bin/bash
if [[ ! -f /etc/privacyidea/pi.cfg ]]; then
  echo 'You should create/mount pi.cfg to /etc/privacyidea/pi.cfg at first.'
  echo 'Program exiting in 10s'
  sleep 10
  exit 1
fi
  
if [[ ! -f /etc/privacyidea/data.sqlite ]] && [[ ! -f /etc/privacyidea/enckey ]]; then
  ./pi-manage create_tables
  ./pi-manage create_enckey
  ./pi-manage db stamp head -d migrations/
  ./pi-manage create_audit_keys
  echo 'You should create admin in the container by run: ./pi-manage admin add <username>'
fi

./uwsgi_py310_ubuntu_jammy_amd64 --ini uwsgi.ini
