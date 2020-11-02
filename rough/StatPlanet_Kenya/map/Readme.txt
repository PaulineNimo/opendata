
Instructions for loading your own ESRI map-shapefiles into StatPlanet:

2. Remove the included map shapefiles, and copy your new shapefiles here.
3. Rename your files (e.g. xxx.shp and xxx.dbf) to map.shp and map.dbf
4. Open the StatPlanet_data_editor.xls file. 
5. MAke sure macros are enabled. Then click on the button 'Setup new map files' (in the top-left).
5. Select the map.dbf file in the 'map' sub-folder, and follow the instructions.
6. Import some data and run StatPlanet to see the results.

The map size and position, font and interface components can all be customized (see the user manual).

---------------------------------------------------------------------------------
SETUP WITHOUT EXCEL

1. Copy your map shapefiles as explained above.
2. Copy and paste the ID and Names column from the map.dbf file to replace the existing ones in the file data.csv
3. Copy the ID column header name, and paste it under 'DBF-ID' in row 3/column 4 in the file data.csv.

Note: The ID column may not contain spaces, symbols or numbers, and should have unique values only.

---------------------------------------------------------------------------------
SHPFILE READER SOURCE CODE

The source code for reading the map shapefiles is included in the directory SHPreader.
It can be compiled to the file SHPreader.swf, which is read by StatPlanet.

The code was written by Edwin van Rijkom under the LGPL license, with some additions by Andy Woodruff, 
and some slight modifications for use in StatPlanet.

If you wish to change the names of the map files being read, you can change this in SHPreader.as, 
and publish it as SHPreader.swf through the file SHPreader.fla.

For more information, see: http://shp.riaforge.org/

---------------------------------------------------------------------------------
