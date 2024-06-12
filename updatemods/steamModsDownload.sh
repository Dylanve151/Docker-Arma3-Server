#!/bin/bash

export IFS=";"
A3gameID=107410
SteamPath="/home/steam/Steam"

cd /home/steam/steamcmd

for modID in $SERVER_MODS; do
    if [ -d "${SteamPath}/steamapps/common/Arma 3 Server/@${modID}" ]; then
        ln -s "${SteamPath}/steamapps/common/Arma 3 Server/${modID}" "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}"
        nomove=1
    else
        nomove=0
    fi
    n=0
    while [ $DOWNLOADRETRY -ge $n ]; do
        if [ ! -d "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}" ]; then
            echo "Starting download ${modID}..."
            ./steamcmd.sh +login $STEAMLOGIN +workshop_download_item $A3gameID $modID validate +quit
        else
            echo "${modID} Downloaded."
            echo "Moving ${modID}."
            if [ 1 -gt $nomove ]; then
                mv "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}" "${SteamPath}/steamapps/common/Arma 3 Server/${modID}"
            fi
            break
        fi
        n=$((n+1))
    done
done

for modID in $OPTIONAL_MODS; do
    if [ -d "${SteamPath}/steamapps/common/Arma 3 Server/@${modID}" ]; then
        ln -s "${SteamPath}/steamapps/common/Arma 3 Server/@${modID}" "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}"
        nomove=1
    else
        nomove=0
    fi
    n=0
    while [ $DOWNLOADRETRY -ge $n ]; do
        if [ ! -d "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}" ]; then
            echo "Starting download ${modID}..."
            ./steamcmd.sh +login $STEAMLOGIN +workshop_download_item $A3gameID $modID validate +quit
        else
            echo "${modID} Downloaded."
            echo "Moving ${modID}."
            if [ 1 -gt $nomove ]; then
                mv "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}" "${SteamPath}/steamapps/common/Arma 3 Server/${modID}"
            fi
            break
        fi
        n=$((n+1))
    done
done

for modID in $REQUIRED_MODS; do
    if [ -d "${SteamPath}/steamapps/common/Arma 3 Server/@${modID}" ]; then
        ln -s "${SteamPath}/steamapps/common/Arma 3 Server/@${modID}" "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}"
        nomove=1
    else
        nomove=0
    fi
    n=0
    while [ $DOWNLOADRETRY -ge $n ]; do
        if [ ! -d "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}" ]; then
            echo "Starting download ${modID}..."
            ./steamcmd.sh +login $STEAMLOGIN +workshop_download_item $A3gameID $modID validate +quit
        else
            echo "${modID} Downloaded."
            echo "Moving ${modID}."
            if [ 1 -gt $nomove ]; then
                mv "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}" "${SteamPath}/steamapps/common/Arma 3 Server/${modID}"
            fi
            break
        fi
        n=$((n+1))
    done
done

unset IFS
