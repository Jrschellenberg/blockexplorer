CONTAINER_NAME=explorer
# deploy Script
export CONTAINER_NAME=$CONTAINER_NAME
docker-compose -p cron up -d --build
