TEST(1)                                User Commands                                TEST(1)

NNAAMMEE
       test - check file types and compare values

SSYYNNOOPPSSIISS
       tteesstt _E_X_P_R_E_S_S_I_O_N
       tteesstt
       [[ _E_X_P_R_E_S_S_I_O_N ]]
       [[ ]]
       [[ _O_P_T_I_O_N

DDEESSCCRRIIPPTTIIOONN
       Exit with the status determined by EXPRESSION.

       ----hheellpp display this help and exit

       ----vveerrssiioonn
              output version information and exit

       An omitted EXPRESSION defaults to false.  Otherwise, EXPRESSION is true or false and
       sets exit status.  It is one of:

       ( EXPRESSION )
              EXPRESSION is true

       ! EXPRESSION
              EXPRESSION is false

       EXPRESSION1 --aa EXPRESSION2
              both EXPRESSION1 and EXPRESSION2 are true

       EXPRESSION1 --oo EXPRESSION2
              either EXPRESSION1 or EXPRESSION2 is true

       --nn STRING
              the length of STRING is nonzero

       STRING equivalent to --nn STRING

       --zz STRING
              the length of STRING is zero

       STRING1 = STRING2
              the strings are equal

       STRING1 != STRING2
              the strings are not equal

       INTEGER1 --eeqq INTEGER2
              INTEGER1 is equal to INTEGER2

       INTEGER1 --ggee INTEGER2
              INTEGER1 is greater than or equal to INTEGER2

       INTEGER1 --ggtt INTEGER2
              INTEGER1 is greater than INTEGER2

       INTEGER1 --llee INTEGER2
              INTEGER1 is less than or equal to INTEGER2

       INTEGER1 --lltt INTEGER2
              INTEGER1 is less than INTEGER2

       INTEGER1 --nnee INTEGER2
              INTEGER1 is not equal to INTEGER2

       FILE1 --eeff FILE2
              FILE1 and FILE2 have the same device and inode numbers

       FILE1 --nntt FILE2
              FILE1 is newer (modification date) than FILE2

       FILE1 --oott FILE2
              FILE1 is older than FILE2

       --bb FILE
              FILE exists and is block special

       --cc FILE
              FILE exists and is character special

       --dd FILE
              FILE exists and is a directory

       --ee FILE
              FILE exists

       --ff FILE
              FILE exists and is a regular file

       --gg FILE
              FILE exists and is set-group-ID

       --GG FILE
              FILE exists and is owned by the effective group ID

       --hh FILE
              FILE exists and is a symbolic link (same as --LL)

       --kk FILE
              FILE exists and has its sticky bit set

       --LL FILE
              FILE exists and is a symbolic link (same as --hh)

       --NN FILE
              FILE exists and has been modified since it was last read

       --OO FILE
              FILE exists and is owned by the effective user ID

       --pp FILE
              FILE exists and is a named pipe

       --rr FILE
              FILE exists and read permission is granted

       --ss FILE
              FILE exists and has a size greater than zero

       --SS FILE
              FILE exists and is a socket

       --tt FD  file descriptor FD is opened on a terminal

       --uu FILE
              FILE exists and its set-user-ID bit is set

       --ww FILE
              FILE exists and write permission is granted

       --xx FILE
              FILE exists and execute (or search) permission is granted

       Except for --hh and --LL, all FILE-related tests  dereference  symbolic  links.   Beware
       that  parentheses need to be escaped (e.g., by backslashes) for shells.  INTEGER may
       also be --ll STRING, which evaluates to the length of STRING.

       NOTE: Binary --aa and --oo are inherently ambiguous.  Use 'test EXPR1 && test EXPR2'  or
       'test EXPR1 || test EXPR2' instead.

       NOTE:  [  honors  the  ----hheellpp and ----vveerrssiioonn options, but test does not.  test treats
       each of those as it treats any other nonempty STRING.

       NOTE: your shell may have its own version of test and/or [, which usually supersedes
       the  version described here.  Please refer to your shell's documentation for details
       about the options it supports.

AAUUTTHHOORR
       Written by Kevin Braunsdorf and Matthew Bradburn.

RREEPPOORRTTIINNGG BBUUGGSS
       GNU coreutils online help: <https://www.gnu.org/software/coreutils/>
       Report any translation bugs to <https://translationproject.org/team/>

CCOOPPYYRRIIGGHHTT
       Copyright © 2020 Free Software Foundation, Inc.  License GPLv3+: GNU GPL  version  3
       or later <https://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WAR‐
       RANTY, to the extent permitted by law.

SSEEEE AALLSSOO
       Full documentation <https://www.gnu.org/software/coreutils/[>
       or available locally via: info '(coreutils) test invocation'

GNU coreutils 8.32                     September 2020                               TEST(1)
