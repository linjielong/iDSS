#!/bin/bash
# Copyright(c) 2016-2100.  jielong.lin  All rights reserved.
#
#   FileName:     jll.maker.sh
#   Author:       jielong.lin 
#   Email:        493164984@qq.com
#   DateTime:     2017-06-21 00:09:54
#   ModifiedTime: 2017-06-22 15:39:20

JLLPATH="$(which $0)"
JLLPATH="$(dirname ${JLLPATH})"
source ${JLLPATH}/.BashShellLibrary


_DT_=$(date +%Y_%m_%d__%H_%M_%S)

_JLLCFG_PERL="perl-5.8.9"
_JLLCFG_SRC_PERL="$(pwd)/${_JLLCFG_PERL}"
_JLLCFG_BIN_PERL="/usr/local/DarwinStreamingServer/${_JLLCFG_PERL}/bin/perl"

_JLLCFG_SRC_DSS="$(pwd)/dss"
_JLLCFG_BIN_DSS="/usr/local/sbin/DarwinStreamingServer"
_JLLCFG_BIN_SAS="/usr/local/sbin/streamingadminserver.pl"
_JLLCFG_CONTENT_DSS="elif [ -x ${_JLLCFG_BIN_PERL} ]; then \
\n    perldef=${_JLLCFG_BIN_PERL}\
"


declare -i GvPageUnit=10
declare -a GvPageMenuUtilsContent=(
  "build_pipeline: ...perl...dss..."
  "clean_pipeline: ...dss...perl..."
)


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

declare -a _Dss_lstTarget=(
    DarwinStreamingServer
    StreamingLoadTool/StreamingLoadTool
    APICommonCode/QTSSModuleUtils.o
    APICommonCode/QTSSRollingLog.o
    APICommonCode/SDPSourceInfo.o
    APICommonCode/SourceInfo.o
    APIModules/OSMemory_Modules/OSMemory_Modules.o
    APIModules/QTSSDemoAuthorizationModule.bproj/QTSSDemoAuthorizationModule
    APIModules/QTSSDemoAuthorizationModule.bproj/QTSSDemoAuthorizationModule.o
    APIModules/QTSSHomeDirectoryModule/DirectoryInfo.o
    APIModules/QTSSHomeDirectoryModule/QTSSHomeDirectoryModule
    APIModules/QTSSHomeDirectoryModule/QTSSHomeDirectoryModule.o
    APIModules/QTSSRawFileModule.bproj/QTSSRawFileModule
    APIModules/QTSSRawFileModule.bproj/QTSSRawFileModule.o
    APIModules/QTSSRefMovieModule/QTSSRefMovieModule
    APIModules/QTSSRefMovieModule/QTSSRefMovieModule.o
    APIModules/QTSSSpamDefenseModule.bproj/QTSSSpamDefenseModule
    APIModules/QTSSSpamDefenseModule.bproj/QTSSSpamDefenseModule.o
    APIStubLib/QTSS_Private.o
    CommonUtilitiesLib/ConfParser.o
    CommonUtilitiesLib/DateTranslator.o
    CommonUtilitiesLib/EventContext.o
    CommonUtilitiesLib/GetWord.o
    CommonUtilitiesLib/IdleTask.o
    CommonUtilitiesLib/MyAssert.o
    CommonUtilitiesLib/OS.o
    CommonUtilitiesLib/OSBufferPool.o
    CommonUtilitiesLib/OSCodeFragment.o
    CommonUtilitiesLib/OSCond.o
    CommonUtilitiesLib/OSFileSource.o
    CommonUtilitiesLib/OSHeap.o
    CommonUtilitiesLib/OSMutex.o
    CommonUtilitiesLib/OSMutexRW.o
    CommonUtilitiesLib/OSQueue.o
    CommonUtilitiesLib/OSRef.o
    CommonUtilitiesLib/OSThread.o
    CommonUtilitiesLib/QueryParamList.o
    CommonUtilitiesLib/ResizeableStringFormatter.o
    CommonUtilitiesLib/SDPUtils.o
    CommonUtilitiesLib/Socket.o
    CommonUtilitiesLib/SocketUtils.o
    CommonUtilitiesLib/StrPtrLen.o
    CommonUtilitiesLib/StringFormatter.o
    CommonUtilitiesLib/StringParser.o
    CommonUtilitiesLib/StringTranslator.o
    CommonUtilitiesLib/TCPListenerSocket.o
    CommonUtilitiesLib/TCPSocket.o
    CommonUtilitiesLib/Task.o
    CommonUtilitiesLib/TimeoutTask.o
    CommonUtilitiesLib/Trim.o
    CommonUtilitiesLib/UDPDemuxer.o
    CommonUtilitiesLib/UDPSocket.o
    CommonUtilitiesLib/UDPSocketPool.o
    CommonUtilitiesLib/UserAgentParser.o
    CommonUtilitiesLib/atomic.o
    CommonUtilitiesLib/base64.o
    CommonUtilitiesLib/daemon.o
    CommonUtilitiesLib/ev.o
    CommonUtilitiesLib/getopt.o
    CommonUtilitiesLib/libCommonUtilitiesLib.a
    CommonUtilitiesLib/md5.o
    CommonUtilitiesLib/md5digest.o
    DarwinStreamingSrvr-Linux.tar.gz
    DarwinStreamingSrvr-Linux/
    MP3Broadcaster/BroadcasterMain.o
    MP3Broadcaster/MP3Broadcaster
    MP3Broadcaster/MP3Broadcaster.o
    MP3Broadcaster/MP3BroadcasterLog.o
    MP3Broadcaster/MP3FileBroadcaster.o
    MP3Broadcaster/MP3MetaInfoUpdater.o
    OSMemoryLib/OSMemory.o
    PlaylistBroadcaster.tproj/BCasterTracker.o
    PlaylistBroadcaster.tproj/BroadcastLog.o
    PlaylistBroadcaster.tproj/BroadcasterSession.o
    PlaylistBroadcaster.tproj/NoRepeat.o
    PlaylistBroadcaster.tproj/PLBroadcastDef.o
    PlaylistBroadcaster.tproj/PickerFromFile.o
    PlaylistBroadcaster.tproj/PlaylistBroadcaster
    PlaylistBroadcaster.tproj/PlaylistBroadcaster.o
    PlaylistBroadcaster.tproj/PlaylistPicker.o
    PlaylistBroadcaster.tproj/playlist_SDPGen.o
    PlaylistBroadcaster.tproj/playlist_SimpleParse.o
    PlaylistBroadcaster.tproj/playlist_broadcaster.o
    PlaylistBroadcaster.tproj/playlist_elements.o
    PlaylistBroadcaster.tproj/playlist_lists.o
    PlaylistBroadcaster.tproj/playlist_parsers.o
    PlaylistBroadcaster.tproj/playlist_utils.o
    PrefsSourceLib/FilePrefsSource.o
    QTFileLib/QTAtom.o
    QTFileLib/QTAtom.xo
    QTFileLib/QTAtom_dref.o
    QTFileLib/QTAtom_dref.xo
    QTFileLib/QTAtom_elst.o
    QTFileLib/QTAtom_elst.xo
    QTFileLib/QTAtom_hinf.o
    QTFileLib/QTAtom_hinf.xo
    QTFileLib/QTAtom_mdhd.o
    QTFileLib/QTAtom_mdhd.xo
    QTFileLib/QTAtom_mvhd.o
    QTFileLib/QTAtom_mvhd.xo
    QTFileLib/QTAtom_stco.o
    QTFileLib/QTAtom_stco.xo
    QTFileLib/QTAtom_stsc.o
    QTFileLib/QTAtom_stsc.xo
    QTFileLib/QTAtom_stsd.o
    QTFileLib/QTAtom_stsd.xo
    QTFileLib/QTAtom_stss.o
    QTFileLib/QTAtom_stss.xo
    QTFileLib/QTAtom_stsz.o
    QTFileLib/QTAtom_stsz.xo
    QTFileLib/QTAtom_stts.o
    QTFileLib/QTAtom_stts.xo
    QTFileLib/QTAtom_tkhd.o
    QTFileLib/QTAtom_tkhd.xo
    QTFileLib/QTAtom_tref.o
    QTFileLib/QTAtom_tref.xo
    QTFileLib/QTFile.o
    QTFileLib/QTFile.xo
    QTFileLib/QTFile_FileControlBlock.o
    QTFileLib/QTFile_FileControlBlock.xo
    QTFileLib/QTHintTrack.o
    QTFileLib/QTHintTrack.xo
    QTFileLib/QTRTPFile.o
    QTFileLib/QTRTPFile.xo
    QTFileLib/QTTrack.o
    QTFileLib/QTTrack.xo
    QTFileLib/libQTFileExternalLib.a
    QTFileLib/libQTFileLib.a
    QTFileTools/QTBroadcaster.tproj/QTBroadcaster
    QTFileTools/QTBroadcaster.tproj/QTBroadcaster.o
    QTFileTools/QTFileInfo.tproj/QTFileInfo.o
    QTFileTools/QTFileTest.tproj/QTFileTest.o
    QTFileTools/QTRTPFileTest.tproj/QTRTPFileTest
    QTFileTools/QTRTPFileTest.tproj/QTRTPFileTest.o
    QTFileTools/QTRTPGen.tproj/QTRTPGen
    QTFileTools/QTRTPGen.tproj/QTRTPGen.o
    QTFileTools/QTSDPGen.tproj/QTSDPGen
    QTFileTools/QTSDPGen.tproj/QTSDPGen.o
    QTFileTools/QTSampleLister.tproj/QTSampleLister.o
    QTFileTools/QTTrackInfo.tproj/QTTrackInfo.o
    RTCPUtilitiesLib/RTCPAPPNADUPacket.o
    RTCPUtilitiesLib/RTCPAPPPacket.o
    RTCPUtilitiesLib/RTCPAPPQTSSPacket.o
    RTCPUtilitiesLib/RTCPAckPacket.o
    RTCPUtilitiesLib/RTCPPacket.o
    RTCPUtilitiesLib/RTCPSRPacket.o
    RTPMetaInfoLib/RTPMetaInfoPacket.o
    RTSPClientLib/ClientSession.o
    RTSPClientLib/ClientSocket.o
    RTSPClientLib/RTSPClient.o
    SafeStdLib/InternalStdLib.o
    SafeStdLib/InternalStdLib.xo
    StreamingLoadTool/StreamingLoadTool.o
    StreamingProxy--Linux.tar.gz
    qtpasswd.tproj/QTSSPasswd.o
    qtpasswd.tproj/qtpasswd
    QTFileTools/QTFileInfo.tproj/QTFileInfo
    QTFileTools/QTFileTest.tproj/QTFileTest
    QTFileTools/QTSampleLister.tproj/QTSampleLister
    QTFileTools/QTTrackInfo.tproj/QTTrackInfo
)


function _FN_exit()
{
    [ x"${GvPageUnit}" != x ] && unset GvPageUnit
    [ x"${GvPageMenuUtilsContent}" != x ] && unset GvPageMenuUtilsContent
    [ x"${_Perl_lstTarget}" != x ] && unset _Dss_lstTarget
    [ x"${_Dss_lstTarget}" != x ] && unset _Dss_lstTarget
    [ x"${_JLLCFG_BIN_PERL}" != x ] && unset _JLLCFG_BIN_PERL
    [ x"${_JLLCFG_BIN_DSS}" != x ] && unset _JLLCFG_BIN_DSS
    [ x"${_JLLCFG_SRC_PERL}" != x ] && unset _JLLCFG_SRC_PERL
    [ x"${_JLLCFG_SRC_DSS}" != x ] && unset _JLLCFG_SRC_DSS
    [ x"${_DT_}" != x ] && unset _DT_ 
    [ x"${_JLLCFG_CONTENT_DSS}" != x ] && unset _JLLCFG_CONTENT_DSS
    echo
    exit 0
}



function _FN_clean_perl()
{
more >&1<<EOF

${Bseablue}${Fblack}==================================================${AC}
${Bseablue}${Fblack}Clean: ...${Fred}perl${Fblack}...dss...                           ${AC}
${Bseablue}${Fblack}==================================================${AC}

EOF
    _BIN_PERL="${_JLLCFG_BIN_PERL%%/${_JLLCFG_PERL}*}/${_JLLCFG_PERL}"
    if [ x"${_BIN_PERL}" != x -a -e "${_BIN_PERL}" ]; then
        echo "JLL: Removing Bin Path @ ${_BIN_PERL}"
        rm -rf ${_BIN_PERL}
    fi
    [ x"${_BIN_PERL}" != x ] && unset _BIN_PERL

    if [ x"${_JLLCFG_SRC_PERL}" != x -a -e "${_JLLCFG_SRC_PERL}" ]; then
        cd ${_JLLCFG_SRC_PERL}
        [ x"$(ls | grep -Ei 'makefile ')" != x ] && make clean
        [ x"$(ls | grep -Ei 'make_perl_at_.*\.log')" != x ] && rm -rf make_perl_at_*.log
        cd - >/dev/null
    fi
    if [ x"${_Perl_lstTarget}" != x ]; then
        _Perl_lstTargetSZ=${#_Perl_lstTarget[@]}
        for((_Perl_i=0; _Perl_i<_Perl_lstTargetSZ; _Perl_i++)) {
            _Perl_entry=${_Perl_lstTarget[_Perl_i]}
            [ x"${_Perl_entry}" != x ] && _Perl_entry="${_JLLCFG_SRC_PERL}/${_Perl_entry}" \
                                       || _Perl_entry=""
            if [ x"${_Perl_entry}" != x -a -e "${_Perl_entry}" ]; then
                echo "JLL: Removing rubbish @ ${_Perl_entry}"
                rm -rf ${_Perl_entry}
            fi
        }
        [ x"${_Perl_lstTargetSZ}" != x ] && unset _Perl_lstTargetSZ
    fi
    echo
    echo -e "JLL: ${Fred}perl${AC} was cleaned over."
    echo
}


function _FN_clean_dss()
{
more >&1<<EOF

${Bseablue}${Fblack}==================================================${AC}
${Bseablue}${Fblack}Clean: ...perl...${Fred}dss${Fblack}...                           ${AC}
${Bseablue}${Fblack}==================================================${AC}

EOF
    if [ -e "${_JLLCFG_SRC_DSS}/DarwinStreamingSrvr-$(uname)/Uninstall" ]; then
        echo -e "JLL: uninstall Darwing Streaming Server"
        cd ${_JLLCFG_SRC_DSS}/DarwinStreamingSrvr-$(uname)
        ./Uninstall
        cd - >/dev/null
    fi
    if [ x"${_JLLCFG_SRC_DSS}" != x -a -e ${_JLLCFG_SRC_DSS} ]; then
        cd ${_JLLCFG_SRC_DSS}
        [ x"$(ls | grep -Ei 'make_dss_at_.*\.log')" != x ] && rm -rf make_dss_at_*.log
        cd - >/dev/null
    fi
    if [ x"${_Dss_lstTarget}" != x ]; then
        _Dss_lstTargetSZ=${#_Dss_lstTarget[@]}
        for((_Dss_i=0; _Dss_i<_Dss_lstTargetSZ; _Dss_i++)) {
            _Dss_entry=${_Dss_lstTarget[_Dss_i]}
            [ x"${_Dss_entry}" != x ] && _Dss_entry="${_JLLCFG_SRC_DSS}/${_Dss_entry}" \
                                      || _Dss_entry=""
            if [ x"${_Dss_entry}" != x -a -e "${_Dss_entry}" ]; then
                echo "JLL: Removing rubbish @ ${_Dss_entry}"
                rm -rf ${_Dss_entry}
            fi
        }
        [ x"${_Dss_lstTargetSZ}" != x ] && unset _Dss_lstTargetSZ
    fi
    echo
    echo -e "JLL: ${Fred}dss${AC} was cleaned over."
    echo
}

function _FN_clean_pipeline()
{
    _FN_clean_dss
    _FN_clean_perl

    [ -e "${_JLLCFG_BIN_SAS%/*}/.UtilsLibrary" ] && rm -rvf ${_JLLCFG_BIN_SAS%/*}/.UtilsLibrary
    [ -e "${_JLLCFG_BIN_SAS%/*}/jll.iDSS_executor.sh" ] \
    && rm -rvf ${_JLLCFG_BIN_SAS%/*}/jll.iDSS_executor.sh
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
            _FN_clean_pipeline
            _FN_exit 
        fi
        cd ${_JLLCFG_SRC_PERL}
        [ x"$(ls | grep -Ei '^makefile$')" != x ] && make clean
        [ x"$(ls | grep -Ei 'make_perl_at_.*\.log')" != x ] && rm -rf make_perl_at_*.log
        _BIN_PERL="${_JLLCFG_BIN_PERL%%/${_JLLCFG_PERL}*}/${_JLLCFG_PERL}"
        if [ x"${_BIN_PERL}" != x -a -e "${_BIN_PERL}" ]; then
            echo "JLL: Removing Bin Path @ ${_BIN_PERL}"
            rm -rf ${_BIN_PERL}
        fi
        ./Configure -des -Dprefix=${_BIN_PERL} 2>&1 | tee make_perl_at_${_DT_}.log
        [ x"${_BIN_PERL}" != x ] && unset _BIN_PERL
        if [ x"$(ls | grep -Ei '^makefile$')" != x ]; then
            make 2>&1 | tee -a make_perl_at_${_DT_}.log
            make install 2>&1 | tee -a make_perl_at_${_DT_}.log
        else
            echo -e "${Bred}${Fyellow}JLL-Exit:${AC} ${Fred}perl${AC} is configured failure"
            cd - >/dev/null
            _FN_clean_pipeline
            _FN_exit
        fi 
        cd - >/dev/null
        echo
        if [ ! -e "${_JLLCFG_BIN_PERL}" ]; then
            echo -e \
            "${Bred}${Fyellow}JLL-Exit:${AC} ${Fred}perl${AC} is compiled or installed failure"
            _FN_clean_pipeline
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





function _FN_build_dss()
{
more >&1<<EOF

${Bseablue}${Fblack}==================================================${AC}
${Bseablue}${Fblack}Build: ...perl...${Fred}dss${Fblack}...                           ${AC}
${Bseablue}${Fblack}==================================================${AC}

EOF
    # Check if dss is installed or not
    #if [ ! -e "${_JLLCFG_BIN_DSS}" ]; then
    if [ 1 -eq 1 ]; then
        if [ ! -e "${_JLLCFG_SRC_DSS}" ]; then
            echo -e "${Bred}${Fyellow}JLL-Exit:${AC} not found" \
                    "${Bred}${Fwhite}${_JLLCFG_SRC_DSS}${AC}"
            _FN_clean_pipeline
            _FN_exit
        fi
        cd ${_JLLCFG_SRC_DSS}
        [ x"$(ls | grep -Ei 'make_dss_at_.*\.log')" != x ] && rm -rf make_dss_at_*.log
        if [ -e "$(pwd)/buildtarball" -a -x "$(pwd)/buildtarball" ]; then
            ./buildtarball  2>&1 | tee make_dss_at_${_DT_}.log
            if [ ! -e "$(pwd)/DarwinStreamingSrvr-$(uname)/Install" ]; then
                echo -e "${Bred}${Fyellow}JLL-Exit:${AC} Not found " \
                        "${Fred}$(pwd)/DarwinStreamingSrvr-$(uname)/Install${AC}"
                echo -e "${Bred}${Fyellow}JLL-Exit:${AC} ${Fred}dss${AC} is compiled failure"
                cd - >/dev/null
                _FN_clean_pipeline
                _FN_exit
            fi
            cd - >/dev/null

            ##
            ## Customize for using the specified perl
            ##
            _isCHK=$(grep -En "perldef=${_JLLCFG_BIN_PERL}" \
                     ${_JLLCFG_SRC_DSS}/DarwinStreamingSrvr-$(uname)/Install 2>/dev/null)
            if [ x"${_isCHK}" = x ]; then
                _isCHK=$(grep -En "perldef=/usr/freeware/bin/perl" \
                         ${_JLLCFG_SRC_DSS}/DarwinStreamingSrvr-$(uname)/Install 2>/dev/null)
 
                _CNT=0
                _Lines=${_isCHK%%:*}
                for _Line in ${_Lines}; do
                    _CNT=$((_CNT+1))
                done
                if [ ${_CNT} -eq 1 ]; then
                    sed -e "${_Lines} a ${_JLLCFG_CONTENT_DSS}" -i \
                        ${_JLLCFG_SRC_DSS}/DarwinStreamingSrvr-$(uname)/Install
                    echo -e \
                    "JLL: ${Fgreen}${_JLLCFG_SRC_DSS}/DarwinStreamingSrvr-$(uname)/Install${AC}"
                    echo -e \
                    "     is inserted the ${Fgreen}customized perl${AC} successfully @${_Lines}."
                else
                    echo -e \
                        "${Bred}${Fyellow}JLL-Exit:${AC}" \
                        "${Fred}DarwinStreamingSrvr-$(uname)/Install${AC} is invalid."
                    echo -e "JLL-Reason: the number of the matched line (${_CNT}) is more than 1"
                    _FN_clean_pipeline
                    _FN_exit
                fi
            fi
            cd ${_JLLCFG_SRC_DSS}/DarwinStreamingSrvr-$(uname)
            ./Install
        fi
        cd - >/dev/null
        echo
        if [ ! -e "${_JLLCFG_BIN_DSS}" ]; then
            echo -e "${Bred}${Fyellow}JLL-Exit:${AC} ${Fred}dss${AC} is installed failure"
            _FN_clean_pipeline
            _FN_exit
        else
            echo -e "JLL: ${Fred}dss${AC} was installed successfully."
        fi
    else
        echo -e "JLL: ${Fred}dss${AC} has already been installed."
    fi
}



function _FN_build_pipeline()
{
    _FN_build_perl
    _FN_build_dss

cat >$(pwd)/jll.iDSS_executor.sh<<EOF
#!/bin/bash
#
# Copyright(c) 2017-2100.   jielong.lin    All rights reserved.
#
# Created by jielong.lin [jielong.lin@qq.com/493164984@qq.com] @ $(date +%Y-%m-%d\ %H:%M:%S)
#

if [ x"\$(uname)" != x"Linux" ]; then
    echo -e "\${Fred}JLL-Exit::\${AC} \${Fgreen}Platform Type \$(uname) isnot Linux\${AC}"
    exit 0
fi


# adapt to more/echo/less and so on
  ESC=
  AC=${ESC}[0m
  Fblack=${ESC}[30m
  Fred=${ESC}[31m
  Fgreen=${ESC}[32m
  Fyellow=${ESC}[33m
  Fblue=${ESC}[34m
  Fpink=${ESC}[35m
  Fseablue=${ESC}[36m
  Fwhite=${ESC}[37m
  Bblack=${ESC}[40m
  Bred=${ESC}[41m
  Bgreen=${ESC}[42m
  Byellow=${ESC}[43m
  Bblue=${ESC}[44m
  Bpink=${ESC}[45m
  Bseablue=${ESC}[46m
  Bwhite=${ESC}[47m



JLLPATH="\$(which \$0)"
# ./xxx.sh
# ~/xxx.sh
# /home/xxx.sh
# xxx.sh
if [ x"\${JLLPATH}" != x ]; then
    __CvScriptName=\${JLLPATH##*/}
    __CvScriptPath=\${JLLPATH%/*}
    if [ x"\${__CvScriptPath}" = x ]; then
        __CvScriptPath="\$(pwd)"
    else
        __CvScriptPath="\$(cd \${__CvScriptPath};pwd)"
    fi
    if [ x"\${__CvScriptName}" = x ]; then
        echo
        echo "\${Fred}JLL-Exit::\${AC} Not recognize the command \"\$0\", then exit - 0"
        echo
        exit 0
    fi
else
    echo
    echo "\${Fred}JLL-Exit::\${AC} Not recognize the command \"\$0\", then exit - 1"
    echo
    exit 0
fi
JLLPATH="\${__CvScriptPath}"

if [ ! -e "\${JLLPATH}/.UtilsLibrary" ]; then
    echo -e "\${Fred}JLL-Exit::\${AC} not found \${Fgreen}\${JLLPATH}/.UtilsLibrary\${AC}"
    exit 0
fi
source \${JLLPATH}/.UtilsLibrary



if [ ! -e "${_JLLCFG_BIN_DSS}" ]; then
    echo -e "\${Fred}JLL-Exit::\${AC} not found \${Fgreen}${_JLLCFG_BIN_DSS}\${AC}"
    exit 0
fi
if [ ! -e "${_JLLCFG_BIN_SAS}" ]; then
    echo -e "\${Fred}JLL-Exit::\${AC} not found \${Fgreen}${_JLLCFG_BIN_SAS}\${AC}"
    exit 0
fi

isCHK_1=\$(ps axu | awk "{\\\$3=\\\$4=\\\$5=\\\$6=\\\$7=\\\$8=\\\$9=\\\$10=\"\"; print}" \\
           | grep -Ei "[D]arwinStreamingServer$")
isCHK_1="\${isCHK_1//         / }"
isCHK_2=\$(ps axu | awk "{\\\$3=\\\$4=\\\$5=\\\$6=\\\$7=\\\$8=\\\$9=\\\$10=\"\"; print}" \\
           | grep -Ei "[s]treamingadminserver\\.pl$")
isCHK_2="\${isCHK_2//         / }"


declare -i __GvPageUnit=10
declare -a __GvPageMenuUtilsContent
declare -i PMi=0

if [ x"\${isCHK_1}" != x -a y"\${isCHK_2}" != y ]; then
  __GvPageMenuUtilsContent[PMi++]="Dump: show all runtime status of DarwinStreamingServer"
  __GvPageMenuUtilsContent[PMi++]="Stop: stop DarwinStreamingServer and streamingadminserver.pl"
else
  __GvPageMenuUtilsContent[PMi++]="Start: start DarwinStreamingServer and streamingadminserver.pl"
fi

echo
if [ \${PMi} -gt 0 ]; then
    Lfn_PageMenuUtils _MenuID  "Select" 7 4 \\
                               "***** Menu For Darwin Streaming Server  (q: quit) *****"
    if [ x"\${_MenuID%%:*}" = x"Dump" ]; then
        echo
        echo "=================================================================================="
        echo "   Darwin Streaming Server Alive Processes "
        echo "=================================================================================="
        echo "\${isCHK_1}"
        echo "\${isCHK_2}"
        echo
        echo "=================================================================================="
        echo "   Darwin Streaming Server Alive Ports "
        echo "=================================================================================="
        netstat -ntulp | grep -i Darwin
        echo
        echo
    fi

    if [ x"\${_MenuID%%:*}" = x"Start" ]; then
        if [ x"\${isCHK_1}" = x ]; then
            ${_JLLCFG_BIN_DSS}
            isCHK_1=\$(ps axu \\
                       | awk "{\\\$3=\\\$4=\\\$5=\\\$6=\\\$7=\\\$8=\\\$9=\\\$10=\"\"; print}" \\
                       | grep -Ei "[D]arwinStreamingServer$")
            isCHK_1="\${isCHK_1//         / }"
            if [ x"\${isCHK_1}" != x ]; then
                echo -e "JLL:: \${Fgreen}DarwinStreamingServer is started successfully\${AC}"
                echo "\${isCHK_1}"
            else
                echo -e "JLL:: \${Fred}Failed to start DarwinStreamingServer\${AC}"
            fi
        else
            echo -e "\${Fseablue}JLL::\${AC} \${Fgreen}DarwinStreamingServer is running\${AC}"
            echo "\${isCHK_1}"
        fi
        echo
        if [ x"\${isCHK_2}" = x ]; then
            ${_JLLCFG_BIN_SAS}
            isCHK_2=\$(ps axu \\
                       | awk "{\\\$3=\\\$4=\\\$5=\\\$6=\\\$7=\\\$8=\\\$9=\\\$10=\"\"; print}" \\
                       | grep -Ei "[s]treamingadminserver\\.pl$")
            isCHK_2="\${isCHK_2//         / }"
            if [ x"\${isCHK_2}" != x ]; then
                echo -e "JLL:: \${Fgreen}streamingadminserver.pl is started successfully\${AC}"
                echo "\${isCHK_2}"
            else
                echo -e "JLL:: \${Fred}Failed to start streamingadminserver.pl\${AC}"
            fi
        else
            echo -e "\${Fseablue}JLL::\${AC} \${Fgreen}streamingadminserver.pl is running\${AC}"
            echo "\${isCHK_2}"
        fi
    fi

    if [ x"\${_MenuID%%:*}" = x"Stop" ]; then
        if [ x"\${isCHK_1}" != x ]; then
            echo "\${isCHK_1}"
            echo "\${isCHK_1}" | awk '{print \$2}' | xargs -r kill -9 2>/dev/null
            isCHK_1=\$(ps axu \\
                       | awk "{\\\$3=\\\$4=\\\$5=\\\$6=\\\$7=\\\$8=\\\$9=\\\$10=\"\"; print}" \\
                       | grep -Ei "[D]arwinStreamingServer$")
            isCHK_1="\${isCHK_1//         / }"
            if [ x"\${isCHK_1}" != x ]; then
                echo -e "JLL:: \${Fred}Failed to stop DarwinStreamingServer\${AC}"
            else
                echo -e "JLL:: \${Fgreen}DarwinStreamingServer is stopped successfully\${AC}"
            fi
        else
            echo -e "\${Fseablue}JLL::\${AC} \${Fgreen}DarwinStreamingServer is stopped\${AC}"
        fi
        echo
        if [ x"\${isCHK_2}" != x ]; then
            echo "\${isCHK_2}"
            echo "\${isCHK_2}" | awk '{print \$2}' | xargs -r kill -9 2>/dev/null
            isCHK_2=\$(ps axu \\
                       | awk "{\\\$3=\\\$4=\\\$5=\\\$6=\\\$7=\\\$8=\\\$9=\\\$10=\"\"; print}" \\
                       | grep -Ei "[s]treamingadminserver\\.pl$")
            isCHK_2="\${isCHK_2//         / }"
            if [ x"\${isCHK_2}" != x ]; then
                echo -e "JLL:: \${Fred}Failed to stop streamingadminserver.pl\${AC}"
            else
                echo -e "JLL:: \${Fgreen}streamingadminserver.pl is stopped successfully\${AC}"
                echo "\${isCHK_2}"
            fi
        else
            echo -e "\${Fseablue}JLL::\${AC} \${Fgreen}streamingadminserver.pl is stopped\${AC}"
        fi
    fi
else
    echo -e "\${Fred}JLL-Exit::\${AC} \${Bred}\${Fwhite}Unknown Error\${AC}"
fi

[ x"\${_MenuID}" != x ] && unset _MenuID
[ x"\${__GvPageMenuUtilsContent}" != x ] && unset __GvPageMenuUtilsContent
[ x"\${__GvPageUnit}" != x ] && unset __GvPageUnit
[ x"\${PMi}" != x ] && unset PMi
echo

EOF
    chmod +x $(pwd)/jll.iDSS_executor.sh
    cp -rf $(pwd)/.UtilsLibrary ${_JLLCFG_BIN_SAS%/*}/  
    mv -f $(pwd)/jll.iDSS_executor.sh ${_JLLCFG_BIN_SAS%/*}/  
    _FN_exit
}




if [ ! -e "$(pwd)/.UtilsLibrary" ]; then
    echo -e "${Fred}JLL-Exit::${AC} not found ${Fgreen}$(pwd)/.UtilsLibrary${AC}"
    _FN_exit 
fi

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

