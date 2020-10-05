#!/bin/sh
WORKDIR="`dirname $0`"
WORKDIR="`readlink -f "$WORKDIR"`"

if [ x"$1" = x"--osh" ]; then
	BOTTOM_SILK_EXT=gbo
	BOTTOM_SOLDER_EXT=gbs
	BOTTOM_COPPER_EXT=gbl
	INNER_2_EXT=g3l
	INNER_1_EXT=g2l
	TOP_COPPER_EXT=gtl
	TOP_SOLDER_EXT=gts
	TOP_SILK_EXT=gto
	DRILL_EXT=xln
	BOARD_OUTLINE_EXT=gko
else
	BOTTOM_SILK_EXT=ssb
	BOTTOM_SOLDER_EXT=smb
	BOTTOM_COPPER_EXT=bot
	INNER_2_EXT=in2
	INNER_1_EXT=in1
	TOP_COPPER_EXT=top
	TOP_SOLDER_EXT=smt
	TOP_SILK_EXT=sst
	DRILL_EXT=tap
	BOARD_OUTLINE_EXT=fab
fi

mkdir -p "$WORKDIR/revision5"
cd "$WORKDIR/revision5"

cp ../CAM/back_silk.grb skunk_v5.$BOTTOM_SILK_EXT
cp ../CAM/bottom_solder_mask.grb skunk_v5.$BOTTOM_SOLDER_EXT
cp ../CAM/bottom_copper.grb skunk_v5.$BOTTOM_COPPER_EXT
cp ../CAM/inner_copper_2.grb skunk_v5.$INNER_2_EXT
cp ../CAM/inner_copper_1.grb skunk_v5.$INNER_1_EXT
cp ../CAM/top_copper.grb skunk_v5.$TOP_COPPER_EXT
cp ../CAM/top_solder_mask.grb skunk_v5.$TOP_SOLDER_EXT
cp ../CAM/top_silk.grb skunk_v5.$TOP_SILK_EXT
cp ../CAM/drill_file.drl skunk_v5.$DRILL_EXT
cp ../CAM/board_outline.grb skunk_v5.$BOARD_OUTLINE_EXT
rm -f skunk_v5.zip
zip skunk_v5.zip skunk_v5.$BOTTOM_SILK_EXT
zip skunk_v5.zip skunk_v5.$BOTTOM_SOLDER_EXT
zip skunk_v5.zip skunk_v5.$BOTTOM_COPPER_EXT
zip skunk_v5.zip skunk_v5.$INNER_2_EXT
zip skunk_v5.zip skunk_v5.$INNER_1_EXT
zip skunk_v5.zip skunk_v5.$TOP_COPPER_EXT
zip skunk_v5.zip skunk_v5.$TOP_SOLDER_EXT
zip skunk_v5.zip skunk_v5.$TOP_SILK_EXT
zip skunk_v5.zip skunk_v5.$DRILL_EXT
zip skunk_v5.zip skunk_v5.$BOARD_OUTLINE_EXT
