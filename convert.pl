#!/usr/bin/perl

# This script converts the output of a uniq -c command into a table to be read by Kappa.awk.
#
# Usage
# $ perl [-r R] [-c C] convert.pl FILENAME
# 
# Variables
#   R: The number of raters. If a class got more than R raters, 
#      R will be printed instead.
#   C: The number of classes.
#
# Changelog
# 2.0
#    Number of classes is counted from data. Can still be overwritten,
#    if some categories never appear.
# 1.0
#    Initial release

use warnings;
use Getopt::Long;


my %data = ();
my $raters = 5;
my $classes = undef;

GetOptions(
	"raters=i" => \$raters,
	"classes=i" => \$classes
) or die("Error in command line arguments\n");

my %cl = ();

while(<>) {
	chomp;
	my @line = split;
	$data{$line[1]}{$line[2]} = ($line[0]>$raters?$raters:$line[0]);
	$cl{$line[2]} = 1;
}

if (!defined $classes) {
	$classes = scalar(keys %cl);
};

foreach my $key (keys %data) {
	#print $key;
	#print "\t";
	for ($i = 0; $i < $classes; $i++) {
		if (defined $data{$key}{$i}) {
			print $data{$key}{$i};
		} else {
			print "0";
		}
		print "\t";
	}
	print "\n";
}