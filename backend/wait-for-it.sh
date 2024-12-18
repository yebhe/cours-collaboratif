#!/usr/bin/env bash
# wait-for-it.sh

# Example usage:
# ./wait-for-it.sh <host>:<port> -- <command>

TIMEOUT=15
QUIET=0
HOST=""
PORT=""
CMD=""

usage() {
  echo "Usage: $0 host:port [-t timeout] [-q] -- command"
  exit 1
}

wait_for() {
  local host=$1
  local port=$2
  local timeout=$3
  local cmd=$4

  echo "Waiting for $host:$port to be available..."

  for i in $(seq 1 $timeout); do
    nc -z $host $port && echo "$host:$port is up!" && exec $cmd
    echo "Attempt $i of $timeout..."
    sleep 1
  done

  echo "Timeout reached, $host:$port not available!"
  exit 1
}

while getopts "t:q" opt; do
  case $opt in
    t) TIMEOUT=$OPTARG ;;
    q) QUIET=1 ;;
    *) usage ;;
  esac
done

shift $((OPTIND-1))

if [[ $# -lt 1 ]]; then
  usage
fi

HOST=$(echo $1 | cut -d: -f1)
PORT=$(echo $1 | cut -d: -f2)
CMD="${@:2}"

wait_for $HOST $PORT $TIMEOUT "$CMD"
