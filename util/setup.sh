#!/bin/bash

# go to project root.
cd ..

# base dir for submodules
# and the location of a text file containing new repos to add
BASE_DIR="res/lists"
REPO_LST="res/repos.txt"

# create base dir if it doesn't exist.
if [ ! -d ${BASE_DIR} ]
then
    mkdir -p ${BASE_DIR}
fi

# initialize any existing submodules there may be.
git submodule update --init --recursive

# loop over repos and add as submodule. to prevent name collisions, the local
# repo is renamed to user-repo.git all lowercase.
for repo in `cat ${REPO_LST}`
do
    local=$(echo ${repo} | cut -d: -f2- | tr '[:upper:]' '[:lower:]' | tr '/' '-')
    if [ -d ${BASE_DIR}/${local} ]
    then
        echo "submodule exists. skipping."
    else
        git submodule add --depth 1 ${repo} ${BASE_DIR}/${local}
    fi
done

