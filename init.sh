#!/usr/bin/bash

cd ~/Dropbox/.dotfiles
git init
git remote add origin https://github.com/tokisuno/.dotfiles
git config user.email "lucaswmei@gmail.com" && git config user.name "tokisuno"
git add .
git commit -m 'things'
git push -u origin main --force
