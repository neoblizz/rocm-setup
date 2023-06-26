#!/bin/bash

function main(){
    cd ${GITHUB_WORKSPACE}/${INPUT_WORKING_DIR}
    echo "Hello World"
    hipcc --version
}

main
