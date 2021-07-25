#!/usr/bin/env python3
# Author: ArunSanthoshKumar Annamalai (@arun7pulse)
# Date: 26-May-2019
# Description: This script is used to automate tweets on twitter.

from json import load
import tweepy

with open("config.json") as json_data_file:
    config = load(json_data_file)

consumer_key = config['twitter']['consumer_key']
consumer_secret = config['twitter']['consumer_secret']
access_token = config['twitter']['access_token']
access_token_secret = config['twitter']['access_token_secret']

def get_api():
  auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
  auth.set_access_token(access_token, access_token_secret)
  return tweepy.API(auth)

def tweepy_tweet(tweet_text):
  api = get_api()
  newtweet = []
  for i in tweet_text.split(" "):
    if i in ["investment", "business", "market", "money", "portfolio", "future", "stocks"]:
        newtweet.append(f"#{i}")
    else: 
        newtweet.append(i)
  fintweet = " ".join(newtweet)
  print(fintweet) 
  status = api.update_status(status=f"{fintweet}")
  
if __name__ == "__main__":
  tweet_text = '"The secret of sound investment into three words: MARGIN OF SAFETY  - The Intelligent investor."'
  tweepy_tweet(tweet_text)

def main():
  api = get_api()
  poor = []
  while(len(rich) > 0):
      tweet = rich.pop()
      poor.append(tweet)
      newtweet = []
      for i in tweet.split(" "):
        if i in ["investment", "business", "market", "money", "portfolio", "future", "stocks"]:
            newtweet.append(f"#{i}")
        else: 
            newtweet.append(i)
      fintweet = " ".join(newtweet)
      print(fintweet) 
      status = api.update_status(status=f"{fintweet}") 
  print(poor)
