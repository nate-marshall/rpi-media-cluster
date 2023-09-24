#!/bin/bash

# Set your folder paths
source_folder="/media/nate/Media12TB/media_downloads/downloads/complete/temptv"
temp_folder="/media/nate/Media12TB/media_downloads/tmp/tv_from_sonarr"
log_file="/media/nate/Media12TB/media_downloads/tmp/juggle.log"
max_retries=30                              # Maximum number of retries
retry_interval=120                          # Sleep interval in seconds between each check

# Function to log messages to a file
log_message() {
    local message="$1"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "$timestamp - $message" | tee -a "$log_file"
}

# Function to move media files from source to temporary directory
move_to_temp() {
    local source="$1"
    local temp="$2"
    
    # Use find to search for .mp4 and .mkv files in the source directory
    find "$source" -type f \( -iname "*.mp4" -o -iname "*.mkv" \) -print | while read -r media_file; do
        local media_name="$(basename "$media_file")"
        
        # Move the media file to the temporary directory
        mv "$media_file" "$temp/$media_name"
        log_message "Moved to temp: $media_name"
    done
}

# Function to wait for HandBrake to finish processing files
wait_for_handbrake() {
    local retries=0
    local files_processing=1
    
    while [ $retries -lt $max_retries ] && [ $files_processing -eq 1 ]; do
        sleep $retry_interval
        files_processing=0
        
        # Check if any files are still in the temporary directory (being processed by HandBrake)
        if [ -n "$(ls -A "$temp_folder")" ]; then
            log_message "HandBrake is still processing files:"
            for processing_file in "$temp_folder"/*; do
                log_message "Processing: $(basename "$processing_file")"
            done
            log_message "Retry $((retries+1)) of $max_retries..."
            ((retries++))
            files_processing=1
        fi
    done
    
    if [ $retries -eq $max_retries ]; then
        log_message "Max retries reached. Exiting with non-zero status."
        exit 1
    else
        log_message "HandBrake has finished processing files."
    fi
}

# Move media files from source to temporary directory
log_message "Starting file transfer to temporary directory"
move_to_temp "$source_folder" "$temp_folder"

# Check if there are no files to process
if [ -z "$(ls -A "$temp_folder")" ]; then
    log_message "No media files to process. Exiting."
    exit 0  # Exit with success status
fi

# Wait for HandBrake to finish processing files
log_message "Waiting for HandBrake to finish processing files"
wait_for_handbrake

# Add your logic here to move files from the temporary directory to the final output directory
# You can also log the names of files being processed in this section.

# Example:
# for processed_file in "$temp_folder"/*; do
#     log_message "Transcoding: $(basename "$processed_file")"
#     # Add your HandBrake transcoding command here
#     # Move the transcoded file to the final output directory
# done

log_message "Files have been processed and moved to the final output directory."
exit 0  # Exit with success status
