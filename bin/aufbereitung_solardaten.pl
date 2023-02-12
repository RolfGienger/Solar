#!/usr/bin/perl -w
# @(#) $Revision: 1.00 $
#
# Zweck     : AUfbereitung von Loggingdaten der Solaranlage
#
# Aufruf    : einspeisung.pl
#
# Parameter    :
#
#
# Autor    : Rolf Gienger
# Datum    : 12.02.2023
#
# Aenderungsindex
#
# Version    Datum        Name    Aenderung
# 1.0        12.02.2023   Gienger Erstellung
#
#

# Lesen der aktuellen Temperaturen
use strict;
use Time::Local;


my $timefromfile = "";
my $value = "";
my $utcfromfile = "";
my $time = 0;
my $line = 0;
my $mday = "";
my $mon = "";
my $year = "";
my $hour = "";
my $min = "";
my $sec = "";
my $wday = "";
my $yday = "";
my $isdst = "";



while (<>) {
	chomp();
	($timefromfile, $value) = split(/;/);
	$line = $_;
	($mday, $mon, $year, $hour, $min, $sec) = split(/[. :]/, $timefromfile);
	$utcfromfile = timelocal( $sec, $min, $hour, $mday, $mon-1, $year );

	if ($time != 0) {
		while ($utcfromfile > $time) {
			($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($time);
			$mday = zweistellig($mday);
			$mon = $mon + 1;
			$mon = zweistellig($mon);
			$year = $year + 1900;
			$hour = zweistellig($hour);
			$min = zweistellig($min);
			$sec = zweistellig($sec);
			print("$mday.$mon.$year $hour:$min:$sec;-99.99\n");
			$time += 3600;
		}
	} else {
		$time = $utcfromfile;
	}
	print("$line\n");
	$time += 3600;
}



# Unterprogramme
sub zweistellig {
	my $i = shift;

	if ($i < 10) {
		$i = "0" . "$i";
	}
	return($i);
}

