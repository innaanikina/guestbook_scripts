#!/bin/bash


# Укажите путь к папке с index.html
INDEX_DIR=$1
aws --endpoint-url=https://storage.yandexcloud.net s3 cp $INDEX_DIR/index.html s3://guestbook-01/index.html
