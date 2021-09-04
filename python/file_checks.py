#!/usr/bin/env python3

import os

with open("sample.txt", "w") as file:
    file.write("this is sample txt")


if os.path.exists("new.txt"):
    os.remove("new.txt")
    
print(os.rename("sample.txt", "new.txt"))
print(os.path.abspath("new.txt"))
print(os.getcwd())
print(os.listdir())


os.chdir(".git")
os.listdir()
os.chdir("..")
dire = ".git"

for name in os.listdir(dire):
    fullname = os.path.join(dire, name) 
    if os.path.isdir(fullname):
        print(f"{fullname} is a directory")
    else :
        print(f"{fullname} is a file")


