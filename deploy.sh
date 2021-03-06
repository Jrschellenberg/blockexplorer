#Variables

WORKING_PATH=/usr/src/app

COIN=Shekel
SYMBOL=JEW

DAEMON_NAME=${COIN,,}
CONF_FILE_NAME=${DAEMON_NAME}.conf

# Uses bootswatch themes (http://bootswatch.com/)
#Valid options:
#    Cerulean, Cosmo, Cyborg, Darkly, Flatly, Journal, Lumen, Paper,
#     Readable, Sandstone, Simplex, Slate, Spacelab, Superhero, United, Yeti
THEME=Cerulean
PORT=3001
#DB Variables
DB_USER=JustinCarly
DB_PASSWORD=m23Sm48brJHPWwF9rd2lM0
DB_DATABASE=admin

#Wallet Variables
WALLET_USER=JustinCarly
WALLET_PASSWORD=Pass123pass
WALLET_PORT=4400
WALLET_NODE_1=45.32.162.242
WALLET_NODE_2=89.40.6.112


#BlockExplorer API Variables
BLOCKINDEX=39516
BLOCKHASH=938f62d97091682ac7711fb5330da9ebe2a480073d763407217cd2c0c82d446a
TXHASH=b9e7714d5e62387f1ab7e9c08c0a23c58c58f9fdd92bac43a3fb507b068fa257
ADDRESS=JSgB4YwktLeaBUQfZRgiyMPsydSWZeUGhz

#Genesis Block Variables
GENESIS_TX=a1cbbd156e5c530444dc3c850daf40201fe37d3269bd84b1ff2333a1b0c55a90
GENESIS_BLOCK=0000077c3b0f8619314ed8f0d343673052ab36b3ebac8808bd3bed50b9d60cec


CONTAINER_NAME=${COIN}container
DB_CONTAINER_NAME=mongo${CONTAINER_NAME}

#Export all variables...
export WORKING_PATH=$WORKING_PATH

export COIN=$COIN
export SYMBOL=$SYMBOL

export DAEMON_NAME=$DAEMON_NAME
export CONF_FILE_NAME=$CONF_FILE_NAME

export THEME=$THEME

export DB_USER=$DB_USER
export DB_PASSWORD=$DB_PASSWORD
export DB_DATABASE=$DB_DATABASE


export WALLET_USER=$WALLET_USER
export WALLET_PASSWORD=$WALLET_PASSWORD
export WALLET_PORT=$WALLET_PORT
export WALLET_NODE_1=$WALLET_NODE_1
export WALLET_NODE_2=$WALLET_NODE_2


#BlockExplorer API Variables
export BLOCKINDEX=$BLOCKINDEX
export BLOCKHASH=$BLOCKHASH
export TXHASH=$TXHASH
export ADDRESS=$ADDRESS

#Genesis Block Variables
export GENESIS_TX=$GENESIS_TX
export GENESIS_BLOCK=$GENESIS_BLOCK

export CONTAINER_NAME=$CONTAINER_NAME
export DB_CONTAINER_NAME=$DB_CONTAINER_NAME
export PORT=$PORT

#Create coins directory if not exist!
if [ ! -d ./coins/.${DAEMON_NAME} ]; then
        mkdir ./coins/.${DAEMON_NAME}
fi

# deploy Script
docker-compose -p $CONTAINER_NAME up --build -d
