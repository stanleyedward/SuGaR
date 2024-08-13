#!/bin/bash

input_directory="$1"
fps="${2:-3}"
# Find the video file (.mp4 or .mov) in the input directory
input_video=$(find "$input_directory" -maxdepth 1 -type f \( -name "*.mp4" -o -name "*.mov" \))

# Check if exactly one video file was found
if [ -z "$input_video" ]; then
    echo "No .mp4 or .mov file found in the input directory."
    exit 1
elif [ $(find "$input_directory" -maxdepth 1 -type f \( -name "*.mp4" -o -name "*.mov" \) | wc -l) -ne 1 ]; then
    echo "More than one .mp4 or .mov file found in the input directory. Please ensure only one video file is present."
    exit 1
fi

# Extract images from the video
mkdir $input_directory/images
ffmpeg -i "$input_video" -qscale:v 1 -qmin 1 -vf fps=$fps $input_directory/images/image_%04d.jpg

# Check if extraction was successful
if [ $? -eq 0 ]; then
    echo "Extraction successful. Removing original video."
    rm "$input_video"     
else
    echo "Extraction failed. Original video not removed."
fi


bash colmap_and_resize.sh inputs/