#!/bin/bash
# サーバのJARファイル
JARFILE=/mnt/ramdisk/minecraft_server.jar

# サーバに割り当てるメモリ
MEM=8G

# GCを実行するスレッド数、コア数と同じで
GCTHREADS=4

cd `dirname $0`
screen -UAmdS minecraft java -server -Xms${MEM} -Xmx${MEM} -XX:PermSize=256M -XX:MaxPermSize=256M -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:CMSInitiatingOccupancyFraction=70 -XX:+DisableExplicitGC -XX:+UseCompressedOops -XX:+OptimizeStringConcat -XX:+UseTLAB -XX:ParallelGCThreads=${GCTHREADS} -jar ${JARFILE} nogui
