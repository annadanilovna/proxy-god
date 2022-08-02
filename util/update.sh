#!/bin/bash

# - update submodules
# - grab lists from each
# - dedupe

# go to project root
cd ..
REPO_DIR="res/lists"

# pull any updates.
git submodule foreach 'git pull --rebase'

# cat out each type of proxy to a corresponding file and then cat all into proxy.txt
find ${REPO_DIR} -name *http.txt ! -path *archive* -exec cat {} + | sort -u > http.txt
find ${REPO_DIR} -name *https.txt ! -path *archive* -exec cat {} + | sort -u > https.txt
find ${REPO_DIR} -name *socks4.txt ! -path *archive* -exec cat {} + | sort -u > socks4.txt
find ${REPO_DIR} -name *socks5.txt ! -path *archive* -exec cat {} + | sort -u > socks5.txt

cat http.txt https.txt socks4.txt socks5.txt | sort -u > proxy.txt

# print counts of each
wc -l *.txt
