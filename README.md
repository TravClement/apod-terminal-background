I work with Pycharm, you could work with other editors I think.

**Overall view**
* Get requests from NASA apod api `https://api.nasa.gov/planetary/apod`
for the url of the apod picture.
* Update the windows terminal settings json file to set `backgroundImage` to be the url of the apod picture.
    * Set up profiles.json so that there is a `default` profile. You can do this manually. 
    

**What you have to do**
* Read in api key from api_key.txt.
* Use python requests to get the apod picture website (preferably in HD). NASA apod api can be found: https://api.nasa.gov/ 
* Find the location of window terminal's `profiles.json`.
* Write the default `backgroundImage` of `profiles.json` to be the url gotten back from the get request.

**Extra**
* If request fails, use a default picture as the background instead
