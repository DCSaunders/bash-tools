#!/usr/bin/perl
use strict;

my $f_name = $ARGV[0];
open(my $in, "<", $f_name) 
    or die "$f_name not openable";
my ($bleu, $ug, $bg, $tg, $fg, $bp);

while (<$in>)
{
    chomp;
    my $line = $_;
    ($bleu, $ug, $bg, $tg, $fg, $bp) = ($line =~ /BLEU\s=\s(\d\d\.\d\d),\s(\d\d\.\d)\/(\d\d\.\d)\/(\d\d\.\d)\/(\d\d\.\d)\s\(BP=(\d\.\d\d\d)/);
    if (length $bleu){
	print "$bleu, $ug, $bg, $tg, $fg, $bp\n";
    }
}
