#!/bin/bash
MONTH_BEFORE=$(date +%m --date="$(date +%m) -1 month")
MONTH=$(date +%m)
YEAR_BEFORE=$(date +%Y --date="$(date +%Y) -1 year")
YEAR=$(date +%Y)
CONF=/etc/lsyncd/lsyncd.conf.lua
TARGET='/folder-tosync-path/'

cat $CONF | grep "$TARGET/$YEAR" >> /dev/null 2>&1
if [ $? == 0 ] ; then
    cat $CONF | grep "$TARGET/$YEAR/$MONTH" >> /dev/null 2>&1
        if [ $? != 0 ] ; then
                sed -i "s|$TARGET/$YEAR/$MONTH_BEFORE|$TARGET/$YEAR/$MONTH|g" "$CONF"
                /etc/init.d/lsyncd restart
        fi
else
    sed -i "s|$TARGET/$YEAR_BEFORE/$MONTH_BEFORE|$TARGET/$YEAR/$MONTH|g" "$CONF"
        /etc/init.d/lsyncd restart
fi
