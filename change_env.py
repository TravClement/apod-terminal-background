import requests
import json

# Read in the NASA api key from text file
with open('api_key.txt') as f:
    API_KEY = f.read()
URL = "https://api.nasa.gov/planetary/apod"
# GET request settings to get HD url
payload = {'hd': 'True', 'api_key': API_KEY}

r = requests.get(URL, params=payload)
r.json()
