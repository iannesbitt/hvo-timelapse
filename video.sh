cd /home/iannesbitt/Pictures/webcams

ls -d {maunaloa,kilauea}*/ > dirs

for fldr in $(cat dirs); do
  cd $fldr

  count=`ls -1 *.jpg 2>/dev/null | wc -l`
  if [ $count != 0 ]
  then
    timelapsehvo
    #rm *.jpg
  fi

  cd ..
done
