Customer:	James Jones
Part number:  	skunk
Revision:	%REVISION%

Table of Contents:

1) File Manifest
2) PCB Requirements

1) List of files in skunk_%REVISION%.zip:

	skunk_v%REVISION%.%TOP_COPPER_EXT% - Gerber/RS274X format top copper layer (component side/layer 1)
	skunk_v%REVISION%.%TOP_SILK_EXT% - Gerber/RS274X format top silk screen (component side)
	skunk_v%REVISION%.%TOP_SOLDER_EXT% - Gerber/RS274X format top solder mask (component side)
	skunk_v%REVISION%.%TOP_PASTE_EXT% - Gerber/RS274X format top solder paste (component side)

	skunk_v%REVISION%.%INNER_1_EXT% - Gerber/RS274X format inner layer 1 (GND/layer 2)
	skunk_v%REVISION%.%INNER_2_EXT% - Gerber/RS274X format inner layer 2 (VCC/layer 3)

	skunk_v%REVISION%.%BOTTOM_COPPER_EXT% - Gerber/RS274X format bottom copper layer (secondary side/layer 4)
	skunk_v%REVISION%.%BOTTOM_SOLDER_EXT% - Gerber/RS274X format bottom solder mask (secondary side)
	skunk_v%REVISION%.%BOTTOM_SILK_EXT% - Gerber/RS274X format bottom silk screen (secondary side)

	skunk_v%REVISION%.%BOARD_OUTLINE_EXT% - Gerber/RS274X format board outline (for routing)

	skunk_v%REVISION%.%DRILL_EXT% - NC Drill File
		NOTE:  Specified drill sizes are for Finished/Plated Hole sizes
	
2) PCB Requirements

	Min copper line/space:	0.2mm/0.2mm	(7.875mil)
	Min copper thickness:	0.5 ounce outer layers, 1 ounce inner layers

	Finished hole sizes:	0.010", 0.020", 0.039", 0.090", .0906"

        Total hole count:	163

	Board stack-up:		4 layer, .062" thick, standard construction

	Board size:		94mm x 37.5 mm (3.702" x 1.476")
				NOTE:  See skunk_v%REVISION%.%BOARD_OUTLINE_EXT% for outline

	Board finish:		ENIG

	Finger size:		82mm x 7.62mm / 624mm^2 (3.228" x 0.3" / 0.9684 in^2)

	Finger finish:		Hard Gold (30u") with 30 degree bevel
				NOTE:  DO NOT USE TIE-BAR EDGE PLATING
