#!/bin/bash

set -euxo pipefail

ID=$(head -c 4 /dev/urandom | xxd -p)

cog build -t cog-health-check-test:$ID

CONTAINER=$(docker run -d -p 5555:5000 cog-health-check-test:$ID python -m cog.server.http --threads=10)

sleep 5 # wait for the server to start

curl http://localhost:5555/predictions -X POST -H 'Content-Type: application/json' -d '{"input": {"text":"world"}}' &
curl http://localhost:5555/health-check &

wait

docker stop $CONTAINER
docker rm $CONTAINER
