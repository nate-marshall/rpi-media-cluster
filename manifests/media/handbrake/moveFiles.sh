#!/bin/bash

# Set your folder paths
source_folder="/media/nate/Media12TB/media_downloads/downloads/complete/temptv"
temp_folder="/media/nate/Media12TB/media_downloads/tmp/tv_from_sonarr"
processed_file_list="/media/nate/Media12TB/media_downloads/tmp/sonarr_processed_files.txt"
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
    
    # Use find to search for .mp4 and .mkv files in the source directory and its subdirectories
    find "$source" -type f \( -iname "*.mp4" -o -iname "*.mkv" \) -print | while read -r media_file; do
        local media_name="$(basename "$media_file")"
        local media_relative_path="${media_file#$source/}"  # Get the relative path from the source directory
        
        # Remove spaces from the filename
        local sanitized_media_name="${media_name// /_}"
        
        # Create the corresponding subdirectory structure in the temporary directory
        local temp_media_dir="$temp/$(dirname "$media_relative_path")"
        mkdir -p "$temp_media_dir"
        
        # Move the media file to the temporary directory while preserving the subdirectory structure
        mv "$media_file" "$temp_media_dir/$sanitized_media_name"
        log_message "Moved from: $media_file to: $temp_media_dir/$sanitized_media_name"
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
                local processing_name="$(basename "$processing_file")"
                log_message "Processing: $processing_name"
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

# Update the processed file list
for processed_file in "$temp_folder"/*; do
    local file_name="$(basename "$processed_file")"
    local file_path="$temp_folder/$file_name"
    echo "$file_path" >> "$processed_file_list"
done

log_message "Files have been processed and moved to the final output directory."
