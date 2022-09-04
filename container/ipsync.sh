#!/bin/bash

username=$username
api_key=$api_key
domains=($domains)
ip_address=$ip_address
ttl=$ttl
activate_wildcard=$activate_wildcard
sleeptimer=$sleeptimer

if [ test -z "$username" || -z "$api_key" ]; then
  echo 'Your Username/Email address and apikey need to be set by env variables username and api_key'
  exit 1
fi

#if [ -z "$domains" ]; then
#  $domains="all"
#fi
#
#if [ -z "$ip_address" ]; then
#  $ip_address="auto"
#fi
#
#if [ -z "$ttl" ]; then
#  $ttl="300"
#fi
#
#if [ -z "$activate_wildcardl" ]; then
#  $activate_wildcard="false"
#fi
#
#if [ -z "$sleeptimer" ]; then
#  $sleeptimer=2160
#fi

while true
do
    echo "timestamp" | ts '[%Y-%m-%d %H:%M:%S]'
    for domain in "${domains[@]}"; do
    curl --fail-with-body -X PUT -u $username:$api_key -d '{"ip_address": "$ip_address", "ttl": "$ttl", "activate_wildcard": "$activate_wildcard"}' https://api.twodns.de/hosts/$domain
    retVal=$?
    if [ $retVal -ne 0 ]; then
    exit 1
    fi
    done
    echo "sleep for $sleeptimer" | ts '[%Y-%m-%d %H:%M:%S]'
    sleep $sleeptimer 
done
