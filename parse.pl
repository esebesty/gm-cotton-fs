#!/usr/bin/env perl

use strict;
use warnings;

my $columns = 16;   # 16 columns in pdftotext converted txt file
my $lines   = 1431; # data lines
my $counter = 0;
my %data    = ();

while (<STDIN>) {
	chomp;
	if (/^$/) { next }
	my @line = split;
	$counter++;
	push @{ $data{$counter} }, @line;
	if ($columns == $counter) { $counter = 0 }
}

for my $i (0..$lines) {
	my @newline = ();
	foreach my $key (sort {$a <=> $b} keys %data) {
		my $data = @{ $data{$key} }[$i];
		push @newline, $data;
	}
	my $newline = join("\t",@newline);
	print "$newline\n";
}
