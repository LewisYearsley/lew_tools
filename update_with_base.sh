#!/bin/bash

base_branch=$1
current_branch=$(git branch | grep \*)
clean_branch=${current_branch/[*\s\n]}

if [ "$clean_branch" == "$base_branch" ] || [ -z "$base_branch" ]
then
    echo "Pulling latest $clean_branch"
    git pull --rebase
else
    echo "Updating $clean_branch with $base_branch"    

    git checkout develop
    git pull --rebase
    git checkout $clean_branch
    git merge develop
fi