#!/bin/bash
#screenを起動
#起動したscreenにMC起動コマンド流し込み
screen -AmdS mcsrv01 \
  && sleep 5s \
  && screen -r mcsrv01 -p 0 -X exec <Server start FullPath>
