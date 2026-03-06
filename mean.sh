#!/bin/bash

if [ $# -lt 1 ] || [ $# -gt 2 ]
then
    echo "usage: ./mean.sh <column> [file.csv]" >&2
    exit 1
fi

column=$1

if [ $# -eq 2 ]
then
    file=$2
else
    file=/dev/stdin
fi

cut -d, -f"$column" "$file" | tail -n +2 | {
    sum=0
    count=0
    while read x
    do
        sum=$((sum + x))
        count=$((count + 1))
    done
    echo $((sum / count))
}
