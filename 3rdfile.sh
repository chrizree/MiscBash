#!/bin/bash

DIR_TO_LIST="add path to the directory that holds the files to check"

array=($(ls -1 -p $DIR_TO_LIST))
counter="0"

for arr_obj in "${array[@]}"
do
    temp_str="$arr_obj"
    if [ ! "${temp_str: -1}" == "/" ]
    then
        counter=$((counter+1))
        if [ "$counter" == "3" ]
        then
            xclip -sel clip $arr_obj
            exit
        fi
    fi
done

