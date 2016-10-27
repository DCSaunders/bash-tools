#!/bin/bash

usage()
{
   echo "usage: clean [[[-u user] [-r repo]] | [-h]]"
}

if [ "$#" -ne 4 ]; then
    usage
    exit 1
fi    
   
while [ "$1" != "" ]; do
    case $1 in
	-u | --user )   shift
			user=$1
			;;
	-r | --repo )   shift
	                repo=$1
			;;
	-h | --help )   usage
			exit
			;;
	* )             usage
			exit 1
    esac
    shift
done

if [ -d "$repo" ]; then 
    if [ ! -d "$repo-temp" ]; then
	mkdir "$repo-temp"
	for i in $(find $repo -not -path '*/.git/*'); do
	    if [ ! -d "$i" ]; then 
	       mv $i "$repo-temp"
	    fi 
	done
	rm -rf $repo
	git clone "https://github.com/$user/$repo"
	for i in $(find "$repo-temp"); do
	    if [ ! -d "$i" ]; then 
	       mv $i $repo
	    fi 
	done
	rm -rf "$repo-temp"
    else
	echo "Error: existing dir $repo-temp. Move to avoid overwrite."
	exit
    fi
else
    echo "Directory $repo not found"
    exit
fi
   
