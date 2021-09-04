import os 
import csv

with open("training_data.csv") as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        print(f"{row['target']} {row['era']}")
        break
    
users = [{"name": "arun", 'phone': 9566871780}, {'name' : 'ram' , 'phone': 9100405557}]
keys = ['name', 'phone']

with open("new.csv", "w") as csvwrite:
    writer = csv.DictWriter(csvwrite, fieldnames=keys)
    writer.writeheader()
    writer.writerows(users)

os.listdir()
os.system("type new.csv")
