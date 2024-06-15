#!/bin/bash

A3gameID=107410
SteamPath="/home/steam/Steam"

cd /home/steam/steamcmd
export IFS=";"
for modID in $SERVER_MODS; do
    n=0
    while [ $DOWNLOADRETRY -ge $n ]; do
        if [ ! -d "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}" ]; then
            echo "Starting download ${modID}..."
            ./steamcmd.sh +login $STEAMLOGIN +workshop_download_item $A3gameID $modID validate +quit
        else
            echo "${modID} Downloaded."
            unset IFS
            cd "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}"
            find . -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;
            echo "Moving ${modID}."
            if [ ! -d "${SteamPath}/steamapps/common/Arma 3 Server/${modID}" ]; then
                mv "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}" "${SteamPath}/steamapps/common/Arma 3 Server/${modID}"
            fi
            if [ ! -d "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}" ]; then
                ln -s "${SteamPath}/steamapps/common/Arma 3 Server/${modID}" "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}"
            fi
            break
        fi
        n=$((n+1))
    done
done


cp "${SteamPath}/steamapps/common/Arma 3 Server/keys/a3.bikey" "${SteamPath}/steamapps/common/Arma 3 Server/a3.bikey.bac"
find "${SteamPath}/steamapps/common/Arma 3 Server/keys/" -type f -name '*.bikey' ! -name 'a3.bikey' -delete

cd /home/steam/steamcmd
export IFS=";"
for modID in $OPTIONAL_MODS; do
    n=0
    while [ $DOWNLOADRETRY -ge $n ]; do
        if [ ! -d "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}" ]; then
            echo "Starting download ${modID}..."
            ./steamcmd.sh +login $STEAMLOGIN +workshop_download_item $A3gameID $modID validate +quit
        else
            echo "${modID} Downloaded."
            unset IFS
            cd "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}"
            find . -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;
            echo "Moving ${modID}."
            find "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}/" -name *.bikey -exec cp {} "${SteamPath}/steamapps/common/Arma 3 Server/keys/" ';'
            break
        fi
        n=$((n+1))
    done
done


cd /home/steam/steamcmd
export IFS=";"
for modID in $REQUIRED_MODS; do
    n=0
    while [ $DOWNLOADRETRY -ge $n ]; do
        if [ ! -d "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}" ]; then
            echo "Starting download ${modID}..."
            ./steamcmd.sh +login $STEAMLOGIN +workshop_download_item $A3gameID $modID validate +quit
        else
            echo "${modID} Downloaded."
            unset IFS
            cd "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}"
            find . -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;
            echo "Moving ${modID}."
            find "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}/" -name *.bikey -exec cp {} "${SteamPath}/steamapps/common/Arma 3 Server/keys/" ';'
            if [ ! -d "${SteamPath}/steamapps/common/Arma 3 Server/@${modID}" ]; then
                mv "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}" "${SteamPath}/steamapps/common/Arma 3 Server/@${modID}"
            fi
            if [ ! -d "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}" ]; then
                ln -s "${SteamPath}/steamapps/common/Arma 3 Server/@${modID}" "${SteamPath}/steamapps/workshop/content/${A3gameID}/${modID}"
            fi
            break
        fi
        n=$((n+1))
    done
done

unset IFS
