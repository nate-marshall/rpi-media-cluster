#!/bin/bash

# Set your folder paths
sabnzbd_complete_folder="/media/nate/Media12TB/media_downloads/downloads/complete/temptv"
handbrake_watch_folder="/media/nate/Media12TB/media_downloads/tmp/tv_from_sonarr"
log_file="/media/nate/Media12TB/media_downloads/tmp/juggle.log"  # Specify the path to your log file
max_retries=30  # Maximum number of retries
retry_interval=120  # Sleep interval in seconds between each check

# Function to log messages to a file
log_message() {
    local message="$1"
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $message" | tee -a "$log_file"
}

# Function to move files from source to destination using rsync
move_next_directory() {
    source_folder="$1"
    destination_folder="$2"
    
    # Find the first available directory in the source folder
    for download_dir in "$source_folder"/*; do
        [ -d "$download_dir" ] || continue  # Check if it's a directory
        download_name="$(basename "$download_dir")"

        # Check if the folder starts with "_UNPACK_"
        if [[ "$download_name" == "_UNPACK_"* ]]; then
            log_message "Ignoring folder: $download_name"
            continue
        fi

        # Move the directory to the destination
        rsync -a --remove-source-files --exclude="_UNPACK_*" "$download_dir/" "$destination_folder/$download_name/" | tee -a "$log_file"
        log_message "Moved: ${destination_folder}/${download_name}"
        curl -X POST -H 'Content-Type: application/json' -d '{"text": "'"${destination_folder}/${download_name}"' download in progress..\n"}' "${CHAT_URL}"
        sleep 5
        return 0  # Return success
    done

    # No directories found in the source folder
    return 1  # Return failure
}

# Function to cleanup the HandBrake watch folder
cleanup_handbrake() {
    rm -rf "${handbrake_watch_folder:?}/"*
    log_message "Cleaned up HandBrake watch folder"
}

# Function to wait for HandBrake to finish transcoding
wait_for_handbrake() {
    local retries=0
    while [ "$retries" -lt "$max_retries" ]; do
        if [ "$(ls -A "$handbrake_watch_folder")" ]; then
            log_message "HandBrake is still transcoding ${destination_folder}/${download_name}. Retry $((retries+1)) of $max_retries..."
            sleep "$retry_interval"
            ((retries++))
        else
            log_message "HandBrake has finished transcoding ${destination_folder}/${download_name}."
            break
        fi
    done
    if [ "$retries" -eq "$max_retries" ]; then
        log_message "Max retries reached. Exiting with non-zero status."
        curl -X POST -H 'Content-Type: application/json' -d '{"text": "'"${destination_folder}/${download_name}"' failed to transcode in time. Max retries reached."}' "${CHAT_URL}"
    fi
}

# Move files from SABnzbd to HandBrake one directory at a time
log_message "Starting file transfer from SABnzbd to HandBrake. ${sabnzbd_complete_folder} -- ${handbrake_watch_folder}"
while move_next_directory "$sabnzbd_complete_folder" "$handbrake_watch_folder"; do
    :
done

# Wait for HandBrake to finish transcoding
log_message "Waiting for HandBrake to finish transcoding. ${destination_folder}/${download_name}"
wait_for_handbrake

# Cleanup the HandBrake watch folder
# log_message "Starting cleanup of HandBrake watch folder"
# cleanup_handbrake
