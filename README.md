This sets NASA's Astronomy Picture of the Day (APOD) to the window terminal's background. Inteded for use for WSL in Window Terminal app. This will get the APOD photo of the current day and use it for the Window Terminal background. If the APOD photo is already defined on the machine, then the script will exit. If the curl to APOD fails (e.g. in the case of no internet connection), then the background will default to `default_background.jpg` instead of getting the new image from NASA.

This requires some setup to properly work.

## Setup
**Set up your APOD API key**
1. Go to https://api.nasa.gov/ to set up an API key for the APOD.
2. Set your API key to the `APOD_API_KEY` environment variable.

**Set directory where images will be saved**
1. Set `APOD_SAVE_DIR` to the directory where images will be saved. This is where `background.jpg` will be read from, as well as where `default_background.jpg` should live. It's easiest out of the box to set this to the apod-terminal-background directory.

**Window Terminal config**
1. In Window Terminal settings, go to the profile you want to set the background for.
2. Go to `Appearance > Background Image Path`, and set this to be `background.jpg` in the directory specified in `APOD_SAVE_DIR`. For example, something like: `\\wsl.localhost\Ubuntu\home\<some path>\apod-terminal-background\background.jpg`.
3. (optional) Back in the profile we are working in, go to `Advanced > Profile termination behavior` and chose `Close when process exits, fails, or crashes`. This will automatically close the first window that actually downloads the APOD. You don't have to do this, and if you chose not to there will just be one window that you will manually have to close out of.

**Final step**
1. Add start.sh to your bash_profile, `. <path>/apod-terminal-background/start.sh`. This will make the script run everytime you log into a window, and will always download the new APOD picture when it changes!
