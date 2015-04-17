# This script calculates Fleiss' Kappa, as described on 
# http://en.wikipedia.org/wiki/Fleiss'_kappa
#
# Usage:
# $ awk -f kappa.awk FILENAME
# 
# Variables
#    FILENAME: CSV file with input table   
#
# Test
# $ awk -f kappa.awk test.csv
# 0.209931
# 
#
# Changelog 
# 2.0
# - Number of raters is counted in the first row, we no longer need to specify it.
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
	rowsum += 1/(n*(n-1)) * row
	rows++
}

END {
	p = rowsum/NR
	print p
}