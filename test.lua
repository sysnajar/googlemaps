local googlemaps=require('googlemaps')
require('mykey.lua')
MODE="driving"
 
--local polyline="kywjHco|LWUi@WKIGISQcA~@"
--local points=googlemaps.decode_polyline(polyline)
--local npolyline=googlemaps.encode_polyline(points)

----- Getting a directoin
print("== EXAMPLE 1 : get a direction and print the result")
local json=googlemaps.direction("48.829457,2.285350","49.1226,2.282287",MODE,KEY)
print(json)

----- Create a polyline from polylines
print("== EXAMPLE 2 : assemble a sequence of polylines")
local leg=json.routes[1].legs[1]

local polylines={}
for s=1,10 do
  local st=leg.steps[s]
  polylines[s]=st.polyline.points
end
local polylines_str=googlemaps.assemble_polylines(polylines)
googlemaps.save_map_polyline("640x480",polylines_str,"tmp.png",KEY)


---- nb_steps
--local idx=1
--for s=1,5 do
--  local polyline_str=leg.steps[s].polyline.points
--  local polyline=decode_polyline(polyline_str)
--  for j=1,#polyline-1 do
--    local start_location=polyline[j]
--    local end_location=polyline[j+1]
    
--    print("DISTANCE is "..distance_on_earth_meters(start_location.lat,start_location.lng,end_location.lat,end_location.lng))
    
--    local heading=computeHeading(start_location.lat,start_location.lng,end_location.lat,end_location.lng)
--    print("Heading = "..heading)
--    captureStreetView(start_location.lat,start_location.lng,heading,"600x400","view_"..idx..".png")
--    idx=idx+1
--  end
--end