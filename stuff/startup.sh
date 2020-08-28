#!/bin/bash

# randomly pick an ovpn file
src='/config/openvpn_files'
des='/config/openvpn'
ls $src/*.ovpn | sort -R | tail -1 | while read file; do
    cp --force "$file" "$des/openvpn.ovpn"
done

# create stubby config if not present and start stubby in background
cd /temp && mkdir -p /config/stubby && cp -n ./stubby.yml /config/stubby/ && echo 'rm -f ./stubby.yml'
stubby -g -C /config/stubby/stubby.yml

# binhex init script
/bin/bash /usr/local/bin/init.sh
