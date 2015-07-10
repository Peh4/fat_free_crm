#!/bin/bash
set -e

set_config() {
	key="$1"
	value="$2"
	sed_escaped_value="$(echo $value | sed 's/[\/&]/\\&/g')"
	sed "s/$key/$key\ $sed_escaped_value/g" config/database.postgres.docker.yml > config/database.yml
}

if [ -z $DB_PASS ]; then
	set_config 'password:' "$DB_PASS"