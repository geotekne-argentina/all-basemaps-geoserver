#!/bin/bash
echo -e "\n --- Importing PBFs files allocated in pbfs folder into Postgis database ---"
cd ./imposm/
./import-pg.sh -i ../pbfs/ -c all-basemaps-geoserver_postgis -v 12.1 -p 5432 -r false
cd ../
# Once imported, pbfs files are moved to another folder
count=`ls -1 ./pbfs/*.pbf 2>/dev/null | wc -l`
if [ $count != 0 ]; then 
   mv ./pbfs/*.pbf ./pbfs/imported
fi 
