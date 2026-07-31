#!/bin/bash
noaaToken=yBfEYSwhsUSNjUeZhTorLqdgYIXvfqkW

updateInterval=86400 #update values from the api once per day
secondsPerWeek=604800 
secondsPerDay=86400
count=0

update() {
  local json=$(curl -s https://api.climateclock.world/v2/clock.json)
  echo $(jq -r .data.modules.carbon_deadline_1.timestamp <<< "$json")
  echo $(date -d "$deadline" +%s)

  echo $(jq -r .data.modules.carbon_deadline_1.description <<< "$json")
  # jq -r .data.modules.renewables_1.description <<< "$json"
  # echo "timestamp"
  # jq -r .data.modules.renewables_1.timestamp <<< "$json"
  # echo "initial"
  # jq -r .data.modules.renewables_1.initial <<< "$json"
  # echo "growth"
  # jq -r .data.modules.renewables_1.growth <<< "$json"
  # echo "resolution"
  # jq -r .data.modules.renewables_1.resolution <<< "$json"
  # echo "rate"
  # jq -r .data.modules.renewables_1.rate <<< "$json" 

}
update

# while [ 1 ]#move this section to c to make things easier
# do
#   sleep 1
#   ((count ++))
#   dateS=$(date +%s)
#   weeks=$(((deadlineS-dateS)/secondsPerWeek))
  
#   secondsRemWeek=$(((deadlineS-dateS)%secondsPerWeek))
#   daysRem=$((seoncdsRemWeek/secondsPerDay))

#   secondsRemDay=$((secondsRemWeek%secondsPerDay))
  
#   #=$(((deadlineS-dateS)/secondsPerWeek))
#   echo $labelDeadline
#   echo $weeks
#   echo $daysRem
#   echo $secondsRemDay
#   echo ""
#   echo $secondsRemWeek
#   if ((count >= updateInterval)); then
#     update
#     count=0
#   fi
# done
