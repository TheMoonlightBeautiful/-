#!/system/bin/sh

ps -ef | grep app | awk '{print $2}' | xargs kill -9
