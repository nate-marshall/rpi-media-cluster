#!/bin/bash

# Set your folder paths
sabnzbd_complete_folder="/media/nate/Media12TB/media_downloads/downloads/complete/temptv"
handbrake_watch_folder="/media/nate/Media12TB/media_downloads/tmp/tv_from_sonarr"
log_file="/media/nate/Media12TB/media_downloads/tmp/juggle.log"  # Specify the path to your log file
max_retries=10  # Maximum number of retries
retry_interval=60  # Sleep interval in seconds between each check

# Function to log messages to a file
log_message() {
    local message="$1"
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $message" | tee -a "$log_file"
}

# Function to move files from source to destination using rsync
move_files() {
    source_folder="$1"
    destination_folder="$2"
    for download_dir in "$source_folder"/*; do
        [ -d "$download_dir" ] || continue  # Check if it's a directory
        download_name="$(basename "$download_dir")"

        # Check if the folder starts with "_UNPACK_"
        if [[ "$download_name" == _UNPACK_* ]]; then
            log_message "Ignoring folder: $download_name"
            continue
        fi

        rsync -a --remove-source-files "$download_dir/" "$destination_folder/$download_name/" | tee -a "$log_file"
        log_message "Moved: $download_name"
        sleep 5
    done
}

# Function to cleanup the HandBrake watch folder
cleanup_handbrake() {
    rm -rf "$handbrake_watch_folder"/*
    log_message "Cleaned up HandBrake watch folder"
}

# Function to wait for HandBrake to finish transcoding
wait_for_handbrake() {
    local retries=0
    while [ "$retries" -lt "$max_retries" ]; do
        if [ "$(ls -A "$handbrake_watch_folder")" ]; then
            log_message "HandBrake is still transcoding. Retry $((retries+1)) of $max_retries..."
            sleep "$retry_interval"
            ((retries++))
        else
            log_message "HandBrake has finished transcoding."
            break
        fi
    done
    if [ "$retries" -eq "$max_retries" ]; then
        log_message "Max retries reached. Exiting without waiting further."
    fi
}

# Move files from SABnzbd to HandBrake
log_message "Starting file transfer from SABnzbd to HandBrake"
move_files "$sabnzbd_complete_folder" "$handbrake_watch_folder"

# Wait for HandBrake to finish transcoding
log_message "Waiting for HandBrake to finish transcoding"
wait_for_handbrake

# Cleanup the HandBrake watch folder
log_message "Starting cleanup of HandBrake watch folder"
cleanup_handbrake
