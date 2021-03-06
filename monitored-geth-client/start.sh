#!/bin/bash
set -e
cd /root/eth-net-intelligence-api
perl -pi -e "s/XXX/$(hostname)/g" app.json
/usr/bin/pm2 start ./app.json
sleep 3
/usr/bin/geth --datadir=~/.ethereum/devchain init "/root/files/genesis.json"
sleep 3
/usr/bin/geth $@