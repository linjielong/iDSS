#!/bin/bash
# Copyright(c) 2016-2100.  root.  All rights reserved.
#
#   FileName:     jll.maker.sh
#   Author:       root
#   Email:        493164984@qq.com
#   DateTime:     2017-06-21 00:09:54
#   ModifiedTime: 2017-06-21 11:27:20

JLLPATH="$(which $0)"
JLLPATH="$(dirname ${JLLPATH})"
source ${JLLPATH}/.BashShellLibrary

declare -i GvPageUnit=10
declare -a GvPageMenuUtilsContent=(
  "build_pipeline: ...perl...dss..."
  "clean_pipeline: ...dss...perl..."
)

function _FN_exit()
{
    [ x"${GvPageUnit}" != x ] && unset GvPageUnit
    [ x"${GvPageMenuUtilsContent}" != x ] && unset GvPageMenuUtilsContent
    echo
    exit 0
}

_DT_=$(date +%Y_%m_%d__%H_%M_%S)
_JLLCFG_SRC_PERL="$(pwd)/perl-5.8.9"
_JLLCFG_BIN_PERL="/usr/local/DarwinStreamingServer/perl-5.8.9/bin/perl"
function _FN_build_perl()
{
more >&1<<EOF

${Bseablue}${Fblack}==================================================${AC}
${Bseablue}${Fblack} ...${Fred}perl${Fblack}...dss...                                 ${AC}
${Bseablue}${Fblack}==================================================${AC}

EOF
    # Check if perl is installed or not
    if [ ! -e "${_JLLCFG_BIN_PERL}" ]; then
        if [ ! -e "${_JLLCFG_SRC_PERL}" ]; then
            echo -e "${Bred}${Fyellow}JLL-Exit:${AC} not found" \
                    "${Bred}${Fwhite}${_JLLCFG_SRC_PERL}${AC}"
            _FN_exit 
        fi
        cd ${_JLLCFG_SRC_PERL}
        [ x"$(ls | grep -Ei 'makefile ')" != x ] && make clean
        [ x"$(ls | grep -Ei 'make_perl_at_.*\.log')" != x ] && rm -rf make_perl_at_*.log
        ./Configure -des -Dprefix=${_JLLCFG_BIN_PERL} 2>&1 | tee make_perl_at_${_DT_}.log
        if [ x"$(ls | grep -Ei '^makefile$')" != x ]; then
            make 2>&1 | tee -a make_perl_at_${_DT_}.log
            make install 2>&1 | tee -a make_perl_at_${_DT_}.log
        else
             echo -e "${Bred}${Fyellow}JLL-Exit:${AC} ${Fred}perl${AC} is configured failure"
             cd - >/dev/null
            _FN_exit 
        fi 
        cd - >/dev/null
        if [ ! -e "${_JLLCFG_BIN_PERL}" ]; then
            echo -e "${Bred}${Fyellow}JLL-Exit:${AC} ${Fred}perl${AC} compile or install failure"
            _FN_exit
        else
            echo -e "JLL: ${Fred}perl${AC} was installed to" \
                    "${Bgreen}${Fblack}${_JLLCFG_BIN_PERL}${AC}"
        fi
    else
        echo -e "JLL: ${Fred}perl${AC} has already been installed to" \
                 "${Bgreen}${Fblack}${_JLLCFG_BIN_PERL}${AC}"
    fi
}


function _FN_build_pipeline()
{
    _FN_build_perl
}

echo
Lfn_PageMenuUtils _MenuID  "Select" 7 4 \
                            "***** Menu For Darwin Streaming Server  (q: quit) *****"
if [ x"${_MenuID}" = x"${GvPageMenuUtilsContent[0]}" ]; then
    [ x"${_MenuID}" != x ] && unset _MenuID
    [ x"${GvPageMenuUtilsContent}" != x ] && unset GvPageMenuUtilsContent
    [ x"${GvPageUnit}" != x ] && unset GvPageUnit
    _FN_build_pipeline
    exit 0
fi
if [ x"${_MenuID}" = x"${GvPageMenuUtilsContent[1]}" ]; then
    [ x"${_MenuID}" != x ] && unset _MenuID
    [ x"${GvPageMenuUtilsContent}" != x ] && unset GvPageMenuUtilsContent
    [ x"${GvPageUnit}" != x ] && unset GvPageUnit
    exit 0
fi

