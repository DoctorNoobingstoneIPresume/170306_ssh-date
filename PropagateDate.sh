#!/bin/bash

## [2019-11-08]
## 
##   This program:
##     - locally  runs the "date" command in order to get the current date;
##     - remotely runs the "date" command in order to set the current date (with the locally obtained value).
## 
##   Usage:
##     ./PropagateDate <remote-ssh-server-name>
##   
##   Support:
##     adder_2003 at yahoo dot com

set -e -o pipefail

function Main ()
{
	local sFormat="%Y-%m-%d %H:%M:%S"
	local sDate="$(date +"${sFormat}")"
	echo "${sDate}"
	
	local sCommand="$(echo ssh "${1:?Please specify the remote SSH server !}" "sudo date -s \"${sDate}\" +\"${sFormat}\"")"
	echo "${sCommand}"
	      ${sCommand}
}

Main "$*"
