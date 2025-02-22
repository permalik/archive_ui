#!/bin/bash

echo "removing build.."
sudo rm -rf /var/www/tymalik/html/*
sudo rm -rf /var/www/tymalik/html/.*

echo "archive_ui: installing dependencies..."
pnpm i --force

echo "archive_ui: building application..."
pnpm build
