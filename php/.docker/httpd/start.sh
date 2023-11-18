#!/bin/bash

# some functions source https://github.com/kojiromike/docker-magento/blob/master/apache/start_safe_perms

node mongo-gui/server.js -p 3232 -u mongodb://root:root@mongo:27017 >/dev/null 2>&1 &

cd project || return

read DIR_OWNER DIR_GROUP DIR_OWNER_ID DIR_GROUP_ID < <(stat -c '%U %G %u %g' .)
if [[ $DIR_OWNER = UNKNOWN ]]; then
    DIR_OWNER=$(randname)
    if [[ $DIR_GROUP = UNKNOWN ]]; then
        DIR_GROUP=$DIR_OWNER
        addgroup --system --gid "$DIR_GROUP_ID" "$DIR_GROUP"
    fi
    adduser --system --uid=$DIR_OWNER_ID --gid=$DIR_GROUP_ID "$DIR_OWNER"
fi
tmp=/tmp/$RANDOM
{
    grep -v '^User' /etc/apache2/apache2.conf | grep -v '^Group'
} >> "$tmp" && cat "$tmp" > /etc/apache2/apache2.conf && rm "$tmp"
chown -R "$DIR_OWNER:$DIR_GROUP" /var/{lock,log,run}/apache*

#generate
randname() {
    local -x LC_ALL=C
    tr -dc '[:lower:]' < /dev/urandom |
        dd count=1 bs=16 2>/dev/null
}

docker-php-entrypoint apache2-foreground
