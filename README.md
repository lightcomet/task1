# Task 1

## Assumptions
1. Script to run periodically one-off configuration/rarely need changes, hence to be defined directly in script instead of a parameter.
2. Log file generated rotate on a hourly basis, for e.g. current  log file name will be "access.log" and 1hr ago log file name will be "access.log.20210809.11h00m.old".
3. Daily logs will be stored inside a folder for e.g. "20210809".
4. The log file parameter to call the script will be pointing to "access.log"
5. This script is to be run non-stop using nohup, unless server reboot or issues occured, manually kill by using "kill -9 <pid>".
6. Assumption that the daily log files are not zipped/compressed in any way and are stored on the server as is.
7. Assumption that the server running the scripts and generating logs is only used exclusively by the application for e.g. (apache)
8. Assumption that the error codes 4XX and 5XX are default error codes to look out for, hence to be defined directly in script instead of a parameter.
9. Bash script has the rightful owner and group permission, along with 0755 permissions.
10. Assumption system OS is CentOS/RHEL, and has postfix and mailx preinstalled.

## Task 1a 

1. To run the script, take note of path where script is stored and the path to the log file.
2. Run "nohup ./<full_path_to_bash_script> <path_to_log_fie> > /dev/null 2>&1&" for e.g. "nohup ./home/admin/Task1A.bash /opt/apache/logs/Task1.log > /dev/null 2>&1&"

## Task 1b
Zip the daily folder containing logs for e.g. (20210809.zip), automatically upload to AWS S3 cloud storage where lifecycle configuration is set to 
1. "Transition to S3 Standard-IA after : 90 days"
2. "Transition to S3 Glacier after : 180 days"
3. "Transition to S3 Glacier Deep Archive after : 1095 days"