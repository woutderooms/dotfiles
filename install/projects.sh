#!/usr/bin/env bash

mkdir -p ~/projects/personal ~/projects/work/websome ~/projects/work/napoleon-games

# Global
echo 'What is your git name (first name + last name)?'
IFS=
read gitName
echo $gitName
git config --global --replace-all user.name $gitName
echo 'What is your default git email?'
read defaultGitEmail
git config --global user.email $defaultGitEmail


# Personal
cd ~/projects/personal
echo 'What is your personal git email?'
read personalGitEmail
echo "[user]
	email = $personalGitEmail" > .gitconfig

# Websome
cd ~/projects/work/websome
echo 'What is your Websome git email?'
read websomeGitEmail
echo "[user]
	email = $websomeGitEmail" > .gitconfig

# Napoleon Games
cd ~/projects/work/napoleon-games
echo 'What is your Napoleon Games git email?'
read napoleonGamesGitEmail
echo "[user]
	email = $napoleonGamesGitEmail" > .gitconfig

cd ~