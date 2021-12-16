#! /bin/bash

# Ensure these .txt files are in the same dir or specify full path
readarray -t target <target_list.txt
readarray -t payload <payload_list.txt
readarray -t headers <headers.txt

for i in ${!target[@]}; do 
    for j in ${!headers[@]}; do
        for k in ${!payload[@]}; do
            # Echo current value of Target/Header/Payload for each request sent; visual tracking purposes
            echo Target - ${target[i]}  - Header - ${headers[j]} - Payload - ${payload[k]}
            # Sending HTTP response to /dev/null, will blow up terminal if turned off
            curl --insecure ${target[i]} -H "${headers[j]}: ${payload[i]}" > /dev/null 2>&1;
            # sleep
        done;
    done;
done
