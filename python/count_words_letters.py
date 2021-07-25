#!/usr/bin/env python3
# Author: ArunSanthoshKumar Annamalai (@arun7pulse)
# Date: 26-May-2019
# Description: This script is used to count the words and letters. 

def count_letters(text, sort=False):
    result ={}
    for letter in text :
        if letter not in result:
            result[letter] = 0
        result[letter]+=1
    if sort:
        return {k:v for k,v in sorted(result.items(), key=lambda item: item[1])}
    print(result)
    return result 

def count_words(sentence, sort=False):
    sentence = sentence.lower()
    words = sentence.split()
    result = {}
    for word in words:
        if word not in result:
            result[word] = 0
        result[word]+=1
    if sort:
        return {k:v for k,v in sorted(result.items(), key=lambda item: item[1])}
    print(result)
    return result 

if __name__ == '__main__':
    print("Letters:")
    count_letters('Hello World')
    print("Words:")
    count_words('Hello World')