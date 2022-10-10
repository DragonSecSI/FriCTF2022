#!/bin/sh
# Path: hooks\pre_commit_zip.sh

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
echo "Script dir: $script_dir"

# remove the old zip
rm "$script_dir/html.zip"

# zip the contents of html directory to html.zip
zip -r "$script_dir/html.zip" html/* html/\.git
