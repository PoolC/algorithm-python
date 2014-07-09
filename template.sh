#!/bin/bash

PROBLEM_NAME=`echo "$1" | tr [:lower:] [:upper:]`
SAVE_PATH=./
SCRIPT_PATH=./_script
PROBLEM_PATH=${SAVE_PATH}/`echo "${PROBLEM_NAME}" | tr [:upper:] [:lower:]`

echo_usage () {
	SCRIPT="$(basename "$0")"
	echo "Usage: ${SCRIPT} PROBLEM_NAME"
	exit
}

if [ -z "$PROBLEM_NAME" ]; then
	echo_usage
fi

if [ -f "$PROBLEM_NAME" ]; then
	echo "ERROR: ${PROBLEM_NAME} is exists. please remove it"
	exit
fi

if [ -d "$PROBLEM_PATH" ]; then
	echo "ERROR: ${PROBLEM_PATH} is exists. please remove it"
	exit
fi
mkdir -p $PROBLEM_PATH

URL=http://algospot.com/judge/problem/read/${PROBLEM_NAME}
wget $URL -q
perl -pi -e 's/[ ]*$//' ${PROBLEM_NAME}
perl -pi -e 's/\r//' ${PROBLEM_NAME}
HTML_CONTENT=$(cat ${PROBLEM_NAME})

# parse 
INPUT=${HTML_CONTENT#*problem_sample_input*<pre>}
INPUT=${INPUT%%</pre>*}
echo "${INPUT}" > ${PROBLEM_PATH}/input.dat
perl -pi -e 's/^\n//' ${PROBLEM_PATH}/input.dat

OUTPUT=${HTML_CONTENT#*problem_sample_output*<pre>}
OUTPUT=${OUTPUT%%</pre>*}
echo "${OUTPUT}" > ${PROBLEM_PATH}/answer.dat
perl -pi -e 's/^\n//' ${PROBLEM_PATH}/answer.dat

#ln -s ${SCRIPT_PATH}/run.sh ${PROBLEM_PATH}
cp ${SCRIPT_PATH}/run.sh ${PROBLEM_PATH}
cp ${SCRIPT_PATH}/solution.py ${PROBLEM_PATH}

rm -f $PROBLEM_NAME
