#!/usr/bin/env bash

#set -ex

. colors
source $MINER_DIR/$CUSTOM_MINER/h-manifest.conf

khs=0
stats=""
algo='aleo'

#stats_raw='{"ver":"1.0","algo":"aleo","hs_units":"cs","ar":[175,72],"hs":[3673.6],"total_hs":3673.6,"bus_numbers":[33],"fan":[41],"temp":[75],"uptime":66}'
stats_raw=`curl -s --connect-timeout 5 http://127.0.0.1:${MINER_REST_PORT}`
#echo "#debug: $stats_raw"
if [[ $? -ne 0 || -z $stats_raw ]]; then
  echo -e "${YELLOW}Failed to read stat from 127.0.0.1:${MINER_REST_PORT}"
else
  readarray -t arr < <(echo "$stats_raw" | jq -cr '.ver, .hs_units, .ar, .hs, .total_hs, .bus_numbers, .fan, .temp, .uptime ' 2>/dev/null)
#  echo "#debug: ${arr[@]}"
  version="${arr[0]}"
#  unit="${arr[1]}"
  ar="${arr[2]}"
  hs="${arr[3]}"
  khs="${arr[4]}"
  khs=$(printf "%.5f" `echo "scale=5;$khs/1000"|bc`)
  bus_numbers="${arr[5]}"
  fan="${arr[6]}"
  temp="${arr[7]}"
  uptime="${arr[8]}"



  # Example of `$stats` var
  #{
  #	"hs": [123, 223.3], //array of hashes
  #	"hs_units": "khs", //Optional: units that are uses for hashes array, "hs", "khs", "mhs", ... Default "khs".
  #	"temp": [60, 63], //array of miner temps
  #	"fan": [80, 100], //array of miner fans
  #	"uptime": 12313232, //seconds elapsed from miner stats
  #	"ver": "1.2.3.4-beta", //miner version currently run, parsed from it's api or manifest
  #	"ar": [123, 3], //Optional: acceped, rejected shares
  #	"algo": "customalgo", //Optional: algo used by miner, should one of the exiting in Hive
  #	"bus_numbers": [0, 1, 12, 13] //Pci buses array in decimal format. E.g. 0a:00.0 is 10
  #}

  stats=$(jq -nc --arg uptime "$uptime" \
                 --arg algo "$algo" \
                 --arg hs_units "hs" \
                 --arg khs "$khs" \
                 --arg ver "$version" \
                 --argjson temp "$temp" \
                 --argjson fan "$fan" \
                 --argjson bus_numbers "$bus_numbers" \
                 --argjson hs "$hs" \
                 --argjson ar "$ar" \
                 '{"total_khs": $khs|tonumber, $hs, $hs_units, "uptime":$uptime|tonumber|floor, $algo, $ar, $temp, $fan, $bus_numbers, $ver}')
#  stats='{"ver":"1.0","algo":"aleo","hs_units":"khs","ar":[175,72],"hs":[3673.6],"bus_numbers":[33],"fan":[41],"temp":[75],"uptime":66}'

    echo "$stats"
fi