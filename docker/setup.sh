#!/usr/bin/env bash
#/bin/sh
whoami
pwd

cd /home/infoowl/upsource/bin

pwd

./upsource.sh configure --listen-port 9090
./upsource.sh configure --base-url http://upsource:9090/
./upsource.sh run
