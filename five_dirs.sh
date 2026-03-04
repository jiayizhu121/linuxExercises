#!/bin/bash
rm -rf five
mkdir -p five

for d in {1..5}; do
  mkdir -p "five/dir$d"
  for f in {1..4}; do
    yes "$f" | head -n "$f" > "five/dir$d/file$f"
  done
done
