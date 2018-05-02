#!/bin/bash
rm "$WORKING_PATH/settings.json"

echo '{' >> "$WORKING_PATH/settings.json"
echo '  "title": "$COIN Block Explorer",' >> "$WORKING_PATH/settings.json"
echo '  "address": "localhost:$PORT",' >> "$WORKING_PATH/settings.json"
echo '  "coin": "$COIN",' >> "$WORKING_PATH/settings.json"
echo '  "symbol": "$SYMBOL",' >> "$WORKING_PATH/settings.json"
echo '  "logo": "/images/logo.png",' >> "$WORKING_PATH/settings.json"
echo '  "favicon": "public/favicon.ico",' >> "$WORKING_PATH/settings.json"
echo '  "theme": "$THEME",' >> "$WORKING_PATH/settings.json"
echo '  "port" : $PORT,' >> "$WORKING_PATH/settings.json"
echo '  "dbsettings": {' >> "$WORKING_PATH/settings.json"
echo '    "user": "$DB_USER",' >> "$WORKING_PATH/settings.json"
echo '    "password": "$DB_PASSWORD",' >> "$WORKING_PATH/settings.json"
echo '    "database": "$DB_DATABASE",' >> "$WORKING_PATH/settings.json"
echo '    "address": "$DB_CONTAINER_NAME",' >> "$WORKING_PATH/settings.json"
echo '    "port": 27017' >> "$WORKING_PATH/settings.json"
echo '  },' >> "$WORKING_PATH/settings.json"

echo '  "update_timeout": 10,' >> "$WORKING_PATH/settings.json"
echo '  "check_timeout": 250,' >> "$WORKING_PATH/settings.json"

echo '  "wallet": {' >> "$WORKING_PATH/settings.json"
echo '    "host": "localhost",' >> "$WORKING_PATH/settings.json"
echo '    "port": $WALLET_PORT,' >> "$WORKING_PATH/settings.json"
echo '    "user": "$WALLET_USER",' >> "$WORKING_PATH/settings.json"
echo '    "pass": "$WALLET_PASSWORD"' >> "$WORKING_PATH/settings.json"
echo '  },' >> "$WORKING_PATH/settings.json"

echo '  "confirmations": 40,' >> "$WORKING_PATH/settings.json"
echo '  "locale": "locale/en.json",' >> "$WORKING_PATH/settings.json"

echo '  "display": {' >> "$WORKING_PATH/settings.json"
echo '    "api": true,' >> "$WORKING_PATH/settings.json"
echo '    "markets": false,' >> "$WORKING_PATH/settings.json"
echo '    "richlist": true,' >> "$WORKING_PATH/settings.json"
echo '    "twitter": false,' >> "$WORKING_PATH/settings.json"
echo '    "facebook": false,' >> "$WORKING_PATH/settings.json"
echo '    "googleplus": false,' >> "$WORKING_PATH/settings.json"
echo '    "search": true,' >> "$WORKING_PATH/settings.json"
echo '    "movement": true,' >> "$WORKING_PATH/settings.json"
echo '    "network": true' >> "$WORKING_PATH/settings.json"
echo '  },' >> "$WORKING_PATH/settings.json"

echo '  "index": {' >> "$WORKING_PATH/settings.json"
echo '    "show_hashrate": true,' >> "$WORKING_PATH/settings.json"
echo '    "difficulty": "POW",' >> "$WORKING_PATH/settings.json"
echo '    "last_txs": 100' >> "$WORKING_PATH/settings.json"
echo '  },' >> "$WORKING_PATH/settings.json"

echo '  "api": {' >> "$WORKING_PATH/settings.json"
echo '    "blockindex": $BLOCKINDEX,' >> "$WORKING_PATH/settings.json"
echo '    "blockhash": "$BLOCKHASH",' >> "$WORKING_PATH/settings.json"
echo '    "txhash": "$TXHASH",' >> "$WORKING_PATH/settings.json"
echo '    "address": "$ADDRESS"' >> "$WORKING_PATH/settings.json"
echo '  },' >> "$WORKING_PATH/settings.json"

echo '  "markets": {' >> "$WORKING_PATH/settings.json"
echo '    "coin": "JBS",' >> "$WORKING_PATH/settings.json"
echo '    "exchange": "BTC",' >> "$WORKING_PATH/settings.json"
echo '    "enabled": ["bittrex"],' >> "$WORKING_PATH/settings.json"
echo '    "cryptopia_id": "1658",' >> "$WORKING_PATH/settings.json"
echo '    "ccex_key" : "Get-Your-Own-Key",' >> "$WORKING_PATH/settings.json"
echo '    "default": "bittrex"' >> "$WORKING_PATH/settings.json"
echo '  },' >> "$WORKING_PATH/settings.json"

echo '  "richlist": {' >> "$WORKING_PATH/settings.json"
echo '    "distribution": true,' >> "$WORKING_PATH/settings.json"
echo '    "received": true,' >> "$WORKING_PATH/settings.json"
echo '    "balance": true' >> "$WORKING_PATH/settings.json"
echo '  },' >> "$WORKING_PATH/settings.json"

echo '  "movement": {' >> "$WORKING_PATH/settings.json"
echo '    "min_amount": 300,' >> "$WORKING_PATH/settings.json"
echo '    "low_flag": 3000,' >> "$WORKING_PATH/settings.json"
echo '    "high_flag": 10000' >> "$WORKING_PATH/settings.json"
echo '  },' >> "$WORKING_PATH/settings.json"

echo '  "twitter": "iquidus",' >> "$WORKING_PATH/settings.json"
echo '  "facebook": "yourfacebookpage",' >> "$WORKING_PATH/settings.json"
echo '  "googleplus": "yourgooglepluspage",' >> "$WORKING_PATH/settings.json"

echo '  "genesis_tx": "$GENESIS_TX",' >> "$WORKING_PATH/settings.json"
echo '  "genesis_block": "$GENESIS_BLOCK",' >> "$WORKING_PATH/settings.json"

echo '  "heavy": false,' >> "$WORKING_PATH/settings.json"

echo '  "txcount": 100,' >> "$WORKING_PATH/settings.json"

echo '  "show_sent_received": true,' >> "$WORKING_PATH/settings.json"

echo '  "supply": "COINBASE",' >> "$WORKING_PATH/settings.json"

echo '  "nethash": "getnetworkhashps",' >> "$WORKING_PATH/settings.json"

echo '  "nethash_units": "M",' >> "$WORKING_PATH/settings.json"

echo '  "labels": {' >> "$WORKING_PATH/settings.json"
echo '  }' >> "$WORKING_PATH/settings.json"
echo '}' >> "$WORKING_PATH/settings.json"


