#!/usr/bin/perl -w
use strict;

my $string = "01";
#my $regexp = qw/[0][12]${1}/;
if ($string =~ m/[0][12]${1}/) {
	print "done";
} else {
	print "error";
}
