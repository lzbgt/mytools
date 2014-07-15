#!/bin/bash
# bruce.lu 2014/07/15, a replacement to add_line_to_cron.sh
# persistent the live cron table by merging it into the cron document for startup.

FLOODGUARD=/floodguard

IFS=$'\n';
LIVE=($(crontab -l));
DOC=($(cat $FLOODGUARD/conf/cron))
for live in ${LIVE[@]}
do
    #echo live:$live
    for doc in ${DOC[@]}
    do
        echo doc:$doc
        if [[ $live == $doc ]]; then
            continue 2
        fi
    done
    # merge
    #echo "merge"
    echo $live >> $FLOODGUARD/conf/cron
done

crontab $FLOODGUARD/conf/cron

        
 
