CONTAINER_NAME=shekel
DB_CONTAINER_NAME=mongoShekel
# deploy Script
export CONTAINER_NAME=$CONTAINER_NAME
export DB_CONTAINER_NAME=$DB_CONTAINER_NAME
export PORT=3001
docker-compose -p $CONTAINER_NAME up --build -d
