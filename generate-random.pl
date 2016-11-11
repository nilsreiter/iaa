#!/usr/bin/perl

use warnings;

my ($categories,$raters,$items) = @ARGV;

if (! defined $categories) {
	$categories = 2;
}

if (! defined $raters) {
	$raters = 10;
}

if (! defined $items) {
	$items = 100;
}
for (my $i = 0; $i < $items; $i++) {
	my %dec = ();
	for (my $c = 0; $c < $categories; $c++) {
		$dec[$c] = 0;
	}
	
	for (my $r = 0; $r < $raters; $r++) {
		$dec[int(rand($categories))]++;
	}
	
	for (my $c = 0; $c < $categories; $c++) {
		print $dec[$c] or 0;
		print "\t";
	}
	print "\n";
}