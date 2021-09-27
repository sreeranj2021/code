#!/bin/bash
#
#############################################################################
# Script prints the metadata of EC2 instance within the instance.
# Few modification still has to be made to get some of the metadata correctly
# and get a json format.
#############################################################################

function validate_execution()
{
    # Check if the script is executed inside an Ec2 instance
        x=$(curl -s http://169.254.169.254/)
        if [ $? -gt 0 ]; then
                echo '[ERROR] Invalid. Command should be executed within Ec2 instance.'
                exit 1
        fi
}
function print_metadata() {
        metadata_value=$2
        output=$(curl -fs http://169.254.169.254/latest/meta-data/${metadata_value}/)
        if [ $? == 0 ]; then
                echo $1 - $output
        else
                echo "Unavailable"
        fi
}


validate_execution

for i in `curl -s http://169.254.169.254/latest/meta-data/`
do
        print_metadata $i $i
done
