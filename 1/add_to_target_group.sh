#!/bin/bash

TARGET_ID="enpdihf30fhag59kb7du"
SUBNET_ID="e2l9ra664r2llt0n5pv2"
INSTANCE_IP=$1

yc load-balancer target-group add-targets $TARGET_ID --target subnet-id=$SUBNET_ID,address=$INSTANCE_IP
