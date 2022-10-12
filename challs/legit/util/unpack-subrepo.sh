#!/bin/sh
# Path: hooks\pre_commit_zip.sh

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
echo "Script dir: $script_dir"

# unzip html.zip to html directory
unzip -o "$script_dir/html.zip" -d "$script_dir/html" 
