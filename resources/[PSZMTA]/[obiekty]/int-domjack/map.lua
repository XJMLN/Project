for i,v in ipairs({
    {4103,1019.9004,-2177.5996,19.7,0,0,175.995,3,121, false},
    {9339,978.40039,-2127.2998,27.7,0,0,86.248,3,121, false},
    {9339,964.70001,-2139.3,27.7,0,0,356.248,3,121, false},
    {9339,990.5,-2141,27.7,0,0,356.243,3,121, false},
    {9339,976.7998,-2153,27.7,0,0,266.243,3,121, false},
    {9339,975.70001,-2154.3999,29.1,0,0,266.237,3,121, false},
    {9339,964.7002,-2139.2998,29.1,0,0,356.243,3,121, false},
    {9339,978.40002,-2127.3,29.1,0,0,86.248,3,121, false},
    {11472,981.29999,-2154,25.4,0,0,266,3,121, false},
    {11472,982.7998,-2154.0996,25.4,0,0,265.99,3,121, false},
    {9339,960.36798,-2151.8999,29.1,0,0,266.237,3,121, false},
    {9339,992.35999,-2154.0222,29.1,0,0,266.237,3,121, false},
    {11472,968.29999,-2153.1001,25.4,0,0,85.995,3,121, false},
    {9339,978.59998,-2166.0681,29.1,0,0,356.237,3,121, false},
    {9339,972.40002,-2165.7,29.1,0,0,356.232,3,121, false},
    {1533,977.70001,-2154.3701,28.4,0,0,176,3,121, true},
    {1537,974.70001,-2154.1599,28.4,0,0,176,3,121, false},
    {9339,975.70001,-2154.3999,30.5,0,0,266.237,3,121, false},
    {9339,972.41998,-2165.6399,30.5,0,0,356.232,3,121, false},
    {9339,978.59003,-2166.0681,30.5,0,0,356.232,3,121, false},
    {9339,992.40002,-2154.03,30.5,0,0,266.237,3,121, false},
    {9339,960.40002,-2151.9009,30.5,0,0,266.237,3,121, false},
    {9339,978.40002,-2127.3,30.5,0,0,86.246,3,121, false},
    {9339,964.70001,-2139.3,30.5,0,0,356.237,3,121, false},
    {9339,990.5,-2141,29.1,0,0,356.243,3,121, false},
    {9339,990.5,-2141,30.5,0,0,356.243,3,121, false},
    {4585,982.09998,-2131.6001,131,0,180,0,3,121, false},
    {630,978.79999,-2153.8,29.4,0,0,0,3,121, true},
    {630,974.20001,-2153.3999,29.4,0,0,0,3,121, true},
    {638,974.5,-2151.5,27.7,0,0,356.5,3,121, false},
    {638,978.29999,-2151.7,27.7,0,0,356.495,3,121, false},
    {2267,989.79999,-2148.2,29.9,0,0,268.75,3,121, false},
    {1753,964.29999,-2151.7,27,0,0,86,3,121, false},
    {1753,966.29999,-2151.7,27,0,0,175.995,3,121, false},
    {1817,965.5,-2150.7,27,0,0,356,3,121, false},
    {2200,989.59998,-2152,27,0,0,268,3,121, false},
    {2200,989.70001,-2149.80005,27,0,0,267.495,3,121, false},
    {2208,987.29999,-2148.5,27,0,0,356,3,121, false},
    {2208,985,-2148.3401,27,0,0,355.995,3,121, false},
    {2208,984.90002,-2148.3,27,0,0,264.25,3,121, false},
    {2604,987.29999,-2153.1001,27.8,0,0,175.75,3,121, false},
    {2737,971.90002,-2152.4771,29.1,0,0,176.25,3,121, false},
    {14455,969.40002,-2146.3999,28.7,0,0,178,3,121, true},
    {14455,965.09998,-2145.8999,28.7,0,0,357.995,3,121, true},
    {14632,978.20001,-2136.6001,28.5,0,0,355.25,3,121, false},
    {14632,977.79999,-2142,28.5,0,0,355.5,3,121, false},
    {2605,989.09998,-2145.7,27.4,0,0,0,3,121, false},
    {2607,989.09998,-2144.8999,27.4,0,0,0,3,121, false},
    {2607,987.20001,-2145.6799,27.4,0,0,180,3,121, false},
    {2605,987.20001,-2144.8999,27.4,0,0,180,3,121, false},
    {2356,986.79999,-2144.1001,27,0,0,228,3,121, false},
    {2356,989.59998,-2146.8,27,0,0,37.999,3,121, false},
    {14632,983.09998,-2137,28.5,0,0,355.248,3,121, false},
    {14632,982.70001,-2142.5,28.5,0,0,355.248,3,121, false},
}) do
    local obj = createObject(v[1], v[2], v[3], v[4], v[5], v[6], v[7])
    setObjectScale(obj, 1)
    setElementDimension(obj, v[8])
    setElementInterior(obj, v[9])
    setElementDoubleSided(obj, v[10])
    setElementFrozen(obj,true)
    setObjectBreakable(obj,false)
end