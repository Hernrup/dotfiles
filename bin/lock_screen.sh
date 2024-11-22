#!/bin/bash
# https://bbs.archlinux.org/viewtopic.php?id=275795

# hide i3 bar
# i3-msg mode "default"

# /usr/bin/i3lock --color=335066

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#335066'
TEXT='#335066'
WRONG='#880000bb'
VERIFYING='#bb00bbbb'

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--screen 1                   \
--blur 5                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %Y-%m-%d"       \