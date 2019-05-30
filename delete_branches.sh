#!/bin/bash
pattern=$1

if [ -z "$1" ]
then
    echo "The pattern parameter is missing"
    exit 0
fi

matched_branches=$(git branch | grep $pattern)

if [ -z "$matched_branches" ]
then
    echo "No branches found matching that pattern"
    exit 0
fi

printf '\nDeleting...\n\n'

printf '%s\n' $matched_branches

printf "\ncontinue? (y/n): "

read should_continue

while [ "$should_continue" != "y" ] && [ "$should_continue" != "n" ]
do
    printf "Answer (y)es or (n)o: "
    read should_continue
done

if [ "$should_continue" == "n" ]
then
    exit 0
fi

git branch -D $matched_branches