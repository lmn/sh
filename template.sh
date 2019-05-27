#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2016,SC1117,SC2155
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions are
#  met:
#
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following disclaimer
#    in the documentation and/or other materials provided with the
#    distribution.
#  * Neither the name of the  nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
#  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
#  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
#  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
#  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
#  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
#  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
#  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
#  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# Author Leonardo Baldelli < leo.baldelli@outlook.com>

# --------------------------------------------------------------------------- #
# About 
# --------------------------------------------------------------------------- #

__SCRIPT__="template"
__VERSION__="0.0.1"

# --------------------------------------------------------------------------- #
# Commands 
# --------------------------------------------------------------------------- #

CUT=$(which cut)
CURL=$(which curl 2>/dev/null)
PYTHON=$(which python 2>/dev/null)
TAIL=$(which tail)
PING=$(which ping)
CHMOD=$(which chmod)
CHOWN=$(which chown)
AK=$(which awk)
CAT=$(which cat)
CP=$(which cp)
EE=$(which echo)
PERL=$(which perl 2>/dev/null)
RM=$(which rm)
MK=$(which mkdir)
TAR=$(which tar)
TEE=$(which tee)
DT=$(which date)
DF=$(which df)
MOUNT=$(which mount)
GREP=$(which grep)
DTE=$($DT +%Y-%m-%d)
UNAME=$(which uname)
NTPDATE=$(which ntpdate 2>/dev/null)
PLATFORM=$($UNAME)
OPENSSL=$(which openssl 2>/dev/null)
TOUCH=$(which touch)

# --------------------------------------------------------------------------- #
# Code Errors Messages
# --------------------------------------------------------------------------- #

ERROR[1]="ERROR XXX: <Description>"
ERROR[2]="ERROR XXX: <Description>"
ERROR[3]="ERROR XXX: <Description>"
ERROR[4]="ERROR XXX: <Description>"
ERROR[5]="ERROR XXX: <Description>"
ERROR[6]="ERROR XXX: <Description>"
ERROR[7]="ERROR XXX: <Description>"
ERROR[8]="ERROR XXX: <Description>"
ERROR[9]="ERROR XXX: <Description>"

# --------------------------------------------------------------------------- #
# Setup Workspace
# --------------------------------------------------------------------------- #

_WORSPACE_(){
	$MK -p /tmp/$__SCRIPT__

	export WORKSPACE="/tmp/${__SCRIPT__}"
}

# --------------------------------------------------------------------------- #
# Log Messages
# --------------------------------------------------------------------------- #

_LOG_(){
	LEVEL="${1}"
	MSG="${2}"

	$EE -e "${DTE}\t${LEVEL}\t${MSG}" | \
	$TEE -a $WORKSPACE/$__SCRIPT__.$LEVEL.log
}

# Info Messages

_INFO_() {
	MSG="${1}"
	_LOG_ "INFO" "${MSG}"
}

# Error Messages

_ERROR_() {
	MSG="${1}"
	_LOG_ "ERROR" "${MSG}"
}

# Warning Messages

_WARNING_() {
	MSG="${1}"
	_LOG_ "WARNING" "${MSG}"
}

# --------------------------------------------------------------------------- #
# Replace Exit 
# --------------------------------------------------------------------------- #

_DIE_() {

	CODE="${1}"

	if [ -z "${CODE}" ]; then
		CODE=1
	fi

	$EE "${ERROR[$CODE]}"

	# Return
	exit "${CODE}"
}


# --------------------------------------------------------------------------- #
# Main
# --------------------------------------------------------------------------- #

_MAIN_() {
	
	# Prepare Workspace
	_WORSPACE_ 
	
	# Message
	_INFO_	"Starting Cool Awesome Script"

	# Exit with Message
	_DIE_ 5
}

# --------------------------------------------------------------------------- #
# Execute
# --------------------------------------------------------------------------- #

_MAIN_

# --------------------------------------------------------------------------- #
# End
# --------------------------------------------------------------------------- #

# EOF
