#!/usr/bin/env bash
seq 500 | parallel --max-args 0  --jobs 20 "curl -k -iF 'vote=Dogs' https://skyisthelimit.university-of-common-sense.space" > test_file
sed '/ 504 Gateway Time-out/I,+2 d' test_file > test_charge
grep "^Date" test_charge > date
grep "^X-HAN" test_charge > handle
sed -e "s/GMT//g" -i date
sed -e "s/Date://g" -i date
date -f date +%s > date2
awk '{ if(NR == 1) { shift = $1 } print ($1 - shift) " " $2 }' date2 > date3
sed -e "s/X-HANDLED-BY://g" -i handle
paste -d, date3 handle > total
sed -e "s/ //g" -i total
mv total total.csv
sudo Rscript test_charge.r