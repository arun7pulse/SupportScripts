#!/usr/bin/env python3
# Author: ArunSanthoshKumar Annamalai (@arun7pulse)
# Date: 26-May-2019
# Description: This script takes a list of events and generates a report of users logged in at each machine.

def get_event_date(event) :
    return event.date

def current_users(events):
    events.sort(key=get_event_date)
    machines ={}
    for event in events:
        if event.machine not in machines:
            machines[event.machine] = set()
        if event.type == 'login':
            machines[event.machine].add(event.user)
        elif event.type =='logout':
            machines[event.machine].remove(event.user)
    return machines

def generate_report(machines):
    for machine, users in machines.items():
        if len(users) > 0:
            userlist = ",".join(users)
            print("{}:{}".format(machine,userlist))

if __file__ == "__main__" : 
    events = [
        Event('machine1', 'login', 'user1'),
        Event('machine1', 'login', 'user2'),
        Event('machine1', 'login', 'user3'),
        Event('machine1', 'logout', 'user1'),
        Event('machine1', 'logout', 'user2'),
        Event('machine1', 'logout', 'user3'),
        Event('machine2', 'login', 'user1'),
        Event('machine2', 'login', 'user2'),
        Event('machine2', 'login', 'user3'),
        Event('machine2', 'logout', 'user1'),
        Event('machine2', 'logout', 'user2'),
        Event('machine2', 'logout', 'user3'),
        Event('machine3', 'login', 'user1'),
        Event('machine3', 'login', 'user2'),
        Event('machine3', 'login', 'user3'),
        Event('machine3', 'logout', 'user1'),
        Event('machine3', 'logout', 'user2'),
        Event('machine3', 'logout', 'user3'),
    ]
    generate_report(current_users(events))
    



