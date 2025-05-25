#!/bin/bash

source $HOME/.bashrc

> /home/tmalik/git/nohup.archive_deploy.out

echo "✅ARCHIVE_DEPLOY: executing archive_archive.."
echo "---------------------------------------------------------------------"
cd /home/tmalik/git/archive_utility/cmd/archive
./start.sh

printf "\n\n"
echo "✅ARCHIVE_DEPLOY: killing archive_api.."
echo "---------------------------------------------------------------------"
ARCHIVE_API_PROCESS_NAME="./api"
PID=$(pgrep -f "$ARCHIVE_API_PROCESS_NAME")

if [ -n "$PID" ]; then
    echo "stopping archive_api process with PID: $PID"
    kill -9 "$PID"
else
    echo "process not found"
fi

printf "\n\n"
echo "✅ARCHIVE_DEPLOY: executing archive_api.."
echo "---------------------------------------------------------------------"
cd /home/tmalik/git/archive_utility/cmd/api
nohup ./start.sh > /home/tmalik/git/nohup.archive_api.out 2>&1 & disown

printf "\n\n"
echo "✅ARCHIVE_DEPLOY: executing archive_resume.."
echo "---------------------------------------------------------------------"
cd /home/tmalik/git/archive_resume
./start.sh

printf "\n\n"
echo "✅ARCHIVE_DEPLOY: executing archive_ui.."
echo "---------------------------------------------------------------------"
cd /home/tmalik/git/archive_ui
./start.sh

printf "\n\n"
echo "✅ARCHIVE_DEPLOY: restarting nginx.."
echo "---------------------------------------------------------------------"
sudo systemctl restart nginx

printf "\n\n"
echo "✅ARCHIVE_DEPLOY: executing archive_gmail.."
echo "---------------------------------------------------------------------"
cd /home/tmalik/git/archive_utility/cmd/gmail
./start.sh
