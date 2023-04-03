#!/usr/bin/env bash
function get_random() {
	case "$1" in
	hex)
		openssl rand -hex "$2"
		;;
	dec)
		tr -dc '0-9' </dev/urandom | head -c "$2"
		;;
	oct)
		tr -dc '0-7' </dev/urandom | head -c "$2"
		;;
	*)
		echo "Invalid argument: $1. Valid arguments are hex, dec, or oct."
		;;
	esac
}
