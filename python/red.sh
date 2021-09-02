#!/bin/bash
echo pulsar77 | sudo -S redis-server /etc/redis/redis.conf
ps -eaf | grep redis
