#!/bin/bash

writefile=$1
writestr=$2
numofargs=$#

errorChecks() {
	#need exactly two arguments
	if [ ! $numofargs -eq 2 ]; then
		echo This script needs two arguments
		exit 1
	fi
}

printSolution() {

	if [ -e $writefile ];then
		echo $writestr > $writefile
	else 
		onlyfile=${writefile##*/}
		directorypath=${writefile%/*}
		mkdir -p $directorypath
		echo $writestr > $writefile
	fi

	#return failure if cannot create a file
	if [ ! $? -eq 0 ]; then
		echo Cannot create a file or directory 
		exit 1
	fi
}

errorChecks
printSolution
