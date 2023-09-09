#!/bin/bash

sabnzbd_complete_folder="/media/nate/Media12TB/media_downloads/downloads/complete/temptv"
handbrake_watch_folder="/media/nate/Media12TB/media_downloads/tmp/tv_from_sonarr"

# Function to move files from source to destination using rsync
move_files() {
    source_folder="$1"
    destination_folder="$2"
    for download_dir in "$source_folder"/*; do
        [ -d "$download_dir" ] || continue  # Check if it's a directory
        download_name="$(basename "$download_dir")"
        rsync -a --remove-source-files "$download_dir/" "$destination_folder/$download_name/"
        echo "Moved: $download_name"
        sleep 5
    done
}

# Function to cleanup the HandBrake output folder
cleanup_handbrake() {
    rm -rf "$handbrake_output_folder"/*
    echo "Cleaned up HandBrake output folder"
}

# Move files from SABnzbd to HandBrake
move_files "$sabnzbd_complete_folder" "$handbrake_watch_folder"

# Cleanup the HandBrake output folder
cleanup_handbrake