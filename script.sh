#!/bin/bash
echo "welcome message"
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "you are building version" $version
echo "do you need to change the version? 1 = yes, 0 = no"
read versioncontinue
if [ $versioncontinue -eq 1 ]
then
	for filename in source/*
    do
        if [ "$filename" == "source/secretinfo.md" ]
        then
            echo "The file is not being copied" $filename
        else 
            echo "The file is being copied" $filename
            cp $filename build/.
        fi
    done
  cd build/
  echo "Build version $version contains:"
  ls
else
	echo "Please come back when you are ready"
fi
