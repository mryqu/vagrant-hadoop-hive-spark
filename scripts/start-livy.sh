#!/bin/bash

source "/vagrant/scripts/common.sh"

function startLivy {
    echo "starting Livy server"
    livy-server start
    echo "listing all Java processes"
    jps
}

startLivy