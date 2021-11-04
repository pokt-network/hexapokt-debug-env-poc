#!/usr/bin/env bash

pid=$(docker exec -t --user root debug_pokt_node_1 /bin/ps | grep -v 'grep' | grep 'pocket-core start' | awk '{print $1}')
echo $pid
docker exec -t --user root debug_pokt_node_1 /bin/bash -c "/go/bin/dlv attach $pid --headless --accept-multiclient --listen=:2345 --api-version=2" &

pid=$(docker exec -t --user root debug_pokt_node_2 /bin/ps | grep -v 'grep' | grep 'pocket-core start' | awk '{print $1}')
echo $pid
docker exec -t --user root debug_pokt_node_2 /bin/bash -c "/go/bin/dlv attach $pid --headless --accept-multiclient --listen=:2345 --api-version=2" &

pid=$(docker exec -t --user root debug_pokt_node_3 /bin/ps | grep -v 'grep' | grep 'pocket-core start' | awk '{print $1}')
echo $pid
docker exec -t --user root debug_pokt_node_3 /bin/bash -c "/go/bin/dlv attach $pid --headless --accept-multiclient --listen=:2345 --api-version=2" &

pid=$(docker exec -t --user root debug_pokt_node_4 /bin/ps | grep -v 'grep' | grep 'pocket-core start' | awk '{print $1}')
echo $pid
docker exec -t --user root debug_pokt_node_4 /bin/bash -c "/go/bin/dlv attach $pid --headless --accept-multiclient --listen=:2345 --api-version=2" &

pid=$(docker exec -t --user root debug_pokt_node_5 /bin/ps | grep -v 'grep' | grep 'pocket-core start' | awk '{print $1}')
echo $pid
docker exec -t --user root debug_pokt_node_5 /bin/bash -c "/go/bin/dlv attach $pid --headless --accept-multiclient --listen=:2345 --api-version=2" &
