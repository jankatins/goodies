# Automatically remove the modifactions to PATH when moving outside of this directory...
autostash PATH
# remove condas python from path, so that the makefile sees the system python
path=(${(@)path:#/home/js/.binaries/miniconda3/bin})
# try to activate the env
source ${0:a:h}/.venv/bin/activate
