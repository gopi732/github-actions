#!/bin/bash
wget_result="$(wget -NS localhost:9028 2>&1|grep "HTTP/"|awk '{print $2}')"
if [ $wget_result = 200 ]; then
echo "it's Working"
else 
   echo "it's Not Working"
fi
