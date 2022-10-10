#!/bin/bash
# Go ot the src directory and set the flag in first git commit
# Read first argument as directory to phps, fail otherwise
[[ -z "$1" ]] && echo "No directory specified" &&  exit 1
[[ ! -d "$1" ]] && echo "Directory $1 does not exist" && exit 1

dest_dir="$( realpath "$1" )" # Get the absolute path of the directory
# Get this scrip'ts directory
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

FAKE_USERNAME="John Wick"
FAKE_MAIL="john@dragonsec.si"

echo "Script dir: $script_dir"
echo "Destination dir: $dest_dir"

update_secret () {
    cp "$script_dir/preset.php" "$dest_dir/secret.php"
    sed -i "s/<SECRET>/$1/g" "$dest_dir/secret.php"
    echo "Updated secret.php"
    echo "===="
    cat "$dest_dir/secret.php"
    echo
    echo "===="
}


cd "$dest_dir"

git config user.email "$FAKE_MAIL"
git config user.name "$FAKE_USERNAME"
git config core.longpaths true
git config core.autocrlf true

git checkout HEAD

# Set the flag with rebase
GIT_EDITOR="$script_dir/rebaseEditor.sh" git rebase -i --root

# Update the secret
update_secret "$FLAG"
git add .
git commit --amend --no-edit --author "$FAKE_USERNAME <$FAKE_MAIL>"
git rebase --continue
echo "Done first rebase"
git log --oneline 
git status

# Cover the secret 
update_secret "was here"
git add secret.php
git commit -m "Removed security vulnerability" --author "$FAKE_USERNAME <$FAKE_MAIL>"
git rebase --continue
echo "Done second rebase"
git status

git checkout main
