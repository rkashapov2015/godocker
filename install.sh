#!/usr/bin/env bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "${SCRIPT_DIR}"

if [ ! -d webproject ]; then
    git clone https://github.com/rkashapov2015/go-webproject.git -b main webproject
fi

docker compose build