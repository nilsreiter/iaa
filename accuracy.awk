#!/usr/bin/awk -f

#
# This script calculates accuracy, based on the output of convert.pl
# Accuracy is defined as
#   the number of ratings on the majority class divided by
#   the number of ratings overall   
# If the number of raters/item is even, the first class is picked as the "majority" 
# 
# Usage
# $ awk -f accuracy.awk FILENAME
# 
# Test
# $ awk -f accuracy.awk test-accuracy.tsv 
# 0.887861
#
#

{
	rowsum = 0;
	max = 0;
	for (i = 1; i <= NF; i++) {
        rowsum += $i;
        if ($i > max) {
        	max = $i;
        }
	}
	ratings += rowsum;
	goodratings += max;
}
END {
	print (goodratings/ratings);
}