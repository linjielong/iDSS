#!/bin/bash
# Copyright(c) 2016-2100.  root.  All rights reserved.
#
#   FileName:     jll.maker.perl.sh
#   Author:       root
#   Email:        493164984@qq.com
#   DateTime:     2017-06-20 01:39:28
#   ModifiedTime: 2017-06-20 01:40:46

JLLPATH="$(which $0)"
JLLPATH="$(dirname ${JLLPATH})"
#source ${JLLPATH}/BashShellLibrary

### Color Echo Usage ###
# Lfn_Sys_ColorEcho ${CvFgRed} ${CvBgWhite} "hello"
# echo -e "hello \033[0m\033[31m\033[43mworld\033[0m"

__JLLCFG_PATH=$(pwd)
cd perl-5.8.9 
./Configure -des -Dprefix=${__JLLCFG_PATH}/localperl
make
make install
cd - >/dev/null
