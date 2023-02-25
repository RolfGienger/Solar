#!/usr/bin/bash
# @(#) $Revision: 1.00 $
#
# Zweck     : Konvertierung aller Einstrahlungsdateien mit 3 unterschiedlichen Maximalleistungen
#
# Aufruf    :konvertierung.sh
#
# Parameter    :
#
#
# Autor    : Rolf Gienger
# Datum    : 25.02.2023
#
# Aenderungsindex
#
# Version    Datum        Name    Aenderung
# 1.0        25.02.2023   Gienger Erstellung
#
#

cat ../Daten/2005/2005.log.extract | ./konvertierung_in_leistung.pl --pmax=600 > ../Daten/2005/2005_600kw.csv
cat ../Daten/2005/2005.log.extract | ./konvertierung_in_leistung.pl --pmax=800 > ../Daten/2005/2005_800kw.csv
cat ../Daten/2005/2005.log.extract | ./konvertierung_in_leistung.pl --pmax=1000 > ../Daten/2005/2005_1000kw.csv

cat ../Daten/2006/2006.log.extract | ./konvertierung_in_leistung.pl --pmax=600 > ../Daten/2006/2006_600kw.csv
cat ../Daten/2006/2006.log.extract | ./konvertierung_in_leistung.pl --pmax=800 > ../Daten/2006/2006_800kw.csv
cat ../Daten/2006/2006.log.extract | ./konvertierung_in_leistung.pl --pmax=1000 > ../Daten/2006/2006_1000kw.csv

cat ../Daten/2007/2007.log.extract | ./konvertierung_in_leistung.pl --pmax=600 > ../Daten/2007/2007_600kw.csv
cat ../Daten/2007/2007.log.extract | ./konvertierung_in_leistung.pl --pmax=800 > ../Daten/2007/2007_800kw.csv
cat ../Daten/2007/2007.log.extract | ./konvertierung_in_leistung.pl --pmax=1000 > ../Daten/2007/2007_1000kw.csv

