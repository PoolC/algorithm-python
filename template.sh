#!/bin/bash

PROBLEM_NAME=`echo "$1" | tr [:lower:] [:upper:]`
SAVE_PATH=./problems/
SCRIPT_PATH=_script
PROBLEM_PATH=${SAVE_PATH}/`echo "${PROBLEM_NAME}" | tr [:upper:] [:lower:]`
TMP_PROBLEM_FILE=${PROBLEM_PATH}/.tmp

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
wget $URL -q -O ${TMP_PROBLEM_FILE}
perl -pi -e 's/[ ]*$//' ${TMP_PROBLEM_FILE}
perl -pi -e 's/\r//' ${TMP_PROBLEM_FILE}
HTML_CONTENT=$(cat ${TMP_PROBLEM_FILE})

# parse 
PROBLEM_STATEMENT=${HTML_CONTENT#*problem_statement}
PROBLEM_STATEMENT=${PROBLEM_STATEMENT%%problem_sample_input*}
PROBLEM_STATEMENT=${PROBLEM_STATEMENT%section>*}
echo "<section class=\"problem_statement" > ${PROBLEM_PATH}/problem.html
echo "${PROBLEM_STATEMENT}" >> ${PROBLEM_PATH}/problem.html
echo "section>" >> ${PROBLEM_PATH}/problem.html
#perl -pi -e 's/^\n//' ${PROBLEM_PATH}/problem.html

INPUT=${HTML_CONTENT#*problem_sample_input*<pre>}
INPUT=${INPUT%%</pre>*}
echo "${INPUT}" > ${PROBLEM_PATH}/input.dat
perl -pi -e 's/^\n//' ${PROBLEM_PATH}/input.dat

OUTPUT=${HTML_CONTENT#*problem_sample_output*<pre>}
OUTPUT=${OUTPUT%%</pre>*}
echo "${OUTPUT}" > ${PROBLEM_PATH}/answer.dat
perl -pi -e 's/^\n//' ${PROBLEM_PATH}/answer.dat

# FIXME to find relative path ../../_script
ln -s ../../${SCRIPT_PATH}/run.sh ${PROBLEM_PATH}/run.sh
cp ${SCRIPT_PATH}/solution.py ${PROBLEM_PATH}
mv $TMP_PROBLEM_FILE ${PROBLEM_PATH}/${PROBLEM_NAME}.html

