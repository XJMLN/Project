--triggerClientEvent(client,"moveMeObject", client,x,y,z,i,d)
addEvent("moveMeObject", true)
addEventHandler("moveMeObject", root, function(x,y,z,i,d) 
	--if (not isElement(client)) then return end
	local obj = createObject(974, x,y,z-0.8,90,0,0)
	setElementInterior(obj, i)
	setElementDimension(obj, d)
	setElementAlpha(obj, 0)
	setTimer(function(obj) destroyElement(obj) end, 2000, 1,obj)
end)