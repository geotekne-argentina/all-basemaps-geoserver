#!/bin/bash
# include config
source ./config.sh

# Download Global levels from 0 to 10
FILE=./data/geoserver/data_dir_satellite/coverages/gpkg/global-0-10.gpkg
if [ ! -f "$FILE" ]; then
    echo -e "\n ----- Global Resolution Satellite file ($FILE) does not exist."
    echo -e "\n ----- Download Global Resolution Satellite dataset -----"
    curl "https://link.us1.storjshare.io/s/jv4zufs2kc5njqrawylqwy3aaqpq/satellite/global-0-10.zip?download=1" -o ./data/geoserver/data_dir_satellite/coverages/gpkg/global-0-10.zip
    unzip -o ./data/geoserver/data_dir_satellite/coverages/gpkg/global-0-10.zip -d ./data/geoserver/data_dir_satellite/coverages/gpkg/
fi

# Download my Selection levels from 11 to 15
FILE=./data/geoserver/data_dir_satellite/coverages/gpkg/selection-11-to-15.gpkg
if [ ! -f "$FILE" ]; then
    echo -e "\n ----- Selected High Resolution Satellite file ($FILE) does not exist."
    echo -e "\n ----- Download Selected ROI - High Resolution Satellite dataset -----"
    curl -k $SAT_URL -o ./data/geoserver/data_dir_satellite/coverages/gpkg/selection-11-to-15.zip
    unzip -o ./data/geoserver/data_dir_satellite/coverages/gpkg/selection-11-to-15.zip -d ./data/geoserver/data_dir_satellite/coverages/gpkg/
    mv ./data/geoserver/data_dir_satellite/coverages/gpkg/$SAT_FILENAME ./data/geoserver/data_dir_satellite/coverages/gpkg/selection-11-to-15.gpkg
fi

# Download my Selection PBF (defined in config.sh file)
FILE=./pbfs/selection.osm.pbf
if [ ! -f "$FILE" ]; then
    echo -e "\n ----- OSM High resolution file ($FILE) does not exist."
    echo -e "\n ----- Downloading and configuring file in data folder."
    curl -k $PBF_URL -o $FILE
fi

# Download Low resolution OSM dataset
FILE=./data/geoserver/gpkg/osm-lowres.gpkg
if [ ! -f "$FILE" ]; then
    echo -e "\n ----- OSM Low resolution file ($FILE) does not exist."
    echo -e "\n ----- Downloading and configuring file in data folder."
    curl "https://link.us1.storjshare.io/s/jumximeaymxkett2lt66cid2l4pq/osm/osm-lowres-modified.zip?download=1" -o ./osm-lowres-modified.zip
    unzip -o ./osm-lowres-modified.zip
    mv ./osm-lowres-modified.gpkg ./data/geoserver/gpkg/osm-lowres.gpkg
fi

