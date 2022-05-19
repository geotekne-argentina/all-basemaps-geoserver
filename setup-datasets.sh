#!/bin/bash
# Download Global levels from 0 to 10
echo -e "\n --- Download Global Resolution Satellite dataset ---"
curl "https://link.us1.storjshare.io/s/jv4zufs2kc5njqrawylqwy3aaqpq/satellite/global-0-10.zip?download=1" -o ./data/geoserver/data_dir_satellite/coverages/gpkg/global-0-10.zip
unzip -o ./data/geoserver/data_dir_satellite/coverages/gpkg/global-0-10.zip -d ./data/geoserver/data_dir_satellite/coverages/gpkg/

# Download my Selection (ie. Estonia) levels from 11 to 15
echo -e "\n --- Download Selected ROI - High Resolution Satellite dataset ---"
curl "https://link.us1.storjshare.io/s/jwe65622vod4z5as6ajedswg2asa/satellite/countries/estonia-11-to-15.zip?download=1" -o ./data/geoserver/data_dir_satellite/coverages/gpkg/estonia-11-to-15.zip
unzip -o ./data/geoserver/data_dir_satellite/coverages/gpkg/estonia-11-to-15.zip -d ./data/geoserver/data_dir_satellite/coverages/gpkg/
mv ./data/geoserver/data_dir_satellite/coverages/gpkg/estonia-11-to-15.gpkg ./data/geoserver/data_dir_satellite/coverages/gpkg/selection-11-to-15.gpkg

# Download my Selection PBF (ie. Estonia)
echo -e "\n --- Download OSM High Resolution PBF file ---"
curl "https://download.geofabrik.de/europe/estonia-latest.osm.pbf" -o ./pbfs/estonia-latest.osm.pbf

echo -e "\n --- Download OSM Low Resolution GPKG file ---"
FILE=./data/geoserver/gpkg/osm-lowres.gpkg
if [ ! -f "$FILE" ]; then
    echo -e "\n ----- OSM Low resolution file ($FILE) does not exist."
    echo -e "\n ----- Download and configure file in data folder."
    curl "https://link.us1.storjshare.io/s/jumximeaymxkett2lt66cid2l4pq/osm/osm-lowres-modified.zip?download=1" -o ./osm-lowres-modified.zip
    unzip -o ./osm-lowres-modified.zip
    mv ./osm-lowres-modified.gpkg ./data/geoserver/gpkg/osm-lowres.gpkg
fi

