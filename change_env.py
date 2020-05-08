import requests, json, re, os

# Read in the NASA api key from text file
with open('api_key.txt') as f:
    API_KEY = f.read()
URL = "https://api.nasa.gov/planetary/apod"
# GET request settings to get HD url
payload = {'hd': 'True', 'api_key': API_KEY}
r = requests.get(URL, params=payload)
request = r.json()

# Get the path to C:\Users\[user]\AppData\Local
path = os.environ['LOCALAPPDATA']
# Update the settings.json file by reading in the file, then default powershell with the picture
with open(path + '\\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState\\settings.json', 'r') as settings:
    # load won't work with comments in the file, strip it first to json
    fixedSettings = re.sub("//\s.*", "", settings.read(), flags=re.MULTILINE)
    data = json.loads(fixedSettings)
# Set the default background image to the apod url
data['profiles']['defaults']['backgroundImage'] = request['hdurl']
# Reopen the settings file and write the updated image
with open(path + '\\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState\\settings.json', 'w') as settings:
    json.dump(data, settings, indent=4)
