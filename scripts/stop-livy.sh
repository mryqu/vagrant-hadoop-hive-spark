#!/bin/bash

source "/vagrant/scripts/common.sh"

function stopLivy {
    echo "stopping Livy server"
    livy-server stop
    echo "listing all Java processes"
    jps
}

stopLivy