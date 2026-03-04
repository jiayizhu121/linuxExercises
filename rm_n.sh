#!/bin/bash
if [ "$#" -ne 2 ]; then
  echo "usage: $0 <dir> <n>" 1>&2
  exit 1
fi

dir="$1"
n="$2"

if [ ! -d "$dir" ]; then
  echo "usage: $0 <dir> <n>" 1>&2
  exit 1
fi

# n must be a nonnegative integer
if ! [[ "$n" =~ ^[0-9]+$ ]]; then
  echo "usage: $0 <dir> <n>" 1>&2
  exit 1
fi

# Remove regular files larger than n bytes
find "$dir" -type f -size +"${n}"c -exec rm -f {} \;
