#!/bin/bash

if [ "$HOST" == "castor.ittc.ku.edu" ]; then
	REMOTE=pollux
else
	REMOTE=castor
fi

ssh ${USER}@${REMOTE} bash ${PWD}/run.sh 
