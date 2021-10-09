#!/bin/sh

IMPORT_MODULE_PATH="/usr/local/import.sh/lib"

import_resolve(){
	local name="$1"
	echo "$IMPORT_MODULE_PATH/${name}.sh"
}

import_file(){
	local name="$1"
	local filename="$(import_resolve $name)"
	if [ ! -f "$filename" ]; then
		echo "Error: Module $name not found!"
		return 1
	fi
	source $filename
}

import_url(){
	local url="$1"
	local name=$(basename "$url" .sh)
	import_file "$name" 2>/dev/null && return
	local filename="$(import_resolve $name)"
	local path=$(dirname $filename)
	mkdir -p $path || return
	curl -sL "$url" > "$filename"
	import_file "$name"
}

import(){
	local name=$1
	if [[ "$name" =~ "://" ]]; then
		import_url $name
	else
		import_file $name
	fi
}

if [ "$#" -eq 0 ]; then
	echo "Usage: $0 script.sh"
	exit 1
fi

SCRIPT_PATH="$1"
source "$SCRIPT_PATH"
