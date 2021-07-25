#!/usr/bin/env python3
# Author: ArunSanthoshKumar Annamalai (@arun7pulse)
# Date: 26-May-2019
# Description: This script is used to automate tweets on twitter.

import requests
from requests_oauthlib import OAuth1
import json

with open("config.json") as json_data_file:
    config = json.load(json_data_file)

consumer_key = config['twitter']['consumer_key']
consumer_secret = config['twitter']['consumer_secret']
access_token = config['twitter']['access_token']
access_token_secret = config['twitter']['access_token_secret']
auth = OAuth1(consumer_key, consumer_secret, access_token, access_token_secret)
#auth = OAuth1(consumer_key,client_secret=consumer_secret, resource_owner_key=access_token, resource_owner_secret=access_token_secret, decoding=None)

def tweet_request(tweet_text):
    newtweet = []
    for i in tweet_text.split(" "):
        if i in ["investment", "business", "market", "money", "portfolio", "future", "stocks"]:
            newtweet.append(f"#{i}")
        else: 
            newtweet.append(i)
    fintweet = " ".join(newtweet)
    print(fintweet) 
    url = 'https://api.twitter.com/1.1/statuses/update.json'
    payload = {'status': fintweet}
    r = requests.post(url, auth=auth, data=payload)
    print(r.text)

if __name__ == "__main__":
  tweet_text = '"At heart, “uncertainty” and “investing” are synonyms  - The Intelligent investor."'
  tweet_request(tweet_text)



  
  

