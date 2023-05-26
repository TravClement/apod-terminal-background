#!/usr/bin/sh
if [ -z ${APOD_API_KEY+x} ]; then
    echo "APOD_API_KEY is not set";
    return
fi

if [ -z ${APOD_SAVE_DIR+x} ]; then
    echo "APOD_SAVE_DIR is not set";
    return
fi

# get the image from apod api, given the name of the output and an optional date YYYY-MM-DD
# returns a 0 if the curl completed successfully and 1 if not
get_image () {
    saved_location="$APOD_SAVE_DIR$1"
    date="&date=$2"
    if [ -z $2 ]; then
        date=''
    fi

    echo "getting the photo for $1"

    res=$(curl "https://api.nasa.gov/planetary/apod?api_key=$APOD_API_KEY$date")
    code=$?

    echo "res: $res"
    echo "code: $code"

    if test "$code" == "0"; then
        echo "Getting the image for $1"
        echo "$res" | jq '.hdurl' | xargs wget -O $saved_location
        return 0
    else
        return 1 
    fi
}

if [ ! -f "${APOD_SAVE_DIR}default_background.jpg" ]; then
    echo "downloading default background"
    get_image "default_background.jpg" "2021-09-18"
    res=$?
    if test "$res" != "0"; then
        echo "You're doing something wrong. The default image is not around, and a curl to re-get it is not working"
        return
    fi
fi

if [ -f "${APOD_SAVE_DIR}background.jpg" ]; then
    # To stop getting new images if the image was updated today
    backgroundDate=$(( $(date -r "${APOD_SAVE_DIR}background.jpg" +%s) / 86400))
    todayDate=$(( $(date +%s) / 86400))
    if test $backgroundDate == $todayDate; then
        return
    fi

    echo "deleting old photo file"
    rm "${APOD_SAVE_DIR}background.jpg"
fi

get_image "background.jpg"
res=$?
if test "$res" != "0"; then
    echo "Copying default background to background.jpg"
    cp "${APOD_SAVE_DIR}default_background.jpg" "${APOD_SAVE_DIR}background.jpg"
fi
touch ${APOD_SAVE_DIR}background.jpg

wt.exe nt
sudo kill -9 $PPID
