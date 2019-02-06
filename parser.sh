#!/bin/bash
yesterday=$(date -d "1 day ago" '+%Y-%m-%d')
# Take logs files from server
rsync -avz <user>@<IP POSTGRES SERVER>:<FOLDER PG_LOG>/*$yesterday*.log <PARSER_FOLDER>/logs/
mkdir <PARSER_FOLDER>/web/$yesterday
cd <PARSER_FOLDER>/logs/
pgbadger -j 16 -t 100 *.log -o $yesterday-all.html
pgbadger -j 16 -t 100 -b "$yesterday 00:00:00" -e "$yesterday 01:00:00"  *.log -o $yesterday-00-00_01-00.html
pgbadger -j 16 -t 100 -b "$yesterday 01:00:00" -e "$yesterday 02:00:00"  *.log -o $yesterday-01-00_02-00.html
pgbadger -j 16 -t 100 -b "$yesterday 02:00:00" -e "$yesterday 03:00:00"  *.log -o $yesterday-02-00_03-00.html
pgbadger -j 16 -t 100 -b "$yesterday 03:00:00" -e "$yesterday 04:00:00"  *.log -o $yesterday-03-00_04-00.html
pgbadger -j 16 -t 100 -b "$yesterday 04:00:00" -e "$yesterday 05:00:00"  *.log -o $yesterday-04-00_05-00.html
pgbadger -j 16 -t 100 -b "$yesterday 05:00:00" -e "$yesterday 06:00:00"  *.log -o $yesterday-05-00_06-00.html
pgbadger -j 16 -t 100 -b "$yesterday 06:00:00" -e "$yesterday 07:00:00"  *.log -o $yesterday-06-00_07-00.html
pgbadger -j 16 -t 100 -b "$yesterday 07:00:00" -e "$yesterday 08:00:00"  *.log -o $yesterday-07-00_08-00.html
pgbadger -j 16 -t 100 -b "$yesterday 08:00:00" -e "$yesterday 09:00:00"  *.log -o $yesterday-08-00_09-00.html
pgbadger -j 16 -t 100 -b "$yesterday 09:00:00" -e "$yesterday 10:00:00"  *.log -o $yesterday-09-00_10-00.html
pgbadger -j 16 -t 100 -b "$yesterday 10:00:00" -e "$yesterday 11:00:00"  *.log -o $yesterday-10-00_11-00.html
pgbadger -j 16 -t 100 -b "$yesterday 11:00:00" -e "$yesterday 12:00:00"  *.log -o $yesterday-11-00_12-00.html
pgbadger -j 16 -t 100 -b "$yesterday 12:00:00" -e "$yesterday 13:00:00"  *.log -o $yesterday-12-00_13-00.html
pgbadger -j 16 -t 100 -b "$yesterday 13:00:00" -e "$yesterday 14:00:00"  *.log -o $yesterday-13-00_14-00.html
pgbadger -j 16 -t 100 -b "$yesterday 14:00:00" -e "$yesterday 15:00:00"  *.log -o $yesterday-14-00_15-00.html
pgbadger -j 16 -t 100 -b "$yesterday 15:00:00" -e "$yesterday 16:00:00"  *.log -o $yesterday-15-00_16-00.html
pgbadger -j 16 -t 100 -b "$yesterday 16:00:00" -e "$yesterday 17:00:00"  *.log -o $yesterday-16-00_17-00.html
pgbadger -j 16 -t 100 -b "$yesterday 17:00:00" -e "$yesterday 18:00:00"  *.log -o $yesterday-17-00_18-00.html
pgbadger -j 16 -t 100 -b "$yesterday 18:00:00" -e "$yesterday 19:00:00"  *.log -o $yesterday-18-00_19-00.html
pgbadger -j 16 -t 100 -b "$yesterday 19:00:00" -e "$yesterday 20:00:00"  *.log -o $yesterday-19-00_20-00.html
pgbadger -j 16 -t 100 -b "$yesterday 20:00:00" -e "$yesterday 21:00:00"  *.log -o $yesterday-20-00_21-00.html
pgbadger -j 16 -t 100 -b "$yesterday 21:00:00" -e "$yesterday 22:00:00"  *.log -o $yesterday-21-00_22-00.html
pgbadger -j 16 -t 100 -b "$yesterday 22:00:00" -e "$yesterday 23:00:00"  *.log -o $yesterday-22-00_23-00.html
pgbadger -j 16 -t 100 -b "$yesterday 23:00:00" -e "$yesterday 23:59:59"  *.log -o $yesterday-23-00_24-00.html
# Archive log files 
tar cvfz posgresql-$yesterday-log.tar.gz *.log
rm *.log
cp * /data/postgres_logs/web/$yesterday
rm -rf *
