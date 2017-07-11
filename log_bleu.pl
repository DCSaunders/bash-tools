#!/usr/bin/perl
use strict;

my $f_name = $ARGV[0];
open(my $in, "<", $f_name) 
    or die "$f_name not openable";
my ($bleu, $ug, $bg, $tg, $fg, $bp);
my $last_step;
my $tmp_step;
my $best_bleu=0;
while (<$in>)
{
    chomp;
    my $line = $_;
    ($tmp_step) = ($line =~ /Global\sstep=(\d+)/);
    if (length $tmp_step){
	$last_step = $tmp_step;
    }
    ($bleu, $ug, $bg, $tg, $fg, $bp) = ($line =~ /BLEU\s=\s(\d+\.\d\d),\s(\d+\.\d)\/(\d+\.\d)\/(\d+\.\d)\/(\d+\.\d)\s\(BP=(\d\.\d\d\d)/);
    if (length $bleu){
	if ($bleu > $best_bleu) {
	    print "newbest_";
	    $best_bleu = $bleu;
	}
	print "step_$last_step  $bleu, $ug, $bg, $tg, $fg, $bp\n";
    }
}
