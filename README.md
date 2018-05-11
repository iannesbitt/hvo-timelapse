# hvo-timelapse

### requirements
- Arch Linux or Ubuntu preferred, but MacOS may work (not tested)
- [`ffmpeg`](https://www.ffmpeg.org/)
- [`jpeginfo`](https://github.com/tjko/jpeginfo)

This is designed to go in a folder called $HOME/Pictures/webcams.

Currently, there are two files that control `wget` sequences, `cams10m.sh` and `cams15m.sh`. These were designed to work on the schedule of Hawaii Volcanoes webcams with different update intervals. You can change how you see fit.

You'll want to edit one of the `cams*.sh` files to add your own webcams. Then you need to 
`mkdir YOURFOLDER` and make sure `YOURFOLDER` is listed in the `cams` file, above the 
`wget` command, like so:

```
cd YOURFOLDER
wget http://YOUR.WEB.CAM.URL filename.jpg
cd ..
```

The `filename.jpg` will be appended to a datestamp, so the `YOURFOLDER` folder will fill up 
with files named like the following:
`2018-05-10_002601_filename.jpg`

You can then ask cron to take all those files and put them into a timelapse. My crontab is 
as follows:

`crontab -e`

```
### hawaii volcanoes webcams ###
# hvo webcam get scripts
*/10 * * * * cd $HOME/Pictures/webcams/; ./cams10m.sh 2>&1 # get 10-minute webcams
*/15 * * * * cd $HOME/Pictures/webcams/; ./cams15m.sh 2>&1 # get 15-minute webcams

# timelapses (end up in $HOME/Pictures/webcams/*/video0/)
# the following two line checks 57 past every hour at whether it's 11:57 in Honolulu
# if so, run the timelapse and jpg cleanup scripts successively
# thanks to art-of-the-web.com (https://www.the-art-of-web.com/system/cron-set-timezone/)
57 * * * * [ "$(TZ=":Pacific/Honolulu" date +\%H\%M)" == "2357" ] && $HOME/Pictures/webcams/video.sh && $HOME/Pictures/webcams/*/*.jpg
```

By default, videos end up in a folder called `video0` inside the `YOURFOLDER` folder.

You can check for duplicates in the current directory by calling `rmdup.sh`. You can also check for corrupted JPGs by calling `rmcorr.sh`. This is done automatically by `video.sh` but could be useful for manual cleaning.

Questions? Let me know
