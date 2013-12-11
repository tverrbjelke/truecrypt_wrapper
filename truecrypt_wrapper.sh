#!/usr/bin/env bash
# 
#for problem see http://www.kubuntuforums.net/showthread.php?56255-Clearing-out-quot-Recently-Used-quot-tab-in-TrueCrypt


#default xbel or manuel via argument?
if [[ "$1" == "" ]]
then
    FILE_NAME="$HOME/.local/share/recently-used.xbel"
else
    FILE_NAME="$1"
fi


function safepoint () {
    cp "$1"  "$1.bak"
    RVal=$?
    echo "$RVal"
    if [[ "$RVal" != "0" ]]
    then 
	echo "ERROR $RVal: Safepoint creation <$1> to <$1.bak> failed"
    fi
    return $RVal
}

function restore () {
    #better first fill old file with nulls. 
    #if installed you could use command "wipe"
    #wipe "$1"
    cat /dev/null > "$1" 
    RVal=$?
    if [[ "$RVal" != "0" ]]
    then
	echo "Error, wiping original file <$1> failed"
	return $rVal #stop processing
    fi

    mv -f "$1.bak"  "$1"
    RVal=$?
    if [[ "$RVal" != "0" ]]
    then
    	echo "Error, could not restore safepoint <$1>"
	echo "do manually: <mv -f $1.bak $1>"
    fi
    return $RVal
}


### main

if  safepoint "$FILE_NAME"  
then
    echo "starting truecrypt... please umount container and close truecrypt"
    echo "before you log off or shut your computer down.!"
    truecrypt && 
    #waiting until truecrypt has ended
    restore "$FILE_NAME" 
fi
