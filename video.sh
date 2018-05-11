cd $HOME/Pictures/webcams

# inside the brackets are folder prefixes you want to create timelapses for
ls -d {maunaloa,kilauea}*/ > dirs

for fldr in $(cat dirs); do
  cd $fldr

  count=`ls -1 *.jpg 2>/dev/null | wc -l`
  if [ $count != 0 ]
  then
    ../rmcorr.sh
    ../rmdup.sh
    ../timelapse
    #rm *.jpg
  fi

  cd ..
done
