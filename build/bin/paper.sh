#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(readlink -f $(dirname "$0"))
PWD=$(pwd)
if [[ "$SCRIPT_DIR" != "$PWD/bin" ]]; then
	echo "This script must be run from the root of the server's directory" >/dev/stderr
	exit 1
fi

# Fix people forgetting to set this
sd "keepSpawnInMemory: 'true'" "keepSpawnInMemory: 'false'" plugins/Multiverse-Core/worlds.yml

exec java -server -Dlog4j.configurationFile=./Log4j2.xml -DIReallyKnowWhatIAmDoingISwear=true \
	-Xmx20G \
	-jar ./bin/paper-1.20.4-385.jar

