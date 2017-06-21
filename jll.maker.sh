#!/bin/bash
# Copyright(c) 2016-2100.  root.  All rights reserved.
#
#   FileName:     jll.maker.sh
#   Author:       root
#   Email:        493164984@qq.com
#   DateTime:     2017-06-21 00:09:54
#   ModifiedTime: 2017-06-21 18:38:58

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
declare -a _Perl_lstTarget=(
    DynaLoader.o
    Makefile
    Policy.sh
    av.o
    cflags
    config.h
    config.sh
    .config
    deb.o
    doio.o
    doop.o
    dump.o
    ext.libs
    ext/B/B.c
    ext/B/B.o
    ext/B/C/C.c
    ext/B/C/C.o
    ext/B/C/Makefile
    ext/B/C/pm_to_blib
    ext/B/Makefile
    ext/B/blib/
    ext/B/defsubs.h
    ext/B/pm_to_blib
    ext/ByteLoader/ByteLoader.c
    ext/ByteLoader/ByteLoader.o
    ext/ByteLoader/Makefile
    ext/ByteLoader/blib/
    ext/ByteLoader/byterun.o
    ext/ByteLoader/pm_to_blib
    ext/Cwd/Cwd.c
    ext/Cwd/Cwd.o
    ext/Cwd/Makefile
    ext/Cwd/blib/
    ext/Cwd/pm_to_blib
    ext/Data/Dumper/Dumper.c
    ext/Data/Dumper/Dumper.o
    ext/Data/Dumper/Makefile
    ext/Data/Dumper/blib/
    ext/Data/Dumper/pm_to_blib
    ext/Devel/DProf/DProf.c
    ext/Devel/DProf/DProf.o
    ext/Devel/DProf/Makefile
    ext/Devel/DProf/blib/
    ext/Devel/DProf/pm_to_blib
    ext/Devel/PPPort/Makefile
    ext/Devel/PPPort/PPPort.pm
    ext/Devel/PPPort/RealPPPort.c
    ext/Devel/PPPort/RealPPPort.o
    ext/Devel/PPPort/RealPPPort.xs
    ext/Devel/PPPort/blib/
    ext/Devel/PPPort/module2.o
    ext/Devel/PPPort/module3.o
    ext/Devel/PPPort/pm_to_blib
    ext/Devel/PPPort/ppport.h
    ext/Devel/Peek/Makefile
    ext/Devel/Peek/Peek.c
    ext/Devel/Peek/Peek.o
    ext/Devel/Peek/blib/
    ext/Devel/Peek/pm_to_blib
    ext/Digest/MD5/MD5.c
    ext/Digest/MD5/MD5.o
    ext/Digest/MD5/Makefile
    ext/Digest/MD5/blib/
    ext/Digest/MD5/pm_to_blib
    ext/DynaLoader/DynaLoader.c
    ext/DynaLoader/DynaLoader.o
    ext/DynaLoader/DynaLoader.pm
    ext/DynaLoader/DynaLoader.xs
    ext/DynaLoader/Makefile
    ext/DynaLoader/XSLoader.pm
    ext/DynaLoader/blib/
    ext/DynaLoader/pm_to_blib
    ext/Encode/Byte/Byte.c
    ext/Encode/Byte/Byte.o
    ext/Encode/Byte/Byte.xs
    ext/Encode/Byte/Makefile
    ext/Encode/Byte/byte_t.c
    ext/Encode/Byte/byte_t.exh
    ext/Encode/Byte/byte_t.fnm
    ext/Encode/Byte/byte_t.h
    ext/Encode/Byte/byte_t.o
    ext/Encode/Byte/pm_to_blib
    ext/Encode/CN/CN.c
    ext/Encode/CN/CN.o
    ext/Encode/CN/CN.xs
    ext/Encode/CN/Makefile
    ext/Encode/CN/cp_00_t.c
    ext/Encode/CN/cp_00_t.exh
    ext/Encode/CN/cp_00_t.fnm
    ext/Encode/CN/cp_00_t.h
    ext/Encode/CN/cp_00_t.o
    ext/Encode/CN/eu_01_t.c
    ext/Encode/CN/eu_01_t.exh
    ext/Encode/CN/eu_01_t.fnm
    ext/Encode/CN/eu_01_t.h
    ext/Encode/CN/eu_01_t.o
    ext/Encode/CN/gb_02_t.c
    ext/Encode/CN/gb_02_t.exh
    ext/Encode/CN/gb_02_t.fnm
    ext/Encode/CN/gb_02_t.h
    ext/Encode/CN/gb_02_t.o
    ext/Encode/CN/gb_03_t.c
    ext/Encode/CN/gb_03_t.exh
    ext/Encode/CN/gb_03_t.fnm
    ext/Encode/CN/gb_03_t.h
    ext/Encode/CN/gb_03_t.o
    ext/Encode/CN/ir_04_t.c
    ext/Encode/CN/ir_04_t.exh
    ext/Encode/CN/ir_04_t.fnm
    ext/Encode/CN/ir_04_t.h
    ext/Encode/CN/ir_04_t.o
    ext/Encode/CN/ma_05_t.c
    ext/Encode/CN/ma_05_t.exh
    ext/Encode/CN/ma_05_t.fnm
    ext/Encode/CN/ma_05_t.h
    ext/Encode/CN/ma_05_t.o
    ext/Encode/CN/pm_to_blib
    ext/Encode/EBCDIC/EBCDIC.c
    ext/Encode/EBCDIC/EBCDIC.o
    ext/Encode/EBCDIC/EBCDIC.xs
    ext/Encode/EBCDIC/Makefile
    ext/Encode/EBCDIC/ebcdic_t.c
    ext/Encode/EBCDIC/ebcdic_t.exh
    ext/Encode/EBCDIC/ebcdic_t.fnm
    ext/Encode/EBCDIC/ebcdic_t.h
    ext/Encode/EBCDIC/ebcdic_t.o
    ext/Encode/EBCDIC/pm_to_blib
    ext/Encode/Encode.c
    ext/Encode/Encode.o
    ext/Encode/JP/JP.c
    ext/Encode/JP/JP.o
    ext/Encode/JP/JP.xs
    ext/Encode/JP/Makefile
    ext/Encode/JP/cp_00_t.c
    ext/Encode/JP/cp_00_t.exh
    ext/Encode/JP/cp_00_t.fnm
    ext/Encode/JP/cp_00_t.h
    ext/Encode/JP/cp_00_t.o
    ext/Encode/JP/eu_01_t.c
    ext/Encode/JP/eu_01_t.exh
    ext/Encode/JP/eu_01_t.fnm
    ext/Encode/JP/eu_01_t.h
    ext/Encode/JP/eu_01_t.o
    ext/Encode/JP/ji_02_t.c
    ext/Encode/JP/ji_02_t.exh
    ext/Encode/JP/ji_02_t.fnm
    ext/Encode/JP/ji_02_t.h
    ext/Encode/JP/ji_02_t.o
    ext/Encode/JP/ji_03_t.c
    ext/Encode/JP/ji_03_t.exh
    ext/Encode/JP/ji_03_t.fnm
    ext/Encode/JP/ji_03_t.h
    ext/Encode/JP/ji_03_t.o
    ext/Encode/JP/ji_04_t.c
    ext/Encode/JP/ji_04_t.exh
    ext/Encode/JP/ji_04_t.fnm
    ext/Encode/JP/ji_04_t.h
    ext/Encode/JP/ji_04_t.o
    ext/Encode/JP/ma_05_t.c
    ext/Encode/JP/ma_05_t.exh
    ext/Encode/JP/ma_05_t.fnm
    ext/Encode/JP/ma_05_t.h
    ext/Encode/JP/ma_05_t.o
    ext/Encode/JP/pm_to_blib
    ext/Encode/JP/sh_06_t.c
    ext/Encode/JP/sh_06_t.exh
    ext/Encode/JP/sh_06_t.fnm
    ext/Encode/JP/sh_06_t.h
    ext/Encode/JP/sh_06_t.o
    ext/Encode/KR/KR.c
    ext/Encode/KR/KR.o
    ext/Encode/KR/KR.xs
    ext/Encode/KR/Makefile
    ext/Encode/KR/cp_00_t.c
    ext/Encode/KR/cp_00_t.exh
    ext/Encode/KR/cp_00_t.fnm
    ext/Encode/KR/cp_00_t.h
    ext/Encode/KR/cp_00_t.o
    ext/Encode/KR/eu_01_t.c
    ext/Encode/KR/eu_01_t.exh
    ext/Encode/KR/eu_01_t.fnm
    ext/Encode/KR/eu_01_t.h
    ext/Encode/KR/eu_01_t.o
    ext/Encode/KR/jo_02_t.c
    ext/Encode/KR/jo_02_t.exh
    ext/Encode/KR/jo_02_t.fnm
    ext/Encode/KR/jo_02_t.h
    ext/Encode/KR/jo_02_t.o
    ext/Encode/KR/ks_03_t.c
    ext/Encode/KR/ks_03_t.exh
    ext/Encode/KR/ks_03_t.fnm
    ext/Encode/KR/ks_03_t.h
    ext/Encode/KR/ks_03_t.o
    ext/Encode/KR/ma_04_t.c
    ext/Encode/KR/ma_04_t.exh
    ext/Encode/KR/ma_04_t.fnm
    ext/Encode/KR/ma_04_t.h
    ext/Encode/KR/ma_04_t.o
    ext/Encode/KR/pm_to_blib
    ext/Encode/Makefile
    ext/Encode/Symbol/Makefile
    ext/Encode/Symbol/Symbol.c
    ext/Encode/Symbol/Symbol.o
    ext/Encode/Symbol/Symbol.xs
    ext/Encode/Symbol/pm_to_blib
    ext/Encode/Symbol/symbol_t.c
    ext/Encode/Symbol/symbol_t.exh
    ext/Encode/Symbol/symbol_t.fnm
    ext/Encode/Symbol/symbol_t.h
    ext/Encode/Symbol/symbol_t.o
    ext/Encode/TW/Makefile
    ext/Encode/TW/TW.c
    ext/Encode/TW/TW.o
    ext/Encode/TW/TW.xs
    ext/Encode/TW/bi_00_t.c
    ext/Encode/TW/bi_00_t.exh
    ext/Encode/TW/bi_00_t.fnm
    ext/Encode/TW/bi_00_t.h
    ext/Encode/TW/bi_00_t.o
    ext/Encode/TW/bi_01_t.c
    ext/Encode/TW/bi_01_t.exh
    ext/Encode/TW/bi_01_t.fnm
    ext/Encode/TW/bi_01_t.h
    ext/Encode/TW/bi_01_t.o
    ext/Encode/TW/cp_02_t.c
    ext/Encode/TW/cp_02_t.exh
    ext/Encode/TW/cp_02_t.fnm
    ext/Encode/TW/cp_02_t.h
    ext/Encode/TW/cp_02_t.o
    ext/Encode/TW/ma_03_t.c
    ext/Encode/TW/ma_03_t.exh
    ext/Encode/TW/ma_03_t.fnm
    ext/Encode/TW/ma_03_t.h
    ext/Encode/TW/ma_03_t.o
    ext/Encode/TW/pm_to_blib
    ext/Encode/Unicode/Makefile
    ext/Encode/Unicode/Unicode.c
    ext/Encode/Unicode/Unicode.o
    ext/Encode/Unicode/pm_to_blib
    ext/Encode/blib/
    ext/Encode/def_t.c
    ext/Encode/def_t.exh
    ext/Encode/def_t.fnm
    ext/Encode/def_t.h
    ext/Encode/def_t.o
    ext/Encode/encengine.o
    ext/Encode/pm_to_blib
    ext/Errno/Errno.pm
    ext/Errno/Makefile
    ext/Errno/arch.txt
    ext/Errno/blib/
    ext/Errno/pm_to_blib
    ext/Fcntl/Fcntl.c
    ext/Fcntl/Fcntl.o
    ext/Fcntl/Makefile
    ext/Fcntl/blib/
    ext/Fcntl/const-c.inc
    ext/Fcntl/const-xs.inc
    ext/Fcntl/pm_to_blib
    ext/File/Glob/Glob.c
    ext/File/Glob/Glob.o
    ext/File/Glob/Makefile
    ext/File/Glob/blib/
    ext/File/Glob/bsd_glob.o
    ext/File/Glob/const-c.inc
    ext/File/Glob/const-xs.inc
    ext/File/Glob/pm_to_blib
    ext/Filter/Util/Call/Call.c
    ext/Filter/Util/Call/Call.o
    ext/Filter/Util/Call/Makefile
    ext/Filter/Util/Call/blib/
    ext/Filter/Util/Call/pm_to_blib
    ext/Hash/Util/HashUtil.c
    ext/Hash/Util/Makefile
    ext/Hash/Util/Util.o
    ext/Hash/Util/blib/
    ext/Hash/Util/pm_to_blib
    ext/I18N/Langinfo/Langinfo.c
    ext/I18N/Langinfo/Langinfo.o
    ext/I18N/Langinfo/Makefile
    ext/I18N/Langinfo/blib/
    ext/I18N/Langinfo/const-c.inc
    ext/I18N/Langinfo/const-xs.inc
    ext/I18N/Langinfo/pm_to_blib
    ext/IO/IO.c
    ext/IO/IO.o
    ext/IO/Makefile
    ext/IO/blib/
    ext/IO/pm_to_blib
    ext/IO/poll.o
    ext/IPC/SysV/Makefile
    ext/IPC/SysV/SysV.c
    ext/IPC/SysV/SysV.o
    ext/IPC/SysV/blib/
    ext/IPC/SysV/const-c.inc
    ext/IPC/SysV/const-xs.inc
    ext/IPC/SysV/pm_to_blib
    ext/IPC/SysV/ppport.h
    ext/List/Util/ListUtil.c
    ext/List/Util/Makefile
    ext/List/Util/Util.o
    ext/List/Util/blib/
    ext/List/Util/pm_to_blib
    ext/MIME/Base64/Base64.c
    ext/MIME/Base64/Base64.o
    ext/MIME/Base64/Makefile
    ext/MIME/Base64/blib/
    ext/MIME/Base64/pm_to_blib
    ext/Module/Pluggable/Makefile
    ext/Module/Pluggable/blib/
    ext/Module/Pluggable/pm_to_blib
    ext/Opcode/Makefile
    ext/Opcode/Opcode.c
    ext/Opcode/Opcode.o
    ext/Opcode/blib/
    ext/Opcode/pm_to_blib
    ext/POSIX/Makefile
    ext/POSIX/POSIX.c
    ext/POSIX/POSIX.o
    ext/POSIX/blib/
    ext/POSIX/const-c.inc
    ext/POSIX/const-xs.inc
    ext/POSIX/pm_to_blib
    ext/PerlIO/encoding/Makefile
    ext/PerlIO/encoding/blib/
    ext/PerlIO/encoding/encoding.c
    ext/PerlIO/encoding/encoding.o
    ext/PerlIO/encoding/pm_to_blib
    ext/PerlIO/scalar/Makefile
    ext/PerlIO/scalar/blib/
    ext/PerlIO/scalar/pm_to_blib
    ext/PerlIO/scalar/scalar.c
    ext/PerlIO/scalar/scalar.o
    ext/PerlIO/via/Makefile
    ext/PerlIO/via/blib/
    ext/PerlIO/via/pm_to_blib
    ext/PerlIO/via/via.c
    ext/PerlIO/via/via.o
    ext/SDBM_File/Makefile
    ext/SDBM_File/SDBM_File.c
    ext/SDBM_File/SDBM_File.o
    ext/SDBM_File/blib/
    ext/SDBM_File/pm_to_blib
    ext/SDBM_File/sdbm/Makefile
    ext/SDBM_File/sdbm/hash.o
    ext/SDBM_File/sdbm/libsdbm.a
    ext/SDBM_File/sdbm/pair.o
    ext/SDBM_File/sdbm/sdbm.o
    ext/Socket/Makefile
    ext/Socket/Socket.c
    ext/Socket/Socket.o
    ext/Socket/blib/
    ext/Socket/const-c.inc
    ext/Socket/const-xs.inc
    ext/Socket/pm_to_blib
    ext/Storable/Makefile
    ext/Storable/Storable.c
    ext/Storable/Storable.o
    ext/Storable/blib/
    ext/Storable/pm_to_blib
    ext/Sys/Hostname/Hostname.c
    ext/Sys/Hostname/Hostname.o
    ext/Sys/Hostname/Makefile
    ext/Sys/Hostname/blib/
    ext/Sys/Hostname/pm_to_blib
    ext/Sys/Syslog/Makefile
    ext/Sys/Syslog/Syslog.c
    ext/Sys/Syslog/Syslog.o
    ext/Sys/Syslog/blib/
    ext/Sys/Syslog/const-c.inc
    ext/Sys/Syslog/const-xs.inc
    ext/Sys/Syslog/lib/
    ext/Sys/Syslog/macros.all
    ext/Sys/Syslog/pm_to_blib
    ext/Text/Soundex/Makefile
    ext/Text/Soundex/Soundex.c
    ext/Text/Soundex/Soundex.o
    ext/Text/Soundex/blib/
    ext/Text/Soundex/pm_to_blib
    ext/Time/HiRes/HiRes.c
    ext/Time/HiRes/HiRes.o
    ext/Time/HiRes/Makefile
    ext/Time/HiRes/blib/
    ext/Time/HiRes/const-c.inc
    ext/Time/HiRes/const-xs.inc
    ext/Time/HiRes/pm_to_blib
    ext/Time/HiRes/ppport.h
    ext/Time/HiRes/xdefine
    ext/Unicode/Normalize/Makefile
    ext/Unicode/Normalize/Normalize.c
    ext/Unicode/Normalize/Normalize.o
    ext/Unicode/Normalize/blib/
    ext/Unicode/Normalize/pm_to_blib
    ext/Unicode/Normalize/unfcan.h
    ext/Unicode/Normalize/unfcmb.h
    ext/Unicode/Normalize/unfcmp.h
    ext/Unicode/Normalize/unfcpt.h
    ext/Unicode/Normalize/unfexc.h
    ext/Win32API/File/ppport.h
    ext/attrs/Makefile
    ext/attrs/attrs.c
    ext/attrs/attrs.o
    ext/attrs/blib/
    ext/attrs/pm_to_blib
    ext/re/Makefile
    ext/re/blib/
    ext/re/pm_to_blib
    ext/re/re.c
    ext/re/re.o
    ext/re/re_comp.c
    ext/re/re_comp.o
    ext/re/re_exec.c
    ext/re/re_exec.o
    ext/threads/Makefile
    ext/threads/blib/
    ext/threads/pm_to_blib
    ext/threads/shared/Makefile
    ext/threads/shared/blib/
    ext/threads/shared/pm_to_blib
    ext/threads/shared/shared.c
    ext/threads/shared/shared.o
    ext/threads/threads.c
    ext/threads/threads.o
    extra.pods
    globals.o
    gv.o
    hv.o
    lib/.exists
    lib/B.pm
    lib/B/
    lib/ByteLoader.pm
    lib/Config.pm
    lib/Config.pod
    lib/Config_heavy.pl
    lib/Data/
    lib/Devel/.exists
    lib/Devel/DProf.pm
    lib/Devel/InnerPackage.pm
    lib/Devel/PPPort.pm
    lib/Devel/Peek.pm
    lib/Digest/.exists
    lib/Digest/MD5.pm
    lib/DynaLoader.pm
    lib/Encode.pm
    lib/Encode/
    lib/Errno.pm
    lib/ExtUtils/Miniperl.pm
    lib/Fcntl.pm
    lib/File/.exists
    lib/File/Glob.pm
    lib/Filter/Util/
    lib/Hash/
    lib/I18N/.exists
    lib/I18N/Langinfo.pm
    lib/IO.pm
    lib/IO/
    lib/IPC/.exists
    lib/IPC/Msg.pm
    lib/IPC/Semaphore.pm
    lib/IPC/SharedMem.pm
    lib/IPC/SysV.pm
    lib/IPC/regen.pl
    lib/List/
    lib/MIME/
    lib/Module/.exists
    lib/Module/Pluggable.pm
    lib/Module/Pluggable/
    lib/O.pm
    lib/Opcode.pm
    lib/POSIX.pm
    lib/POSIX.pod
    lib/PerlIO/.exists
    lib/PerlIO/encoding.pm
    lib/PerlIO/scalar.pm
    lib/PerlIO/via.pm
    lib/SDBM_File.pm
    lib/Safe.pm
    lib/Scalar/
    lib/Socket.pm
    lib/Storable.pm
    lib/Sys/
    lib/Text/.exists
    lib/Text/Soundex.pm
    lib/Time/.exists
    lib/Time/HiRes.pm
    lib/Unicode/.exists
    lib/Unicode/Normalize.pm
    lib/XSLoader.pm
    lib/attrs.pm
    lib/auto/
    lib/encoding.pm
    lib/lib.pm
    lib/ops.pm
    lib/re.pm
    lib/threads.pm
    lib/threads/
    lib/unicore/Canonical.pl
    lib/unicore/CombiningClass.pl
    lib/unicore/Decomposition.pl
    lib/unicore/Exact.pl
    lib/unicore/Name.pl
    lib/unicore/PVA.pl
    lib/unicore/Properties
    lib/unicore/To/
    lib/unicore/lib/
    libperl.a
    locale.o
    make_perl_at_*.log
    makeaperl
    makedepend
    makedir
    makefile
    makefile.old
    mathoms.o
    mg.o
    miniperl
    miniperlmain.o
    myconfig
    numeric.o
    op.o
    opmini.c
    opmini.o
    pad.o
    perl
    perl.o
    perlapi.o
    perlio.o
    perlmain.c
    perlmain.o
    perly.o
    pod/Makefile
    pod/perlaix.pod
    pod/perlamiga.pod
    pod/perlapollo.pod
    pod/perlbeos.pod
    pod/perlbs2000.pod
    pod/perlce.pod
    pod/perlcn.pod
    pod/perlcygwin.pod
    pod/perldelta.pod
    pod/perldgux.pod
    pod/perldos.pod
    pod/perlepoc.pod
    pod/perlfreebsd.pod
    pod/perlhpux.pod
    pod/perlhurd.pod
    pod/perlirix.pod
    pod/perljp.pod
    pod/perlko.pod
    pod/perllinux.pod
    pod/perlmachten.pod
    pod/perlmacos.pod
    pod/perlmacosx.pod
    pod/perlmint.pod
    pod/perlmpeix.pod
    pod/perlnetware.pod
    pod/perlopenbsd.pod
    pod/perlos2.pod
    pod/perlos390.pod
    pod/perlos400.pod
    pod/perlplan9.pod
    pod/perlqnx.pod
    pod/perlriscos.pod
    pod/perlsolaris.pod
    pod/perltru64.pod
    pod/perltw.pod
    pod/perluts.pod
    pod/perlvmesa.pod
    pod/perlvms.pod
    pod/perlvos.pod
    pod/perlwin32.pod
    pod/pod2html
    pod/pod2latex
    pod/pod2man
    pod/pod2text
    pod/pod2usage
    pod/podchecker
    pod/podselect
    pp.o
    pp_ctl.o
    pp_hot.o
    pp_pack.o
    pp_sort.o
    pp_sys.o
    reentr.o
    regcomp.o
    regexec.o
    run.o
    scope.o
    sv.o
    t/Module_Pluggable/lib/EditorJunk/Plugin/#Bar.pm#
    t/Module_Pluggable/lib/EditorJunk/Plugin/.#Bar.pm
    t/Module_Pluggable/lib/OddTest/Plugin/-Dodgy.pm
    taint.o
    toke.o
    uni.data
    universal.o
    utf8.o
    util.o
    utils/c2ph
    utils/corelist
    utils/cpan
    utils/dprofpp
    utils/enc2xs
    utils/h2ph
    utils/h2xs
    utils/instmodsh
    utils/libnetcfg
    utils/perlbug
    utils/perlcc
    utils/perldoc
    utils/perlivp
    utils/piconv
    utils/pl2pm
    utils/prove
    utils/pstruct
    utils/splain
    utils/xsubpp
    writemain
    x2p/Makefile
    x2p/a2p
    x2p/a2p.o
    x2p/cflags
    x2p/find2perl
    x2p/hash.o
    x2p/makefile
    x2p/makefile.old
    x2p/psed
    x2p/s2p
    x2p/str.o
    x2p/util.o
    x2p/walk.o
    xsutils.o
)

function _FN_clean_perl()
{
more >&1<<EOF

${Bseablue}${Fblack}==================================================${AC}
${Bseablue}${Fblack}Clean: ...${Fred}perl${Fblack}...dss...                           ${AC}
${Bseablue}${Fblack}==================================================${AC}

EOF
    _BIN_PERL="${_JLLCFG_BIN_PERL%%/perl-5.8.9*}/perl-5.8.9"
    if [ x"${_BIN_PERL}" != x -a -e "${_BIN_PERL}" ]; then
        echo "JLL: Removing Bin Path @ ${_BIN_PERL}"
        rm -rf ${_BIN_PERL}
    fi

    if [ -e "${_JLLCFG_SRC_PERL}" ]; then
        cd ${_JLLCFG_SRC_PERL}
        [ x"$(ls | grep -Ei 'makefile ')" != x ] && make clean
        [ x"$(ls | grep -Ei 'make_perl_at_.*\.log')" != x ] && rm -rf make_perl_at_*.log
        if [ x"${_Perl_lstTarget}" != x ]; then
            _Perl_lstTargetSZ=${#_Perl_lstTarget[@]}
            for((_Perl_i=0; _Perl_i<_Perl_lstTargetSZ; _Perl_i++)) {
                _Perl_entry=${_Perl_lstTarget[_Perl_i]}
                [ x"${_Perl_entry}" != x ] && _Perl_entry="${_JLLCFG_SRC_PERL}/${_Perl_entry}" \
                                           || _Perl_entry=""
                if [ -e "${_Perl_entry}" ]; then
                    echo "JLL: Removing compiled rubbish @ ${_Perl_entry}"
                    rm -rf ${_Perl_entry}
                fi
            }
        fi
    fi
    echo
    echo -e "JLL: ${Fred}perl${AC} was cleaned over."
    echo
}


function _FN_build_perl()
{
more >&1<<EOF

${Bseablue}${Fblack}==================================================${AC}
${Bseablue}${Fblack}Build: ...${Fred}perl${Fblack}...dss...                           ${AC}
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
        echo
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

_JLLCFG_SRC_DSS="$(pwd)/dss"
_JLLCFG_BIN_DSS="/usr/local/sbin/DarwinStreamingServer"
function _FN_build_dss()
{
more >&1<<EOF

${Bseablue}${Fblack}==================================================${AC}
${Bseablue}${Fblack}Build: ...perl...${Fred}dss${Fblack}...                           ${AC}
${Bseablue}${Fblack}==================================================${AC}

EOF
    # Check if dss is installed or not
    if [ ! -e "${_JLLCFG_BIN_DSS}" ]; then
        if [ ! -e "${_JLLCFG_SRC_DSS}" ]; then
            echo -e "${Bred}${Fyellow}JLL-Exit:${AC} not found" \
                    "${Bred}${Fwhite}${_JLLCFG_SRC_DSS}${AC}"
            _FN_exit
        fi
        cd ${_JLLCFG_SRC_DSS}
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
        echo
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

function _FN_clean_pipeline()
{
    _FN_clean_perl
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
    _FN_clean_pipeline
    exit 0
fi

