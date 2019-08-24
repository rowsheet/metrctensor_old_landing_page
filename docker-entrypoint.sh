#!/bin/bash
service nginx start
python3 /app/main.py
tail -f /dev/null
