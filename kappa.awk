
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