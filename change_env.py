import requests
import json

# Read in the NASA api key from text file
with open('api_key.txt') as f:
    API_KEY = f.read()
URL = "https://api.nasa.gov/planetary/apod"
# GET request settings to get HD url
payload = {'hd': 'True', 'api_key': API_KEY}

r = requests.get(URL, params=payload)
request = r.json()
# Request the hd picture url to save to a file
pic = requests.get(request['hdurl'])
# Check that the picture GET request worked
if pic.status_code == 200:
    # Open a jpg file to save the picture to
    with open('apod.jpg', 'wb') as f:
        f.write(pic.content)
