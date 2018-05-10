# hvo-timelapse

This is designed to go in a folder called $HOME/Pictures/webcams.

Currently, there are two files that control `wget` sequences, `cams10m.sh` and `cams15m.sh`. These were designed to work on the schedule of Hawaii Volcanoes webcams with different update intervals. You can change how you see fit.

My setup was as follows:

`crontab -e`

```
### hawaii volcanoes webcams ###
# hvo webcam get scripts
*/10 * * * * cd $HOME/Pictures/webcams/; ./cams10m.sh 2>&1 # get 10-minute webcams
*/15 * * * * cd $HOME/Pictures/webcams/; ./cams15m.sh 2>&1 # get 15-minute webcams

# timelapses (end up in $HOME/Pictures/webcams/*/video0/)
0 6 * * * sleep 30; $HOME/Pictures/webcams/video.sh # timelapse script runs every day at 6am ET (12am HT)
9 6 * * * sleep 30; rm $HOME/Pictures/webcams/*/*.jpg # 9 minutes should be enough time
```

You can check for duplicates in the current directory by calling `rmdup.sh`. You can also check for corrupted JPGs by calling `rmcorr.sh`.