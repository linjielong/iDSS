#!/bin/bash
# Copyright(c) 2016-2100.  root.  All rights reserved.
#
#   FileName:     jll.maker.sh
#   Author:       root
#   Email:        493164984@qq.com
#   DateTime:     2017-06-21 00:09:54
#   ModifiedTime: 2017-06-21 01:14:52

JLLPATH="$(which $0)"
JLLPATH="$(dirname ${JLLPATH})"
source ${JLLPATH}/.BashShellLibrary

declare -i GvPageUnit=10
declare -a GvPageMenuUtilsContent=(
  "build_pipeline: compile perl -- compile dss -- install dss"
  "clean_pipeline: uninstall dss -- clean dss -- clean perl"
)
echo
Lfn_PageMenuUtils _MenuID  "Select" 7 4 \
                            "***** Menu For Darwin Streaming Server  (q: quit) *****"
if [ x"${_MenuID}" = x"${GvPageMenuUtilsContent[0]}" ]; then
    [ x"${_MenuID}" != x ] && unset _MenuID
    [ x"${GvPageMenuUtilsContent}" != x ] && unset GvPageMenuUtilsContent
    [ x"${GvPageUnit}" != x ] && unset GvPageUnit
more >&1<<EOF
${Bseablue}${Fblack}compile perl${AC}
EOF
    
    exit 0
fi
if [ x"${_MenuID}" = x"${GvPageMenuUtilsContent[1]}" ]; then
    [ x"${_MenuID}" != x ] && unset _MenuID
    [ x"${GvPageMenuUtilsContent}" != x ] && unset GvPageMenuUtilsContent
    [ x"${GvPageUnit}" != x ] && unset GvPageUnit
    exit 0
fi

