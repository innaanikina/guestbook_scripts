#!/bin/bash
aws --endpoint-url=https://storage.yandexcloud.net s3 cp s3://guestbook-01-data/guestbook-sa.txt guestbook-sa.txt
aws --endpoint-url=https://storage.yandexcloud.net s3 cp s3://guestbook-01-data/terra-key.json terra-key.json
aws --endpoint-url=https://storage.yandexcloud.net s3 cp s3://guestbook-01-data/my-variables.tfvars my-variables.tfvars

