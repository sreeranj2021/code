#!/usr/bin/sh

while getopts u:a: flag
do
    case "${flag}" in
        u) hash=${OPTARG};;
        a) branch=${OPTARG};;
    esac
done

echo "$hash" >> /home/sysadmin/scriptoutput.txt
echo "$branch" >> /home/sysadmin/scriptoutput.txt
