#!/usr/bin/env bash

echo "como provison dist"
yum install httpd -y
service https start 