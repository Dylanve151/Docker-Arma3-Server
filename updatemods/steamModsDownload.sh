#!/bin/bash

export IFS=";"
A3gameID=107410
A3ModsPath="/home/steam/Steam"

cd /home/steam/steamcmd

for modID in $SERVER_MODS; do
    n=0
    while [ $DOWNLOADRETRY -ge $n ]; do
        if [ ! -d "${A3ModsPath}/steamapps/workshop/content/${A3gameID}/${modID}" ]; then
            echo "Starting download ${modID}..."
            ./steamcmd.sh +login $STEAMLOGIN +workshop_download_item $A3gameID $modID validate +quit
        else
            echo "${modID} Downloaded."
            break
        fi
        n=$((n+1))
    done
done

for modID in $OPTIONAL_MODS; do
    n=0
    while [ $DOWNLOADRETRY -ge $n ]; do
        if [ ! -d "${A3ModsPath}/steamapps/workshop/content/${A3gameID}/${modID}" ]; then
            echo "Starting download ${modID}..."
            ./steamcmd.sh +login $STEAMLOGIN +workshop_download_item $A3gameID $modID validate +quit
        else
            echo "${modID} Downloaded."
            break
        fi
        n=$((n+1))
    done
done

for modID in $REQUIRED_MODS; do
    n=0
    while [ $DOWNLOADRETRY -ge $n ]; do
        if [ ! -d "${A3ModsPath}/steamapps/workshop/content/${A3gameID}/${modID}" ]; then
            echo "Starting download ${modID}..."
            ./steamcmd.sh +login $STEAMLOGIN +workshop_download_item $A3gameID $modID validate +quit
        else
            echo "${modID} Downloaded."
            break
        fi
        n=$((n+1))
    done
done

unset IFS
