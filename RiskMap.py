# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# RiskMap.py
# Created on: 2020-05-31 13:24:29.00000
#   (generated by ArcGIS/ModelBuilder)
# Description: 
# ---------------------------------------------------------------------------

# Import arcpy module
import arcpy


# Local variables:
lka_ppp_2020_tif = "lka_ppp_2020.tif"
Galle_Matara = "Galle_Matara"
Population_Southern_tif = "C:\\Users\\HP\\Desktop\\Projects\\SpaceApp\\New folder\\Population_Southern.tif"
Risk_Map_tif = "C:\\Users\\HP\\Desktop\\Projects\\SpaceApp\\New folder\\Risk_Map.tif"

# Process: Clip
arcpy.Clip_management(lka_ppp_2020_tif, "79.9861591350014 5.91815783273727 80.7226652336149 6.44000122898748", Population_Southern_tif, Galle_Matara, "-9.999900e+004", "ClippingGeometry", "MAINTAIN_EXTENT")

# Process: Raster Calculator
arcpy.gp.RasterCalculator_sa("Float(Float((\"%Population_Southern.tif%\")/10000)*12.9275)", Risk_Map_tif)
