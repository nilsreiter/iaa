# This script calculates Fleiss' Kappa, as described on 
# http://en.wikipedia.org/wiki/Fleiss'_kappa
#
# Usage:
# $ awk -v n=N -f kappa.awk FILENAME
# 
# Variables
#    N: Number of raters
#    FILENAME: CSV file with input table   
#
# Test
# $ awk -v n=14 -f kappa.awk test.csv
# 0.209931
# 

{
	row=0
	for (i = 1; i <= NF; i++) {
        row += ($i*$i)-$i;
		colsums[i]+=$i;
	}
	rowsum += 1/(n*(n-1)) * row
	rows++
}

END {
	p = rowsum/NR
	p_e = 0
	for (i in colsums) {
		colsums[i] = colsums[i]/(NR*n)
		p_e +=  colsums[i]*colsums[i]
	}
	#print p_e
	print (p-p_e)/(1-p_e)
}