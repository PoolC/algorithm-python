#!/bin/bash
RUN_SCRIPT=$1
DATA_DATA=$2
ANSWER_DATA=$3
OUTPUT_DATA=$4

echo_usage () {
	SCRIPT="$(basename "$0")"
	echo "Usage: ${SCRIPT} [solution.py] [input.dat] [answer.dat] [output.dat]"
	exit
}

if [ -z "$RUN_SCRIPT" ]; then
	RUN_SCRIPT=solution.py
fi
if [ -z "$DATA_DATA" ]; then
	DATA_DATA=input.dat
fi
if [ -z "$ANSWER_DATA" ]; then
	ANSWER_DATA=answer.dat
fi
if [ -z "$OUTPUT_DATA" ]; then
	OUTPUT_DATA=output.dat
fi


if [ ! -f "$RUN_SCRIPT" ]; then
	echo "ERROR: ${RUN_SCRIPT} is not exists"
	echo_usage
fi

if [ ! -f "$DATA_DATA" ]; then
	echo "ERROR: ${DATA_DATA} is not exists"
	echo_usage
fi

if [ ! -f "$ANSWER_DATA" ]; then
	echo "ERROR: ${ANSWER_DATA} is not exists"
	echo_usage
fi

./$RUN_SCRIPT < $DATA_DATA > $OUTPUT_DATA
echo "./$RUN_SCRIPT < $DATA_DATA > $OUTPUT_DATA"
DIFF=`diff $OUTPUT_DATA $ANSWER_DATA`

if [ -z "$DIFF" ]; then
	echo "$RUN_SCRIPT pass"
else
	cat $OUTPUT_DATA
	echo "============="
	echo $DIFF
fi
