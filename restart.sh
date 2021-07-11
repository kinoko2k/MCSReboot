#!/bin/bash

# === 設定 ===
# サーバ終了までの待ち時間
WAIT=60
# サーバ起動スクリプト
STARTSCRIPT=/mnt/ramdisk/server.sh
# screenの名前(勝手に変えろ)
SCREEN_NAME='minecraft' 
# ============
# WAIT ={時間}が秒になる
screen -p 0 -S ${SCREEN_NAME} -X eval 'stuff "say '${WAIT}'秒後にサーバーを再起動します\015"'
screen -p 0 -S ${SCREEN_NAME} -X eval 'stuff "say すぐに再接続可能になるので、しばらくお待ち下さい\015"'

sleep $WAIT
screen -p 0 -S ${SCREEN_NAME} -X eval 'stuff "stop\015"'
# ===バックアップなどを停止中に行いたい場合はこの中に記載===

# rsync -a --delete /mnt/ramdisk/ /mnt/ramsave/

# ===バックアップなどを停止中に行いたい場合はこの中に記載===

# screen -listの結果から${SCREEN_NAME}が含まれるものを抽出し、空になるまでループ(結果、全て終了するまで待つ事になる)
while [ -n "$(screen -list | grep -o "${SCREEN_NAME}")" ]
do
  # 空回り防止
  sleep 1
done

$STARTSCRIPT
