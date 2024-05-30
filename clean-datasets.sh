#!/bin/bash
# Remove satellital data
echo -e "\n --- Remove Satellite dataset ---"
rm -rdf ./data/geoserver/data_dir_satellite/coverages/gpkg/

# Remove my Selection PBF
echo -e "\n --- Remove OSM High Resolution PBF file ---"
rm -f ./pbfs/selection-latest.osm.pbf

echo -e "\n --- Remove OSM Low Resolution GPKG file ---"
rm -f ./data/geoserver/gpkg/osm-lowres.gpkg
 
echo -e "\n --- Remove PostGIS docker volume ---"
docker volume rm all-basemaps-geoserver_pgdata
