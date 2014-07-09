#!/bin/bash

PROBLEM_NAME=`echo "$1" | tr [:lower:] [:upper:]`
SAVE_PATH=./
GITHUB_PATH=./_poolc
SCRIPT_PATH=./_script
PROBLEM_PATH=${SAVE_PATH}/`echo "${PROBLEM_NAME}" | tr [:upper:] [:lower:]`
PROBLEM_SOLUTION_FILENAME=$PROBLEM_PATH/solution.py
SUBMIT_FILENAME=doodoori2.py
COMMIT_LOG=doodoori2.py
echo_usage () {
	SCRIPT="$(basename "$0")"
	echo "Usage: ${SCRIPT} PROBLEM_NAME"
	exit
}

if [ -z "$PROBLEM_NAME" ]; then
	echo_usage
fi

if [ ! -d "$GITHUB_PATH" ]; then
	echo "ERROR: ${GITHUB_PATH} is not exists. Please checkout https://github.com/PoolC/algospot " 
	exit
fi

if [ ! -d "$GITHUB_PATH/.git" ]; then
	echo "ERROR: ${GITHUB_PATH}/.git is not exists. Please checkout https://github.com/PoolC/algospot " 
	exit
fi


if [ ! -d "$PROBLEM_PATH" ]; then
	echo "ERROR: ${PROBLEM_PATH} is not exists."
	exit
fi

if [ ! -f "$PROBLEM_SOLUTION_FILENAME" ]; then
	echo "ERROR: ${PROBLEM_SOLUTION_FILENAME} is not exists. "
	exit
fi

#1 pull
pushd $GITHUB_PATH
git pull
popd 

mkdir -p $GITHUB_PATH/$PROBLEM_NAME

cp ${PROBLEM_SOLUTION_FILENAME} $GITHUB_PATH/$PROBLEM_NAME/${SUBMIT_FILENAME}
pushd $GITHUB_PATH
git add ./$PROBLEM_NAME/${SUBMIT_FILENAME}
git status
git commit -m "${PROBLEM_NAME} ${COMMIT_LOG}"
git push
git status
popd 
