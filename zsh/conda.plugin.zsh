export PATH=$HOME/anaconda/bin:$PATH

mydir=${0:a:h}

fpath+=$PWD
compinit conda

conda_root_dir() {
    # This works but its slow, just hard coded :)
    # ANACONDA=$(conda info | grep root | awk 'BEGIN { FS = " " } ; { print $4 }' | sed 's/^[ \t]*//;s/[ \t]*$//')
    ANACONDA="$HOME/.binaries/miniconda3"
}

lscondaenvs() {
    conda_root_dir
    ls $ANACONDA/envs
}

_complete_conda_envs() {
    conda_root_dir
    compadd $(ls $ANACONDA/envs)
}

rmvcondaenv() {
    conda_root_dir
    rm -rf $ANACONDA/envs/$1
}
compdef _complete_conda_envs rmvcondaenv

cdcondaenv() {
    conda_root_dir
    cd $ANACONDA/envs/$1
}
compdef _complete_conda_envs cdcondaenv

conda_workon() {
    conda_root_dir
    source $ANACONDA/bin/activate $1
}
compdef _complete_conda_envs conda_workon

conda_workoff() {
    conda_root_dir
    source $ANACONDA/bin/deactivate
}
