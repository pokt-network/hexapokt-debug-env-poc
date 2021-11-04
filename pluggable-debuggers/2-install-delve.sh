#!/usr/bin/env bash

docker exec -t --user root debug_pokt_node_1 go install github.com/go-delve/delve/cmd/dlv@latest
docker exec -t --user root debug_pokt_node_2 go install github.com/go-delve/delve/cmd/dlv@latest
docker exec -t --user root debug_pokt_node_3 go install github.com/go-delve/delve/cmd/dlv@latest
docker exec -t --user root debug_pokt_node_4 go install github.com/go-delve/delve/cmd/dlv@latest
docker exec -t --user root debug_pokt_node_5 go install github.com/go-delve/delve/cmd/dlv@latest
