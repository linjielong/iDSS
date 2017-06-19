#!/bin/bash
# Copyright(c) 2016-2100.  root.  All rights reserved.
#
#   FileName:     more.dss.sh
#   Author:       root
#   Email:        493164984@qq.com
#   DateTime:     2017-06-18 18:04:23
#   ModifiedTime: 2017-06-20 00:25:24

JLLPATH="$(which $0)"
JLLPATH="$(dirname ${JLLPATH})"

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

more >&1<<EOF

${Byellow}${Fblack} dss - Darwin Streaming Server                                        ${AC}
https://github.com/macosforge/dss

Darwin Streaming Server is Apple's open source version of the QuickTime Streaming Server 
technology allowing you to send streaming media across the Internet using the industry 
standard RTP and RTSP protocols. https://macosforge.github.io/dss/



${Byellow}${Fblack} Building Book is writen by _jielong_lin_ @2017-06-20                 ${AC}

${Fseablue}build all:${AC}
jl@S:~$ ${Fgreen}cd dss${AC}
jl@S:~/dss$ ${Fgreen}./buildtarball${AC}




${Byellow}${Fblack} Building Book is writen by _jielong_lin_ @2017-06-19                 ${AC}

${Fseablue}cleaning:${AC}
./Buildit clean
rm -rvf DarwinStreamingSrvr*
rm -rvf StreamingProxy*

${Fseablue}0).Apply the patchs before compiling: [note: the patchs are applied in codes] ${AC}
jl@S:~$ ${Fgreen}cd dss${AC}
jl@S:~/dss$ ${Fgreen}cp -rvf ../dss-6.0.3.patch  ./${AC}
jl@S:~/dss$ ${Fgreen}cp -rvf ../dss-hh-20080728-1.patch ./${AC}
jl@S:~/dss$ ${Fgreen}patch -p1 < dss-6.0.3.patch${AC}
jl@S:~/dss$ ${Fgreen}patch -p1 < dss-hh-20080728-1.patch${AC}

${Fseablue}1).Compile: ${AC}
jl@S:~/dss$ ${Fgreen}./Buildit${AC}

${Fseablue}2).Generate Installing Package of dss such as DarwinStreamingSrvr-Linux.tar.gz${AC}
jl@S:~/dss$ ${Fgreen}./buildtarball${AC}

${Fred}[note] please modify Makefile.POSIX if any error is met:${AC}
${Fpink}stdc++ -lm -lcrypt -lCommonUtilitiesLib ../CommonUtilitiesLib/libCommonUtilitiesLib.a${AC}
${Fpink}../CommonUtilitiesLib/libCommonUtilitiesLib.a(SDPUtils.o): In function 'memset':${AC}
${Fpink}/usr/include/i386-linux-gnu/bits/string3.h:82: warning: memset used with${AC}
${Fpink}constant zero length parameter; this could be due to transposed parameters${AC}
${Fpink}DarwinStreamingServer failed to build!${AC}
${Fpink}Buildit Failed. Exiting!${AC}
jl@S:~/dss$ ${Fgreen}vim Makefile.POSIX${AC}
...
LIBS = $(CORE_LINK_LIBS) -lCommonUtilitiesLib -lQTFileLib -ldl
... 
jl@S:~/dss$ ${Fgreen}vim QTFileTools/QTFileInfo.tproj/Makefile.POSIX${AC}
jl@S:~/dss$ ${Fgreen}vim QTFileTools/QTFileTest.tproj/Makefile.POSIX${AC}
jl@S:~/dss$ ${Fgreen}vim QTFileTools/QTSampleLister.tproj/Makefile.POSIX${AC}
jl@S:~/dss$ ${Fgreen}vim QTFileTools/QTTrackInfo.tproj/Makefile.POSIX${AC}
...
LIBS+ =  -lpthread
...

${Fseablue}3).Uncompress DarwinStreamingSrvr-Linux.tar.gz and modify Install file as follows:${AC}
jl@S:~/dss$ ${Fgreen}tar -zvxf DarwinStreamingSrvr-Linux.tar.gz${AC}
jl@S:~/dss$ ${Fgreen}cd DarwinStreamingSrvr-Linux${AC}
jl@S:~/dss$ ${Fgreen}vim Install${AC}
...
if [ \$INSTALL_OS = "Linux" ]; then
         ${Fred}# Please modify the below as follows:${AC}
         ${Bred}${Fyellow}### JLL.S20170618: ###                                             ${AC}
         ${Fpink}#/usr/sbin/groupadd qtss > /dev/null 2>&1${AC}
         ${Bred}${Fyellow}if [ x"\$(grep -Ew 'qtss' /etc/group --colour=always)" = x ]; then  ${AC}
         ${Bred}${Fyellow}    /usr/sbin/groupadd qtss 2>&1                                   ${AC}
         ${Bred}${Fyellow}fi                                                                 ${AC}
         ${Fpink}#/usr/sbin/useradd -M qtss > /dev/null 2>&1                                 ${AC}
         ${Bred}${Fyellow}if [ x"\$(grep -Ew 'qtss' /etc/passwd --colour=always)" = x ]; then ${AC}
         ${Bred}${Fyellow}    /usr/sbin/useradd -m qtss -g qtss 2>&1                         ${AC}
         ${Bred}${Fyellow}fi                                                                 ${AC}
         ${Bred}${Fyellow}### JLL.E20170618: ###                                             ${AC}
      else
          /usr/sbin/groupadd qtss > /dev/null 2>&1
          /usr/sbin/useradd qtss > /dev/null 2>&1 
      fi
      ...

jl@S:~/dss$ ${Fgreen}./Install${AC}
    Please enter a new administrator user name: 【新管理员,such as: jll】
    Please enter a new administrator Password: 【密码, such as: jll】

${Fseablue}4).Check if install successfully or failure:${AC}
jl@S:~/dss$ ${Fgreen}ps aux | grep Darwin ${AC}#查看流媒体服务器的进程
    root ... ... ... /usr/local/sbin/DarwinStreamingServer 
    qtss ... ... ... /usr/local/sbin/DarwinStreamingServer
jl@S:~/dss$ ${Fgreen}netstat -ntulp | grep Darwin ${AC}#查看流媒体服务器的端口

${Fseablue}5).Start Darwin Streaming Server${AC}
 #启动 Web 管理介面 (tcp port 1220)
jl@S:~/dss$ ${Fgreen}sudo /usr/local/sbin/DarwinStreamingServer ${AC}
jl@S:~/dss$ ${Fgreen}sudo /usr/local/sbin/streamingadminserver.pl${AC}
#以上两项在刚安装好的时候会自动启动，不需手动执行

Trick:
自动运行流媒体服务器序非常简单，把上述命令添加在/etc/rc.d/rc.local脚本中即可。
最后在服务器输入 http://你的IP:1220/来访问web管理 
默认的媒体文件存放在/usr/local/movies 你可以在web管理面板修改这个路径。


访问自己的流媒体服务
可以使用VLC media player这个软件，输入
    rtsp://你的IP/sample_100kbit.mp4
来播放默认的测试视频。如果你的网速够给力的话效果还不错 



EOF



