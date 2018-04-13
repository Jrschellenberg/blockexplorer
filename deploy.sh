CONTAINER_NAME=explorer
# deploy Script
export CONTAINER_NAME=$CONTAINER_NAME
export PORT=8080
docker-compose -p $CONTAINER_NAME up -d --build