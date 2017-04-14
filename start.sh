#!/bin/bash
set -e
echo "launching redis-server on port 6379"
redis-server /opt/redis-stable/redis.conf
echo "launching redis-server on port 6380"
redis-server /opt/redis-stable/redis.conf --port 6380