#!/bin/bash

while getopts ":k:d:c:" opt; do
  case $opt in
    k)
        foldername=$OPTARG
        ;;
    d)
        filename=$OPTARG
        ;;
    c)
        character=$OPTARG
        ;;
    \?)
        echo "Invalid option: -$OPTARG" >&2
        exit 1
        ;;
    :)
    
        echo "-$OPTARG requires arguments." >&2
        exit 1
        ;;
    esac
done

if [ -z "$foldername" ]; then
klasorismi="."
fi

if [ -n "$filename" ]; then
    
    if [ -n "$character" ]; then
        tr -cs '[:alnum:]_' '[\n*]' <$foldername/$filename | grep "^$character"
        exit 1
    else 
        echo "Character is required."
    fi

else
    echo "File name is required."
    exit 1
fi