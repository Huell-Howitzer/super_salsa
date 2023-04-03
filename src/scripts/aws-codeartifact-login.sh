#!/usr/bin/env bash

function Login() {
	local tool="$1"
	local repository="$2"
	local domain="$3"
	local domain_owner="$4"
	local region="$5"
	#echo "login --tool $tool --repository $repository --domain $domain --domain-owner $domain_owner --region $region "
	aws codeartifact login --tool $tool --repository $repository --domain $domain --domain-owner $domain_owner --region $region
}

############################################################
# Help                                                     #
############################################################
Help() {
	# Display Help
	echo "Add description of the script functions here."
	echo
	echo "Syntax: scriptTemplate [-g|h|v|V]"
	echo "options:"
	echo "g     Print the GPL license notification."
	echo "h     Print this Help."
	echo "v     Verbose mode."
	echo "V     Print software version and exit."
	echo
}

Main() {
	if [ -z "$1" ]; then
		echo "Error: Missing argument: tool"
		exit 1
	fi
	if [ "$1" = "h" ] || [ "$1" = "help" ]; then
		Help
		exit
	fi
	# echo "$1"
	# echo "$2"
	# echo "$3"
	# echo "$4"
	# echo "$5"

	Login "$@"
}

Main "$1" "$AWS_CODE_ARTIFACT_REPOSITORY" "$AWS_CODE_ARTIFACT_DOMAIN" "$AWS_CODE_ARTIFACT_DOMAIN_OWNER" "$AWS_DEFAULT_REGION"
