#!/bin/bash

sabnzbd_complete_folder="/media/nate/Media12TB/media_downloads/downloads/complete/temptv"
handbrake_watch_folder="/media/nate/Media12TB/media_downloads/tmp/tv"

# Function to move files from source to destination
move_files() {
    source_folder="$1"
    destination_folder="$2"
    for filename in "$source_folder"/*; do
        [ -e "$filename" ] || continue  # Check if the file exists
        destination_file="$destination_folder/$(basename "$filename")"
        mv "$filename" "$destination_file"
        echo "Moved: $(basename "$filename")"
    done
}

# Move files from SABnzbd to HandBrake
move_files "$sabnzbd_complete_folder" "$handbrake_watch_folder"