#!/bin/bash
# Purpose: Checking TLS/SSL certificate expiration date
# Author: Daniel Cruz <daniel@mydatacenter.io>
# Note : The script must run as a cron-job.
# Last updated on : 17-May-2022

SERVER_NAME=$(hostname -f)
PORT=443
OPENSSL_DIR=$(openssl version -d)

echo -e "Certificate directory: $OPENSSL_DIR"
openssl s_client -servername {SERVER_NAME} -connect {SERVER_NAME}:{PORT} | openssl x509 -noout -dates

echo "Connecting to localhost:443 to check SSL/TLS certificate expiration"
openssl s_client -connect localhost:443 2>/dev/null | openssl x509 -noout -dates
