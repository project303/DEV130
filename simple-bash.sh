#!/usr/bin/bash

# USER_NAME="Bob"
# USER_NAME=$(whoami)
USER_NAME=$1

echo "Apa kabar ${USER_NAME}?"

CURR_DATETIME=$(date +"%Y-%m-%d %H:%m:%S")
echo "$CURR_DATETIME  Processing file"

for i in {1..5}
do
   echo "1|2|3" > dataset-s0$i.csv
   echo "1|2|3" >> dataset-s0$i.csv
   echo "1|2|3" >> dataset-s0$i.csv
   echo "1|2|3" >> dataset-s0$i.csv
   if [[ $i -lt 4 ]]
   then
       echo "3|5|6" >> dataset-s0$i.csv
   elif [[ $i -eq 4 ]]
   then
       echo  "3|5|6" >> dataset-s0$i.csv
       echo  "3|5|6" >> dataset-s0$i.csv
       echo  "3|5|6" >> dataset-s0$i.csv
   else
       echo  "5|6|7" >> dataset-s0$i.csv
       echo  "3|5|6" >> dataset-s0$i.csv
   fi
done



for i in $(ls dataset-s*.csv)
do
   line_number=`wc -l ${i} | awk -F' ' '{print $1}'`
   echo "$(date +"%Y-%m-%d %H:%m:%S")  $i - number of line: $line_number"
done

echo "$(date +"%Y-%m-%d %H:%m:%S")  Processing done"
