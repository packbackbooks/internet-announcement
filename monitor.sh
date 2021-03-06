#!/bin/bash
on=0
off=1
state_up=$off
current_up=$state_up
while true
do
    ping -c 1 8.8.8.8 &> /dev/null
    rc=$?
    if [[ $rc -eq 0 ]] ; then
        current_up=$on
    else
        current_up=$off
    fi
    if [[ $current_up -ne $state_up ]] ; then
        state_up=$current_up
        if [[ $state_up -eq $on ]] ; then
            echo `say The internet is up.` &> /dev/null
        else
            echo `say The internet is down.` &> /dev/null
        fi
    fi
    sleep 1
done
