#!/bin/sh
### Explain ###
# $(pwd)を使っているので、カレントディレクトリで実行すること
# letsencryptの証明書を取得します
# ステージングサーバからテスト証明書を取得する
# -> ./letsencrypt.sh --test-cert 
# 


. $(pwd)/.config
# ドキュメントルート
WEBROOT=$(pwd)

echo "DOMAIN    :"$DOMAIN
echo "WEBROOT   :"$WEBROOT
echo "EMAIL     :"$EMAIL

certbot certonly -m $EMAIL \
--agree-tos -n $* --webroot -w $WEBROOT -d $DOMAIN

# -m EMAIL         Email address for important account notifications
# --agree-tos       Agree to the ACME server's Subscriber Agreement
# -n               Run non-interactively
# $*               Linuxの特殊変数で、コマンド実行時の引数を分割して格納
# --webroot         Place files in a server's webroot folder for authentication
# -d DOMAINS       Comma-separated list of domains to obtain a certificate for
