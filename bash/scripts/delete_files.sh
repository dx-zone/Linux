#!/usr/bin/env bash

# Description: Delete files listed as an array in a separate text/config file
# The script will look for a file defined in the CONFIG_FILE variable to load
# the list of files to be deleted, defined as an array
#
# Example: ./delete_files.sh
#
# Config File: file_list_2_delete.cfg
# FILES_TO_DELETE=(
#   "file1"
#   "file2"
#   "file3"
#   "/path/file4"
# )

# Make Bash exit immediately when a command fails (-e), execute error traps when
# a command fails (-E), treat unset variables as errors (-u), and exit when a
# a command in a pipe fails (-o pipefail)
set -Eeuo pipefail

# To write process id (pidfile) to ensure the script runs only once
PIDFILE="delete_files.pid"

# Format of the timestamp used for log output
LOG_DATE_FORMAT='%F %T'

# Array for the list of the files to delete, should be loaded from config file
FILES_TO_DELETE=()

# Config file with the array listing the files to delete
CONFIG_FILE="file_list_2_delete.cfg"

# Variable initialization, not for configuration
FAILED=()
SUCCESS=()
SUCCESS_COUNT=0
FAIL_COUNT=0

# Log a time stamped string and the process ID script to STDOUT
function log() {
  echo "$(date +"$LOG_DATE_FORMAT") $$ $1"
}

# Load variables from a file (CONFIG_FILE)
function load_config() {
  # Load config file from working dir if exist
  if [ ! -f "$CONFIG_FILE" ] && echo "The config file $PWD/$CONFIG_FILE is missing." || echo "The config file has been found: $PWD/$CONFIG_FILE"; then
    log "Loading the config file: $PWD/$CONFIG_FILE"
    source $CONFIG_FILE
  fi
}

# Check if a pidfile already exist and exit if it does
# or write a new one if it doesn't
function acquire_pidfile() {
  if [ -f "$PIDFILE" ]; then
    PID=$(cat $PIDFILE)
    log "The process is already running as PID $PID. PIDFILE: $PWD/$PIDFILE"
    exit 1
  fi

  log "Writing pidfile $PIDFILE"
  echo $$ >"$PIDFILE"

  # Read the pidfile back to make sure this process won in the event of a race.
  PID=$(cat $PIDFILE)
  if [ "$PID" != $$ ]; then
    log "File deletion process is already running as PID $PID"
    exit 1
  fi
}

# TODO: Fix bug, the function is loggin "Succesfully deleted the"... even when files to be deleted does not exist
# Log a summary
function log_results () {
  if [ $SUCCESS_COUNT -ne 0 ]; then
    log "Succesfully deleted the following files listed in the config file: $SUCCESS_COUNT"
    for FILE in "${SUCCESS[@]}"; do
      log "  $FILE"
    done
  fi
  if [ $FAIL_COUNT -ne 0 ]; then
    log "Failed to delete files listed in the config file: $FAIL_COUNT"
    for FILE in "${FAILED[@]}"; do
      log "  $FILE"
    done
  fi
}

# Remove the process id file (pidfile) at the end of the run, to be run at the exit (trap).
function delete_pidfile() {
  PID=$(cat $PIDFILE)
  if [ "$PID" = "$$" ]; then
    log "Removing $PIDFILE"
    rm $PIDFILE
  fi
}

# Log failures to a file log
function file_count_log() {
  DEST_COUNT="${#FILES_TO_DELETE[*]}"
  SUCCESS_COUNT="${#SUCCESS[*]}"
  FAIL_COUNT="${#FAILED[*]}"
  LOGFILE="deleted_files.log"
  echo "" > $LOGFILE
  if [ $SUCCESS_COUNT -ne $DEST_COUNT ]; then
    echo "Some files did not were deleted."
    echo "Check the log file for more details: $LOGFILE"
    echo "Files not deleted: $FAIL_COUNT" >> $LOGFILE
  else
    echo "From the $CONFIG_FILE, $SUCCESS_COUNT were deleted" >> $LOGFILE
  fi
}

# Delete files listed in the CONFIG file
function file_delete() {
  for FILE in "${FILES_TO_DELETE[@]}"; do
    if [[ -f "$FILE" ]] && echo "$FILE found." || echo "$FILE not found"; then
      log "Deleting file: $FILE"
      rm -rfv "$FILE"
      #echo "$FILE"
      if [[ ! -f "$FILE" ]]; then
        SUCCESS+=("$FILE")
        log "Could not delete the file. $FILE not found."
      else
        FAILED+=("$FILE")
      fi
    fi
  done
}

# Cleanup/delete the script file itself and the CONFIG file after after execution (remove the trace of the script/config)
function self_destruct() {
  echo "Deleting $0"
  rm -f "$0"
  echo "Deleting $CONFIG_FILE"
  rm -f "$CONFIG_FILE"
  echo "DONE!"
}

# Run cleanup function at exit
function cleanup() {
  log_results
  delete_pidfile
  self_destruct
}

# Starting to delete files
log "Starting to delete files (PID $$)"  # Prompt the starting of the process
load_config # Read/load config file variables
acquire_pidfile  # Create pid file to keep track of the job
file_delete  # Start deleting files listed in the array from config file
# file_count_log  # Count and log successes and failures to a file log

# Catch signals and execute code when they occur, in this case, EXIT
# the pseudo-signal "EXIT", will be caught by TRAP to execute the cleanup function at EXIT
# thus cleanup will get executed when the script exits
trap cleanup EXIT
