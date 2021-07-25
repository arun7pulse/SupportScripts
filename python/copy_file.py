#!/usr/bin/env python3
# Author: ArunSanthoshKumar Annamalai (@arun7pulse)
# Date: 26-May-2019
# Description: This script is used to copy files from one folder to another.

import shutil
import os 

def copy_file(src, dst):
    if os.path.exists(src):
        shutil.copy(src, dst)
    else:
        print("Source file does not exist")

if __name__ == '__main__':
    print("\n List of Files Before the Copy: \n " + str(os.listdir()))    
    src = input("Enter the source file: ")
    dst = input("Enter the destination file: ")
    copy_file(src, dst)
    print("\n List of Files after the Copy :\n " + str(os.listdir()))
