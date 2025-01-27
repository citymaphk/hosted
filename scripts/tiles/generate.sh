#( cd citymaptiles ; ./quickstart.sh asia/china/hong-kong )

echo "Converting MBTiles to PBF"
rm -rf temp
( python3 mbutil/mb-util --image_format=pbf citymaptiles/data/tiles.mbtiles temp )

echo "Unzipping PBF"
cd temp
gzip -d -r -S .pbf *
find . -type f ! -name "*.*" -exec mv '{}' '{}'.pbf \;
cd ..

echo "Copying PBF"
rm -rf ../../tiles
mv temp ../../tiles/
