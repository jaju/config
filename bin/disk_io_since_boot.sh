#!/bin/sh
cat /proc/diskstats | grep "[sh]d[a-z] " | awk '{print $10 "*512/1024/1024/1024"}' | bc -l
