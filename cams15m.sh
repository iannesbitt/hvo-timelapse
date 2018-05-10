# a script to download hvo webcam images (10-minute refresh cameras)

## Mauna Loa
# summit thermal
cd maunaloa-thermal
../get.sh https://volcanoes.usgs.gov/observatories/hvo/cams/MTcam/images/M.jpg mlthermal.jpg
cd ..

## Kilauea
# east rift zone
cd kilauea-erz
../get.sh https://volcanoes.usgs.gov/observatories/hvo/cams/PGcam/images/M.jpg erz.jpg
cd ..
