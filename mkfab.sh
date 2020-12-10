#!/bin/sh
WORKDIR="`dirname $0`"
WORKDIR="`readlink -f "$WORKDIR"`"

# Edit this if you bump the board version number!
REVISION=5

BOTTOM_SILK_EXT=ssb
BOTTOM_SOLDER_EXT=smb
BOTTOM_COPPER_EXT=bot
INNER_2_EXT=in2
INNER_1_EXT=in1
TOP_COPPER_EXT=top
TOP_SOLDER_EXT=smt
TOP_PASTE_EXT=spt
TOP_SILK_EXT=sst
DRILL_EXT=tap
BOARD_OUTLINE_EXT=fab

BOTTOM_SILK_SRC=../releases/back_silk_v$REVISION-svg2shenzen_kicad.gbr

while [ $# -gt 0 ]; do
	if [ x"$1" = x"--osh" ]; then
		echo "Using OSH PARK layer naming scheme"
		BOTTOM_SILK_EXT=gbo
		BOTTOM_SOLDER_EXT=gbs
		BOTTOM_COPPER_EXT=gbl
		INNER_2_EXT=g3l
		INNER_1_EXT=g2l
		TOP_COPPER_EXT=gtl
		TOP_SOLDER_EXT=gts
		TOP_PASTE_EXT=gtp
		TOP_SILK_EXT=gto
		DRILL_EXT=xln
		BOARD_OUTLINE_EXT=gko
	elif [ x"$1" = x"--elecrow" ]; then
		echo "Using Elecrow layer naming scheme"
		BOTTOM_SILK_EXT=gbo
		BOTTOM_SOLDER_EXT=gbs
		BOTTOM_COPPER_EXT=gbl
		INNER_2_EXT=g2
		INNER_1_EXT=g1
		TOP_COPPER_EXT=gtl
		TOP_SOLDER_EXT=gts
		TOP_PASTE_EXT=gtp
		TOP_SILK_EXT=gto
		DRILL_EXT=txt
		BOARD_OUTLINE_EXT=gml
	elif [ x"$1" = x"--kicad" ]; then
		echo "Using KiCad layer naming scheme"
		BOTTOM_SILK_EXT=gbo
		BOTTOM_SOLDER_EXT=gbs
		BOTTOM_COPPER_EXT=gbl
		INNER_2_EXT=g2
		INNER_1_EXT=g1
		TOP_COPPER_EXT=gtl
		TOP_SOLDER_EXT=gts
		TOP_PASTE_EXT=gtp
		TOP_SILK_EXT=gto
		DRILL_EXT=drl
		BOARD_OUTLINE_EXT=gm1
	elif [ x"$1" = x"--fab3000" ]; then
		BOTTOM_SILK_SRC=../releases/back_silk_v$REVISION-fab3000.gbr
	else
		echo "Invalid parameter: $1"
		echo "Usage: mkfab.sh [--osh] [--fab3000]"
		echo ""
		echo "  --osh: Use OSH PARK gerber file name extension scheme"
		echo "  --fab3000: Use the fab3000 back silkscreen instead of "
                echo "             the svg2shenzen + KiCad one"
		exit 1
	fi

	shift
done

echo "Using '`basename $BOTTOM_SILK_SRC`' as bottom silk screen layer"

mkdir -p "$WORKDIR/revision5"
cd "$WORKDIR/revision5"

sed -e "s/%REVISION%/$REVISION/" \
	-e "s/%BOTTOM_SILK_EXT%/$BOTTOM_SILK_EXT/" \
	-e "s/%BOTTOM_SOLDER_EXT%/$BOTTOM_SOLDER_EXT/" \
	-e "s/%BOTTOM_COPPER_EXT%/$BOTTOM_COPPER_EXT/" \
	-e "s/%INNER_2_EXT%/$INNER_2_EXT/" \
	-e "s/%INNER_1_EXT%/$INNER_1_EXT/" \
	-e "s/%TOP_COPPER_EXT%/$TOP_COPPER_EXT/" \
	-e "s/%TOP_SOLDER_EXT%/$TOP_SOLDER_EXT/" \
	-e "s/%TOP_PASTE_EXT%/$TOP_SOLDER_EXT/" \
	-e "s/%TOP_SILK_EXT%/$TOP_SILK_EXT/" \
	-e "s/%DRILL_EXT%/$DRILL_EXT/" \
	-e "s/%BOARD_OUTLINE_EXT%/$BOARD_OUTLINE_EXT/" \
	../readme.template.txt > readme.txt
	
cp "$BOTTOM_SILK_SRC" skunk_v$REVISION.$BOTTOM_SILK_EXT
cp ../CAM/bottom_solder_mask.grb skunk_v$REVISION.$BOTTOM_SOLDER_EXT
cp ../CAM/bottom_copper.grb skunk_v$REVISION.$BOTTOM_COPPER_EXT
cp ../CAM/inner_copper_2.grb skunk_v$REVISION.$INNER_2_EXT
cp ../CAM/inner_copper_1.grb skunk_v$REVISION.$INNER_1_EXT
cp ../CAM/top_copper.grb skunk_v$REVISION.$TOP_COPPER_EXT
cp ../CAM/top_solder_mask.grb skunk_v$REVISION.$TOP_SOLDER_EXT
cp ../CAM/top_paste_mask.grb skunk_v$REVISION.$TOP_PASTE_EXT
cp ../CAM/top_silk.grb skunk_v$REVISION.$TOP_SILK_EXT
cp ../CAM/drill_file.drl skunk_v$REVISION.$DRILL_EXT
cp ../CAM/board_outline.grb skunk_v$REVISION.$BOARD_OUTLINE_EXT
rm -f skunk_v$REVISION.zip
zip skunk_v$REVISION.zip skunk_v$REVISION.$BOTTOM_SILK_EXT
zip skunk_v$REVISION.zip skunk_v$REVISION.$BOTTOM_SOLDER_EXT
zip skunk_v$REVISION.zip skunk_v$REVISION.$BOTTOM_COPPER_EXT
zip skunk_v$REVISION.zip skunk_v$REVISION.$INNER_2_EXT
zip skunk_v$REVISION.zip skunk_v$REVISION.$INNER_1_EXT
zip skunk_v$REVISION.zip skunk_v$REVISION.$TOP_COPPER_EXT
zip skunk_v$REVISION.zip skunk_v$REVISION.$TOP_SOLDER_EXT
zip skunk_v$REVISION.zip skunk_v$REVISION.$TOP_PASTE_EXT
zip skunk_v$REVISION.zip skunk_v$REVISION.$TOP_SILK_EXT
zip skunk_v$REVISION.zip skunk_v$REVISION.$DRILL_EXT
zip skunk_v$REVISION.zip skunk_v$REVISION.$BOARD_OUTLINE_EXT
