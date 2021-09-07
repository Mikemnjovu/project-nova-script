#!/usr/bin/env bash
# author: mikemnjovu@gmail.com
# For 
# set -x 

#source lib/bash_utility.sh
#source lib/src/os.sh


passedCommand=$1

	# if [[ "$3" == "common" || "$3" == "dev" || "$3" == 'dev-setup' ]]
	# then 
	packages=$2
    # else
    # clear
    #     echo "No Package"
	# fi


packagemanager=$3


# This is for debuging 
# echo "This is the command passed $passedCommand"
# echo  "This is the package $packages"
# echo  "This is the package manager $packagemanager"


if [ "$passedCommand" == "configure-system"  ]
    then
   ( 	cd  src/sys-configs/ || exit 
       bash ./aliases.sh
       bash ./mkdir.sh
       bash ./badhosts.sh
     
    )
    pwd
    echo "$passedCommand"
elif [ "$passedCommand" == "set-ttl"  ]
    then
 (   echo "set-ttl reached"
    cd scripts || exit 
    bash ./change-ttl.sh)
   

elif [ "$passedCommand" == "install-apps"  ]
    then
    echo "Installing apps"
 (   cd src/utils/ || exit
    
    if [ "$packages" = "common"  ]
    then
    echo "common"
   	 bash ./installation-script.sh  "$packages" "$packagemanager"  
    elif [ "$packages" = "dev" ]
    then
    echo "FlatPaks"
    (
        # cd src/utils/ || exit
        bash ./install-flatpaks.sh
    )
    else  
      echo "Test PKG $packages"
   	#  bash ./installation-script.sh  "$packagemanager"
    fi)
    


else 
    echo "No comannd passed"
    echo "./nova-script configure-system"
fi
