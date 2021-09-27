#########################################################################
#Script to get value of object in specific format.
#Usage ./getjsonvalue.sh '{"a":{"b":{"c":"d"}}}' a/b/c
##########################################################################

#!/bin/bash
function get_value() {
        object=$1
        key=$2
        data2=$(echo $key | tr '/' '.')
		if [ $? != 0 ]; then
               echo "Input format in correct. Eg: Usage ./getjsonvalue.sh '{"a":{"b":{"c":"d"}}}' a/b/c"
        fi
        echo "$1" | jq ".$data2"
}

 get_value $1 $2