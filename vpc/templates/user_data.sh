#!/bin/bash

set -euo pipefail
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

yum update -y
yum  install -y postgresql196.x86_64
