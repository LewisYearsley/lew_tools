#!/bin/bash

file_name="$1"
path=${2:-"."}

if [ -z "$file_name" ]
then
    echo "Whoops! The file name parameter is missing."
    exit 0
fi

if [ -f "$path/$file_name.js" ]
then
    echo "$file_name already exists"
    exit 0
fi

echo "Creating $path/$file_name.js"

test_dir="$path/__tests__"
# test first :D
mkdir -p $test_dir
touch "$test_dir/$file_name.spec.js"
touch "$path/$file_name.js"
