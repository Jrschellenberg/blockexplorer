#!/bin/bash
WRITE_PATH=${WORKING_PATH}/settings.json
rm ${WRITE_PATH}

echo '{' >> ${WRITE_PATH}
echo '  "title": "${COIN} Block Explorer",' >> ${WRITE_PATH}
echo '  "address": "localhost:${PORT}",' >> ${WRITE_PATH}
echo '  "coin": "${COIN}",' >> ${WRITE_PATH}
echo '  "symbol": "${SYMBOL}",' >> ${WRITE_PATH}
echo '  "logo": "/images/logo.png",' >> ${WRITE_PATH}
echo '  "favicon": "public/favicon.ico",' >> ${WRITE_PATH}
echo '  "theme": "${THEME}",' >> ${WRITE_PATH}
echo '  "port" : ${PORT},' >> ${WRITE_PATH}
echo '  "dbsettings": {' >> ${WRITE_PATH}
echo '    "user": "${DB_USER}",' >> ${WRITE_PATH}
echo '    "password": "${DB_PASSWORD}",' >> ${WRITE_PATH}
echo '    "database": "${DB_DATABASE}",' >> ${WRITE_PATH}
echo '    "address": "${DB_CONTAINER_NAME}",' >> ${WRITE_PATH}
echo '    "port": 27017' >> ${WRITE_PATH}
echo '  },' >> ${WRITE_PATH}

echo '  "update_timeout": 10,' >> ${WRITE_PATH}
echo '  "check_timeout": 250,' >> ${WRITE_PATH}

echo '  "wallet": {' >> ${WRITE_PATH}
echo '    "host": "localhost",' >> ${WRITE_PATH}
echo '    "port": ${WALLET_PORT},' >> ${WRITE_PATH}
echo '    "user": "${WALLET_USER}",' >> ${WRITE_PATH}
echo '    "pass": "${WALLET_PASSWORD}"' >> ${WRITE_PATH}
echo '  },' >> ${WRITE_PATH}

echo '  "confirmations": 40,' >> ${WRITE_PATH}
echo '  "locale": "locale/en.json",' >> ${WRITE_PATH}

echo '  "display": {' >> ${WRITE_PATH}
echo '    "api": true,' >> ${WRITE_PATH}
echo '    "markets": false,' >> ${WRITE_PATH}
echo '    "richlist": true,' >> ${WRITE_PATH}
echo '    "twitter": false,' >> ${WRITE_PATH}
echo '    "facebook": false,' >> ${WRITE_PATH}
echo '    "googleplus": false,' >> ${WRITE_PATH}
echo '    "search": true,' >> ${WRITE_PATH}
echo '    "movement": true,' >> ${WRITE_PATH}
echo '    "network": true' >> ${WRITE_PATH}
echo '  },' >> ${WRITE_PATH}

echo '  "index": {' >> ${WRITE_PATH}
echo '    "show_hashrate": true,' >> ${WRITE_PATH}
echo '    "difficulty": "POW",' >> ${WRITE_PATH}
echo '    "last_txs": 100' >> ${WRITE_PATH}
echo '  },' >> ${WRITE_PATH}

echo '  "api": {' >> ${WRITE_PATH}
echo '    "blockindex": ${BLOCKINDEX},' >> ${WRITE_PATH}
echo '    "blockhash": "${BLOCKHASH}",' >> ${WRITE_PATH}
echo '    "txhash": "${TXHASH}",' >> ${WRITE_PATH}
echo '    "address": "${ADDRESS}"' >> ${WRITE_PATH}
echo '  },' >> ${WRITE_PATH}

echo '  "markets": {' >> ${WRITE_PATH}
echo '    "coin": "JBS",' >> ${WRITE_PATH}
echo '    "exchange": "BTC",' >> ${WRITE_PATH}
echo '    "enabled": ["bittrex"],' >> ${WRITE_PATH}
echo '    "cryptopia_id": "1658",' >> ${WRITE_PATH}
echo '    "ccex_key" : "Get-Your-Own-Key",' >> ${WRITE_PATH}
echo '    "default": "bittrex"' >> ${WRITE_PATH}
echo '  },' >> ${WRITE_PATH}

echo '  "richlist": {' >> ${WRITE_PATH}
echo '    "distribution": true,' >> ${WRITE_PATH}
echo '    "received": true,' >> ${WRITE_PATH}
echo '    "balance": true' >> ${WRITE_PATH}
echo '  },' >> ${WRITE_PATH}

echo '  "movement": {' >> ${WRITE_PATH}
echo '    "min_amount": 300,' >> ${WRITE_PATH}
echo '    "low_flag": 3000,' >> ${WRITE_PATH}
echo '    "high_flag": 10000' >> ${WRITE_PATH}
echo '  },' >> ${WRITE_PATH}

echo '  "twitter": "iquidus",' >> ${WRITE_PATH}
echo '  "facebook": "yourfacebookpage",' >> ${WRITE_PATH}
echo '  "googleplus": "yourgooglepluspage",' >> ${WRITE_PATH}

echo '  "genesis_tx": "${GENESIS_TX}",' >> ${WRITE_PATH}
echo '  "genesis_block": "${GENESIS_BLOCK}",' >> ${WRITE_PATH}

echo '  "heavy": false,' >> ${WRITE_PATH}

echo '  "txcount": 100,' >> ${WRITE_PATH}

echo '  "show_sent_received": true,' >> ${WRITE_PATH}

echo '  "supply": "COINBASE",' >> ${WRITE_PATH}

echo '  "nethash": "getnetworkhashps",' >> ${WRITE_PATH}

echo '  "nethash_units": "M",' >> ${WRITE_PATH}

echo '  "labels": {' >> ${WRITE_PATH}
echo '  }' >> ${WRITE_PATH}
echo '}' >> ${WRITE_PATH}


