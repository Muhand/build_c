# build_c++
A simple bash script which builds C++ applications using G++ compiler from a src into a bin folder

## Usage
This is a bash script which is meant to compile simple C++ applications into binary. This script will look at the source folder and produce a bin folder with an output binary file.

Using this script is as simple as including this file in the root of your directory then open the terminal and navigate to the root directory and execute the following command

`./build.sh`

This script can take 5 arguments as follows

| Argument        | Description                         												  | Optional? |
| --------------- |:-------------------------------------------------------------------------------------:| ---------:|
| -s        	  | The source directory, the directory which includes the source code of the application |     NO    |
| -b              | If you prefer a different location for your binar(y/ies)                              |     YES   |
| -i              | The entry point for your application                                                  |     NO    |
| -o              | The output binary name                                                                |     NO    |
| -y              | If this flag is set then all questions will be defaulted to yes                       |     NO    |

## Example

**This is a sample folder structure**

`root directory |
               | build.sh
               | src |
               		 | main.cpp`

The sample terminal call

`./build.sh -s ./src -b bin -i main -o output -y`

**The output directory structure**

root directory | <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| build.sh <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| bin | <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| output <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| src | <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| main.cpp <br/>
