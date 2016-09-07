##Homework 1-3. Determine the average file size of the use specified directory, then display only the files that are bigger than average.##

#!/bin/sh

function average(){
	#sums the file sizes
	for i in `ls -l | grep -o 'dan dan * [0-9]*' | grep -o '[0-9]*'` 
	do
			size=$((size + i))
	done
	
	#counts the number of files
	for i in `ls`
	do
		((count++))
	done

	#calculates average
	average=$((size/count))

	echo "Average is: $average bytes" #prints the average
}

function filter(){
	#creates array with file/dir names
	for i in `ls`
	do
		list=("${list[@]}" "$i")
	done	

	#prints the corresponding array element if the file size if greater than average
	count=0
	for i in `ls -l | grep -o 'dan dan * [0-9]*' | grep -o '[0-9]*'`
	do
			if [ $i -gt $average ]; then
				echo "${list[$count]} $i"
			fi
	((count++))
	done
}

function main(){
	cd $1 #navigates to specified directory

	average	#calls average function
	filter #calls filter function
}

main $1
