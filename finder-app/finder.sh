#!/bin/bash

filesdir=$1
searchstr=$2
numofargs=$#

errorChecks() {
	
	#need exactly two arguments	
	if [ ! $numofargs -eq 2 ]; then
		echo This script needs two arguments
		exit 1
	fi

	if [ ! -d $filesdir ]; then
		echo First argument must be a valid path or directory
		exit 1	
	fi
}

printSolution() {
 
      matchlines=$(grep -wrc --no-ignore-case $searchstr $filesdir | sed "s/^.*://" | awk '{ sum +=$1 } END { print sum }')
      
      numoffiles=$(grep -wrl --no-ignore-case $searchstr $filesdir | wc -l)
      
      echo -e "The number of files are $numoffiles and the number of matching lines are $matchlines"
}

errorChecks
printSolution
