#!/bin/bash

# IP ВМ, которую надо обновить
INSTANCE_IP="51.250.80.118"
# путь к приватному ключу для входа на ВМ
SSH_KEY_PATH="yandex_private"
# имя пользователя ВМ
SSH_USER="inna-anikina"
# директория с приложением на ВМ
APP_DIR="/home/inna-anikina/guestbook"
# запускаемый файл приложения на ВМ
APP_SCRIPT="app.py"
# файл, содержащий pid процесса приложения для перезапуска
PID_FILE="$APP_DIR/app.pid"
# ссылка на репозиторий
REPO_URL="https://github.com/innaanikina/guestbook.git"

ssh -i $SSH_KEY_PATH $SSH_USER@$INSTANCE_IP <<-EOF
    PID_FILE="$PID_FILE"
    APP_ID="$APP_ID"
    APP_DIR="$APP_DIR"
    APP_SCRIPT="$APP_SCRIPT"
    APP_ID=\$(cat \$PID_FILE)
    sudo kill \$APP_ID
    sudo rm -f \$PID_FILE
    cd \$APP_DIR
    git pull origin main
    echo "Starting application..."
    nohup python3 \$APP_SCRIPT > /dev/null 2>&1 &
    echo \$! > \$PID_FILE
EOF

echo "Update completed!"
