#!/bin/bash

egrep ":00:[0-9]{2} " $1 | awk '{print $1 " " $2 ";" $17}' | perl -pe 's/:[0-9]{2};/:00;/' | ./aufbereitung_solardaten.pl > $1.extract


