#!/usr/bin/awk -f
# This script calculates the observed agreement.
#
# Usage:
# $ awk -f p_observed.awk FILENAME
# 
# Variables
#    FILENAME: CSV file with input table   
#
# Test
# $ awk -f p_observed.awk test.csv
# 0.378022
# 
#
# Changelog 
# 1.1
# - Added option to get observed agreement printed 
#   by line: Add '-v byline=1' to the command line
#
# 1.0
# - Initial version



{
	raters=0
	row=0
	for (i = 1; i <= NF; i++) {
        row += ($i*$i)-$i;
		colsums[i]+=$i;
		raters += $i
	}
	if (length(n)==0) {
		n = raters
	}
	agr = 1/(n*(n-1)) * row
	if (byline) {
		print agr
	}
	rowsum += agr
	rows++
}

END {
	p = rowsum/NR
	print p
}