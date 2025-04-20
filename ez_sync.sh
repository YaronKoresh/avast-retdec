#!/bin/bash

cd -- "$(dirname "$0")"

echo 
echo Easily sync your GitHub local and remote code
echo 
echo You should locate it inside your repository root folder
echo 
echo Author: Yaron Koresh
echo 

read -p "Your Github email address: " email
read -p "Your Github username: " name

conflicts () {
	git add --all .
	git rebase --continue || conflicts
	read -n 1 -p "Please fix the conflicts, then, press any key to continue" tmp
}

git config --global user.email "%email%"
git config --global user.name "%name%"
git lfs update --force
git lfs install
git fetch
git checkout
git lfs track "*"
git add .gitattributes
git add --all .
git commit -m "commit"
( git rebase ) || (
	conflicts
)
( git push ) && ( read -n 1 -p "Finished." tmp ) || ( read -n 1 -p "Error: Failed to push!" tmp )