CONTAINER_NAME=explorer
# deploy Script
export CONTAINER_NAME=$CONTAINER_NAME
export PORT=3001
docker-compose -p $CONTAINER_NAME up --build
