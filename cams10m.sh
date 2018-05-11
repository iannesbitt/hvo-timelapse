### a script to download hvo webcam images (10-minute refresh cameras)


## Kilauea
# summit
cd kilauea-summit
../get.sh https://volcanoes.usgs.gov/observatories/hvo/cams/KIcam/images/M.jpg summit.jpg
cd ..

# summit thermal
cd kilauea-thermal
../get.sh https://volcanoes.usgs.gov/observatories/hvo/cams/HTcam/images/M.jpg kthermal.jpg
cd ..


## Mauna Loa
# upper sw rift zone
cd maunaloa-swrzu
../get.sh https://volcanoes.usgs.gov/observatories/hvo/cams/M3cam/images/M.jpg mlswrzu.jpg
cd ..

# south pit
cd maunaloa-sp
../get.sh https://volcanoes.usgs.gov/observatories/hvo/cams/MOcam/images/M.jpg mosp.jpg
cd ..

# north pit
cd maunaloa-np
../get.sh https://volcanoes.usgs.gov/observatories/hvo/cams/MLcam/images/M.jpg mlnp.jpg
cd ..


## Pu'u 'O'o
cd po-thermal
../get.sh https://volcanoes.usgs.gov/observatories/hvo/cams/PTcam/images/M.jpg poth.jpg
cd ..

cd po-east
../get.sh https://volcanoes.usgs.gov/observatories/hvo/cams/PEcam/images/M.jpg poeast.jpg
cd ..
