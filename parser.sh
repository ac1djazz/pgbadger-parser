#!/bin/bash
yesterday=$(date -d "1 day ago" '+%Y-%m-%d')
user="<user>"
ip="<IP_POSTGRES_SERVER>"
log_folder="<FOLDER_PG_LOG>"
parser_folder="<PARSER_FOLDER>"
local_logs="$parser_folder/logs"
web_logs="$parser_folder/web/$yesterday"

# Take logs files from server
rsync -avz ${user}@${ip}:${log_folder}/*${yesterday}*.log ${local_logs}/
mkdir ${web_logs}
cd ${local_logs}

# Generate reports for each hour
for i in {0..23}; do
    start_hour=$(printf "%02d" $i)
    end_hour=$(printf "%02d" $((i+1)))
    start_time="${yesterday} ${start_hour}:00:00"
    end_time="${yesterday} ${end_hour}:00:00"
    output_file="${yesterday}-${start_hour}-00_${end_hour}-00.html"

    pgbadger -j 16 -t 100 -b "${start_time}" -e "${end_time}" *.log -o ${output_file}
done

# Generate an overall report
pgbadger -j 16 -t 100 *.log -o ${yesterday}-all.html

# Archive log files
tar cvfz posgresql-${yesterday}-log.tar.gz *.log
rm *.log

# Move report files to web directory
mv * ${web_logs}