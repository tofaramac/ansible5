#!/bin/bash

# declare the output file for logging
OUTPUT=$HOME/unison.log

# header to print each time we sync
echo "*****************************************************" >> $OUTPUT
echo "STARTING UNISON SYNC AT $(date)" >> $OUTPUT
echo "*****************************************************" >> $OUTPUT
echo "" >> $OUTPUT

# a list Unison profiles to sync (must already be created in Unison)
declare -a PROFILES=(prd-ppm-clr-0 prd-ppm-clr-1 prd-ppm-clr-2 prd-ppm-clr-3 default)

# loop through the profiles
for p in ${PROFILES[@]}; do
	echo "***ABOUT TO SYNC $p***" >> $OUTPUT
	# run the sync and concat all standard output and errors to the output file
	unison -auto -batch -ui text $p >> $OUTPUT 2>&1
	echo "" >> $OUTPUT
done 

# say we're done
echo "*****FINISHED AT $(date)*****"   >> $OUTPUT
echo ""   >> $OUTPUT

