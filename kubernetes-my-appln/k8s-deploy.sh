#!/usr/bin/env bash
################################################################################
# Include environment variables and common functions,
# Source it AFTER the definition of the printUsage function
################################################################################
THIS_SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

IAC_ROOT_PATH=${THIS_SCRIPT_PATH}/..

function printUsage {
  cat << EOF
Usage: ${0##*/} <inventory host name> <user>
EOF
}

if [[ ${#@} == 0 ]] || [[ ${#@} -gt 2 ]]; then
    printUsage
    exit 1;
fi

if [[ -z "${1}" ]]; then
  echo "ERROR: Enter the inventory host"
  printUsage
  exit 1
fi

if [[ -z "${2}" ]]; then
  echo "ERROR: Enter the user"
  printUsage
  exit 1
fi

HOST=$1
user=$2

# append date to log file
#curdate=$(date)
#curdate=$(date +%Y-%m-%d' '%H:%M:%S,%3N)
#curdate=$(date +"%F_%T")

#src_dir="/var/lib/jenkins/"
src_dir="/var/jenkins_home/"
dest_dir="/opt"

if [ -d "$src_dir" ]; then
    echo "create destination directory ${dest_dir}/kubernetes_Deloy"
    ssh $user@$HOST "mkdir -p $dest_dir/kubernetes_Deloy; chmod 777 $dest_dir/kubernetes_Deloy"
    echo "k8s files"
    # rsync -avzr  -e "ssh -i /home/$user/.ssh/id_rsa" --rsync-path="sudo rsync" *.yml $user@$HOST:$dest_dir/kubernetes_Deloy 
    scp /var/jenkins_home/workspace/curd-k8s-deploy/kubernetes-my-appln/*.yml $user@$HOST:$dest_dir/kubernetes_Deloy;
else
  echo "Error: files not found. Can not continue."
  exit 1
fi

