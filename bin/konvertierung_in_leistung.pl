#!/usr/bin/perl -w
# @(#) $Revision: 1.00 $
#
# Zweck     : Konvertierung einer Eisntrahlungsdatei in einen Leistungsverlauf
#
# Aufruf    :konvertierung_in_leistung.pl
#
# Parameter    :
#
#
# Autor    : Rolf Gienger
# Datum    : 18.02.2023
#
# Aenderungsindex
#
# Version    Datum        Name    Aenderung
# 1.0        18.02.2023   Gienger Erstellung
#
#

# Lesen der aktuellen Temperaturen
use strict;
use Time::Local;
use Getopt::Long;



my $timefromfile = "";
my $value = "";
my $day = 1;
my $pmax = 0;
my $pout = 0;

# Einlesen der Maximalleistung des Solarfeldes
GetOptions("pmax=i" => \$pmax) or die("wrong options!\n");


print("Stunde;Leistung in kW\n");

while (<>) {
	chomp();
	($timefromfile, $value) = split(/;/);
	if ($value < 30) {
		print("$day;0.0\n");
	}
	if (($value >= 30) && ($value < 36)) {
		$pout = $pmax * 0.1;
		print("$day;$pout\n");
	}
	if (($value >= 36) && ($value < 42)) {
		$pout = $pmax * 0.2;
		print("$day;$pout\n");
	}
	if (($value >= 42) && ($value < 48)) {
		$pout = $pmax * 0.3;
		print("$day;$pout\n");
	}
	if (($value >= 48) && ($value < 54)) {
		$pout = $pmax * 0.4;
		print("$day;$pout\n");
	}
	if (($value >= 54) && ($value < 60)) {
		$pout = $pmax * 0.5;
		print("$day;$pout\n");
	}
	if (($value >= 60) && ($value < 66)) {
		$pout = $pmax * 0.6;
		print("$day;$pout\n");
	}
	if (($value >= 66) && ($value < 72)) {
		$pout = $pmax * 0.7;
		print("$day;$pout\n");
	}
	if (($value >= 72) && ($value < 78)) {
		$pout = $pmax * 0.8;
		print("$day;$pout\n");
	}
	if (($value >= 78) && ($value < 84)) {
		$pout = $pmax * 0.9;
		print("$day;$pout\n");
	}
	if ($value >= 84) {
		print("$day;$pmax\n");
	}
	$day++;
}


