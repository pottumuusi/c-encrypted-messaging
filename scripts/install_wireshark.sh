#!/bin/bash

main() {
	echo "Updating package index files."
	sudo apt-get update

	echo "Checking for upgradable packages."
	if ! sudo apt-get --dry-run upgrade | grep -q "^0 upgraded" ; then
		echo -e "\nPlease upgrade packages before installing a new package.\n"
		exit 1
	fi

	sudo apt install wireshark
}

main "${@}"
