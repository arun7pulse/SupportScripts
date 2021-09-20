
import requests 
import datetime
import time
import threading 

def child(symbol):
    print("before symbol",symbol)
    sleep(10)
    print("before symbol",symbol)

def parent(symbols):
    threads = [threading.Thread(target=child, args=(symbol,), name=symbol) for symbol in symbols]
    [thread.start() for thread in threads]
    [thread.join() for thread in threads]
    print("Complete")
        
   
symbols = ["SBIN", "ITC", "ONGC"]
S = time.time()
parent(symbols)
print(round((time.time() - S), 2), "Seconds Took to Complete")
print("END",datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    



