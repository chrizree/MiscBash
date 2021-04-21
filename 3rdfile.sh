#!/bin/bash

if [ ! $(which xclip) ]
then
    echo ""
    echo "xclip doesn't seem to be installed, please install it first!"
    echo ""
    exit
fi

if [ ! $1 ]
then
    echo ""
    echo "You need to specify the directory to scan as a parameter to this script, for example ./3rdfile.sh /root/Documents"
    echo ""
    exit
fi

if [ ! -d "$1" ]
then
    echo ""
    echo "The directory that you have specified does not exist"
    echo ""
    exit
fi

DIR_TO_LIST="$1"

#or, if you want to specify the directory "hard coded" (delete the parameter and dir check above if so)
#DIR_TO_LIST="add path to the directory that holds the files to check"

#or, if you want to use the full directory of the bash script as "base" directory (delete the parameter and dir check above if so)
#DIR_TO_LIST="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

array=($(ls -1 -p $DIR_TO_LIST))
counter="0"
counter_stop="3"

for arr_obj in "${array[@]}"
do
    if [ ! "${arr_obj: -1}" == "/" ]
    then
        counter=$((counter+1))
        if [ "$counter" == "$counter_stop" ]
        then
            xclip -sel clip $1/$arr_obj
            exit
        fi
    fi
done
