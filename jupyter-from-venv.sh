#!/bin/bash

##########################################################
# assuming you:                                          #
# 1. have jupyter lab installed on your machine          #
# 2. running this script from your Python project folder #
##########################################################

if [ "$1" == "" ]
then
echo "venv name parameter missing!"
else
# create a virtual environment (venv) using the argument passed as folder name
python3 -m venv $1

# activating the venv folder
source ./$1/bin/activate

# install ipykernel and the other packages listed in requirements.txt
pip3 install -r ./requirements.txt

# add your venv to jupter
python3 -m ipykernel install --user --name=$1

# if you see this message: Installed kernelspec my-venv in /Users/../Library/Jupyter/kernels/my-venv
# this means the installation is successful 
# and under this path, you should see kernel.json explaining the settings for your venv

# open jupyter lab
jupyter lab

# to list kernels (global python + venv(s)), run the commented command below
#jupyter kernelspec list

# to remove a kernel, run the commented command below
#jupyter kernelspec uninstall my-venv
fi