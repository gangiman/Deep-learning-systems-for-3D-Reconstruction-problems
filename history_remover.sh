#! /bin/bash
# from this thread https://stackoverflow.com/a/29043295
git filter-branch --parent-filter '
    read parent
    if [ "$parent" = "-p 4bdecd527257b0fbec4547e763e55cca1983e9fc" ]
    then
        echo
    else
        echo "$parent"
    fi'
git update-ref -d refs/original/refs/heads/master
git reflog expire --expire-unreachable=all --all
git gc --prune=all