#!/usr/bin/env python3

import shutil 
import psutil 

def check_disk_usage(disk="/"):
    du = shutil.disk_usage(disk)
    per = du.free / du.total * 100 
    print(f"Drive {disk} Free Percentage {round(per)} %")

def check_cpu_usage():
    usage = psutil.cpu_percent(1)
    print(f"CPU Usage {usage}")

if __name__ == '__main__':
    check_disk_usage()
    check_cpu_usage()
