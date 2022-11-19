#!/bin/bash
# usage:
# Check current kernel ./dirty-pipe-checker.sh
# Check other kernel ./dirty-pipe-checker 5.7.11
kernel=$1
major=$(echo ${kernel:-$(uname -r | cut -d '-' -f1)} | cut -d '.' -f1)
minor=$(echo ${kernel:-$(uname -r | cut -d '-' -f1)} | cut -d '.' -f2)
minor=$(echo ${kernel:-$(uname -r | cut -d '-' -f1)} | cut -d '.' -f3)
echo $major $minor $patch
if (( ${major:-0} < 5 )) ||
   (( ${major:-0} == 5 && ${minor:-0} < 8 )) ||
   (( ${major:-0} == 5 && ${minor:-0} == 10 && ${patch:-0} == 102 )) ||
   (( ${major:-0} == 5 && ${minor:-0} == 10 && ${patch:-0} == 92 )) ||
   (( ${major:-0} == 5 && ${minor:-0} == 15 && ${patch:-0} == 25 )) ||
   (( ${major:-0} == 5 && ${minor:-0} >= 16 && ${patch:-0} >= 11 )) ||
   (( ${major:-0} == 5 && ${minor:-0} > 16 ));
then
    echo Not vulnerable
    exit 0
else
    echo Vulnerable - patch now!
    exit 1
fi
