#!/usr/bin/env sh
npm cache clean --force
yarn cache clean
nvm cache clear
npx cypress cache clear

brew cleanup
sudo rm -rfv /Volumes/*/.Trashes
rm -rfv ~/.Trash/*
rm -rf ~/.m2/repository/
rm -rf node_modules

