#!/bin/sh
WORKDIR="`dirname $0`"
WORKDIR="`readlink -f "$WORKDIR"`"

mkdir -p "$WORKDIR/revision5"
cd "$WORKDIR/revision5"

cp ../CAM/back_silk.grb skunk_v5.ssb
cp ../CAM/bottom_solder_mask.grb skunk_v5.smb
cp ../CAM/bottom_copper.grb skunk_v5.bot
cp ../CAM/inner_copper_2.grb skunk_v5.in2
cp ../CAM/inner_copper_1.grb skunk_v5.in1
cp ../CAM/top_copper.grb skunk_v5.top
cp ../CAM/top_solder_mask.grb skunk_v5.smt
cp ../CAM/top_silk.grb skunk_v5.sst
cp ../CAM/drill_file.drl thruhole.tap
cp ../CAM/board_outline.grb skunk_v5.fab
rm -f skunk_v5.zip
zip skunk_v5.zip *

