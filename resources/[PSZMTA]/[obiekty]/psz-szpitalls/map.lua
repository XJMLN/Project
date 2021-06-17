for i,v in ipairs({
    {638,1179.6,-1303.6,13.9,0,0,0},
    {638,1179.6,-1300.9,13.9,0,0,0},
    {638,1179.6,-1298.2,13.9,0,0,0},
    {638,1179.6,-1295.5,13.9,0,0,0},
    {638,1179.6,-1292.8,13.9,0,0,0},
    {1232,1181,-1312.1,15.1,0,0,0},
    {1232,1181.1,-1317.7,15.1,0,0,0},
    {1364,1181.4,-1315,13.3,0,0,90},
    {1537,1171.77,-1321.9,14.4,0,0,90},
    {1537,1171.77,-1323.4,14.4,0,0,90},
    {1369,1177.5,-1319.3,13.7,0,0,0},
    {1369,1172.4,-1327.9,15,0,0,150},
    {638,1173.2,-1313.7,13.7,0,0,0},
    {638,1173.2,-1316.3,13.7,0,0,0},
    {1215,1173,-1311.9,13.5,0,0,0},
    {1215,1179.5,-1305.2,13.9,0,0,0},
    {1215,1185.5,-1311.8,13.1,0,0,0},
    {638,1173.2,-1318.9,13.7,0,0,0},
    {970,1185.7,-1313.9,13.1,0,0,90},
    {970,1185.7,-1316,13.1,0,0,90},
    {1232,1181.1,-1335.2,15.1,0,0,0},
    {1232,1181.2,-1329.4,15.1,0,0,0},
    {1364,1181.5,-1332.5,13.3,0,0,90},
    {970,1185.7,-1333.4,13.1,0,0,90},
    {970,1185.7,-1331.3,13.1,0,0,90},
    {638,1173.3,-1333.9,13.7,0,0,0},
    {1215,1173.1,-1335.5,13.5,0,0,0},
    {638,1173.3,-1331.3,13.7,0,0,0},
    {638,1173.3,-1328.7,13.7,0,0,0},
    {1215,1182.2,-1342.6,13.7,0,0,0},
    {1215,1185.6,-1335.6,13.1,0,0,0},
}) do
    local obj = createObject(v[1], v[2], v[3], v[4], v[5], v[6], v[7])
    setObjectScale(obj, 1)
    setElementDimension(obj, 0)
    setElementInterior(obj, 0)
    setElementDoubleSided(obj, true)
    setObjectBreakable(obj,false)
    setElementFrozen(obj,true)
end