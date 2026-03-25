#!/bin/bash

echo "$(date): $(free -h | grep Mem)" >> /var/log/ram_usage.log