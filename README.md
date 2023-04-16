# PostgreSQL Log Analyzer

This script helps you analyze and archive PostgreSQL logs by generating hourly and daily HTML reports using `pgbadger`. The script first syncs log files from a remote server to a local folder, then generates reports for each hour of the previous day, and finally creates an overall daily report. The log files are archived and the reports are moved to a web-accessible folder.

## Requirements

- `rsync` for syncing log files from the remote server
- `pgbadger` for log analysis and report generation
- `tar` for archiving log files

## Configuration

Before using the script, you need to set the following variables at the beginning of the script:

- `user`: The username for connecting to the remote PostgreSQL server
- `ip`: The IP address of the remote PostgreSQL server
- `log_folder`: The path to the folder containing PostgreSQL logs on the remote server
- `parser_folder`: The path to the local folder where logs will be synced and reports will be generated

The folder structure should look like this:

parser_folder
├── logs
└── web

Make the script executable with the following command:

```bash
chmod +x parser.sh


Scheduling

crontab -e

10 0 * * * /path/to/parser.sh
