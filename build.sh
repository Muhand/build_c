#!/bin/bash

while getopts s:b:i:o:y option
	do
		case "${option}"
			in
			s) SOURCE=${OPTARG};;
			b) BINARY=${OPTARG};;
			y) YES=true;;
			i) INDEX=${OPTARG};;
			o) OUTPUT=${OPTARG};;
		esac
done

#Was the source argument seT?
if [ "$SOURCE" = "" ];
	then
		#If no then print out an error message and exist the script
		echo "You need to specify where is the source directory";
		exit 1;
	else
		#OTHERWISE; CHECK IF SOURCE DIRECTORY DOESNT EXIST
		if [ ! -d "$SOURCE" ];
			then
				# If it doesn't then notify and exist the script
				echo "This source directory doesn't exist";
				exit 1;
		fi
fi

#Was the index file defined?
if [ "$INDEX" = "" ]
	then
		echo "Warnning. You didn't specify which one is your index file; therefore, index.cpp will be set by default as the main entry point"
		INDEX="index.cpp"
	else
		#If the index was set then check if the .cpp was added to it or no, if not then add it
		if [ ${INDEX: -4} != ".cpp" ]
			then
				#If it doesn't have .cpp then add it
				INDEX="$INDEX.cpp"
		fi

		#look for that file and check if it exists
		if [ ! -f "$SOURCE/$INDEX" ];
			then
    			echo "Index file was not found!"
    			exit 1;
		fi
fi

#Check if binary argument was set?
if [ "$BINARY" = "" ];
	then
		#If no then set a default one
		BINARY='./bin'

		#Check if this directory exists
		if [ -d "$BINARY" ];
			then
				# If the directory exists then print out a message and exit out of the script
				echo "Can't create a binary folder by default because you already have a folder called in the root directory 'bin', Please set a binary argument and type a different directory name.";
				echo "Or say yes to the next question."
				echo "Would you like to override that directory? (y for yes)"

				if [ "$YES" = true ];
					then
						echo "Your answer? Y"
						answer="Y"
					else
						echo "Your answer? ";
						read answer;
				fi

				if [ "$answer" != "Y" ] && [ "$answer" != "y" ];
					then
						exit 1;
				fi
			else
				#Otherwise just create the directory
				mkdir "$BINARY"
		fi
	else
		#If it exists then check if the directory exists
		if [ ! -d "$BINARY" ];
			then
				# If it doesn't then notify and exist the script
				echo "This binary directory doesn't exist";
				exit 1;
		fi
fi

#Everything went okay lets start the building process
echo "Compiling into $BINARY/$OUTPUT..."
g++ "$SOURCE/$INDEX" -o "$BINARY/$OUTPUT"
echo "Build is complete"