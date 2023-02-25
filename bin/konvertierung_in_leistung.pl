#!/usr/bin/perl -w
# @(#) $Revision: 1.20 $
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
# 1.1        21.02.2023   Gienger dritte Spalte mit Nullwerten hinzu
# 1.2        25.02.2023   Gienger Schwellwert angehoben
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


print("Stunde;max. Leistung in kW; min. Leistung in kW\n");

while (<>) {
	chomp();
	($timefromfile, $value) = split(/;/);
	if ($value < 30) {
		print("$day;0.0;0.0\n");
	}
	if (($value >= 40) && ($value < 46)) {
		$pout = $pmax * 0.1;
		print("$day;$pout;0.0\n");
	}
	if (($value >= 46) && ($value < 52)) {
		$pout = $pmax * 0.2;
		print("$day;$pout;0.0\n");
	}
	if (($value >= 52) && ($value < 58)) {
		$pout = $pmax * 0.3;
		print("$day;$pout;0.0\n");
	}
	if (($value >= 58) && ($value < 64)) {
		$pout = $pmax * 0.4;
		print("$day;$pout;0.0\n");
	}
	if (($value >= 64) && ($value < 70)) {
		$pout = $pmax * 0.5;
		print("$day;$pout;0.0\n");
	}
	if (($value >= 70) && ($value < 76)) {
		$pout = $pmax * 0.6;
		print("$day;$pout;0.0\n");
	}
	if (($value >= 76) && ($value < 82)) {
		$pout = $pmax * 0.7;
		print("$day;$pout;0.0\n");
	}
	if (($value >= 82) && ($value < 88)) {
		$pout = $pmax * 0.8;
		print("$day;$pout;0.0\n");
	}
	if (($value >= 88) && ($value < 94)) {
		$pout = $pmax * 0.9;
		print("$day;$pout;0.0\n");
	}
	if ($value >= 94) {
		print("$day;$pmax;0.0\n");
	}
	$day++;
}


