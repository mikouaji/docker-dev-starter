#!/bin/bash

# some functions source https://github.com/kojiromike/docker-magento/blob/master/apache/start_safe_perms

cd app || return

read DIR_OWNER DIR_GROUP DIR_OWNER_ID DIR_GROUP_ID < <(stat -c '%U %G %u %g' .)
if [[ $DIR_OWNER = UNKNOWN ]]; then
    DIR_OWNER=$(randname)
    if [[ $DIR_GROUP = UNKNOWN ]]; then
        DIR_GROUP=$DIR_OWNER
        addgroup --system --gid "$DIR_GROUP_ID" "$DIR_GROUP"
    fi
    adduser --system --uid=$DIR_OWNER_ID --gid=$DIR_GROUP_ID "$DIR_OWNER"
fi

#generate
randname() {
    local -x LC_ALL=C
    tr -dc '[:lower:]' < /dev/urandom |
        dd count=1 bs=16 2>/dev/null
}

if [[ ! -d node_modules ]]
then
    npm i -f
fi

npm run dev
