--[[

Core - elementy do zbierania: totemy

@author Jakub 'XJMLN' Starzak <jack@pszmta.pl
@package PSZMTA.psz-core
@copyright Jakub 'XJMLN' Starzak <jack@pszmta.pl>

Nie mozesz uzywac tego skryptu bez mojej zgody. Napisz - byc moze sie zgodze na uzycie.

]]--
totemy = {}
local a_totem=nil
local function usunTotem(id)
    if isElement(totemy[id].totem) then destroyElement(totemy[id].totem) end
    if isElement(totemy[id].cs) then destroyElement(totemy[id].cs) end
    totemy[id] = nil
end

local function zaladujTotemy(v,fast)
    if totemy[v.id] then
        usunTotem(v.id)
    end

    v.pos = split(v.loc,",")
    for ii,vv in ipairs(v.pos) do v.pos[ii]=tonumber(vv) end

    local pickupid = 1254

    v.totem = createPickup(v.pos[1],v.pos[2],v.pos[3],3,pickupid,0)
    v.cs=createColSphere(v.pos[1],v.pos[2],v.pos[3], 1)
    v.corona=createMarker(v.pos[1],v.pos[2],v.pos[3],"corona",0.3,67,222,149,100)
    local dimension = v.vw or 0
    local int = v.i or 0

    setElementData(v.cs,"totem", {
            ["id"]=v.id,
            ["vw"]=v.vw,
            ["int"]=v.i,
})

    local dbid=v.id
    v.id=nil
    totemy[dbid]=v

    return true
end

function totemyGetInfo(id)
    return totemy[id]
end

local function zaladujCzescTotemow(procent,fast)
    local tt=getTickCount()
i=0
    local totemki
    if fast then
        totemki=exports["psz-mysql"]:pobierzTabeleWynikow("SELECT t.id,t.loc FROM psz_eventy_znajdzki t WHERE t.actived=1;")
    else
        totemki=exports["psz-mysql"]:pobierzTabeleWynikow("SELECT t.id,t.loc FROM psz_eventy_znajdzki t WHERE t.actived=1;")
    end
        for __,v in ipairs(totemki) do
            if math.random(0,100)<=procent then
                if zaladujTotemy(v,fast) then i=i+1 end
            end
        end
    outputDebugString("Zaladowano totemow: "..i.. " w "..(getTickCount()-tt).."ms")
end

addEventHandler("onResourceStart",resourceRoot,function()
  -- zaladujCzescTotemow(100,false)
end)

function totemReload(id)
    local totemki=exports["psz-mysql"]:pobierzWyniki("SELECT t.td,t.loc,t.activated FROM psz_eventy_znajdzki WHERE t.actived=1 and t.id=?;",id)
    if totemki then
        return zaladujTotemy(totemki)
    end
    return false
end


addEventHandler("onColShapeHit",resourceRoot,function(thePlayer,matchingDimension)
    local totem = getElementData(source,"totem")
    local c = getElementData(thePlayer,"character")
    if (not matchingDimension) then return end
    if (not totem) then return end
    --outputDebugString(totem.id)
    if getElementType(thePlayer) == "player" then
    if (not c) then
    outputChatBox("Tylko zalogowani gracze mogą zbierać króliczki.",thePlayer,255,0,0)
        return
    end
    local q = string.format("SELECT * FROM psz_players_eventy WHERE id_gracza=%d AND id_paczki=%d",getElementData(thePlayer,"auth:uid"),tonumber(totem.id))
    local collectTotems=exports["psz-mysql"]:pobierzWyniki(q)
    if collectTotems then outputChatBox("Zebrałeś już wcześniej tego króliczka.",thePlayer) return end
        local qq = string.format("INSERT IGNORE INTO psz_players_eventy SET id_paczki=%d,id_gracza=%d",totem.id,getElementData(thePlayer,"auth:uid"))
        local takeTotem=exports["psz-mysql"]:zapytanie(qq)
        if takeTotem >0 then
            local all= exports["psz-mysql"]:pobierzWyniki("SELECT count(id) ile FROM psz_eventy_znajdzki WHERE actived=1")
            local ilosc = exports["psz-mysql"]:pobierzWyniki(string.format("SELECT count(id_paczki) il FROM psz_players_eventy WHERE id_gracza=%d",getElementData(thePlayer,"auth:uid")))
            outputChatBox(string.format("Odnalazłeś króliczka, otrzymujesz %d$! Zebrano: %d/%d.",ilosc.il+2,ilosc.il,all.ile),thePlayer)
            givePlayerMoney(thePlayer,ilosc.il+2)
        end
    end
end
)

--local marker = createMarker(-1542.43,934.20,6.24,"cylinder", 1, 15,121,165,150)
local marker = createMarker(-1475.49,876.38,77.16,"cylinder", 1, 15, 121,165,150)
setElementDimension(marker,23)
setElementInterior(marker,21)
local t3d = createElement("ctext")
setElementData(t3d,"ctext","Odbiór nagrody\n Zbieranie króliczków")
setElementPosition(t3d,-1475.49,876.38,78.56)
setElementDimension(t3d,23)
setElementInterior(t3d,21)
addEventHandler("onMarkerHit", marker, function(el,md)
    if (not md) then return end
    if (getElementType(el) ~="player") then return end
    local uid = getElementData(el,"auth:uid") or 0
    local q = exports['psz-mysql']:pobierzWyniki(string.format("SELECT type FROM psz_eventy WHERE uid=%d",uid))
    if (q and q.type) then 
            outputChatBox("Odebrałeś już przezent.",el,255,0,0)
        return 
    end
   -- local d2 = exports['psz-mysql']:pobierzWyniki(string.format("SELECT count(id_paczki) il FROM psz_players_eventy WHERE id_gracza=%d", getElementData(el,"auth:uid")))
    --if d2.il>=150 then
    if uid == 16074 or uid == 16555 or uid == 427 or uid == 29381 or uid == 27259 or uid == 23232 or uid == 21705 or uid == 11252 or uid == 10622 or uid == 13715 or uid == 1 then  
        exports['psz-mysql']:zapytanie(string.format("INSERT INTO psz_eventy SET uid=%d, type=%d, ts=NOW()",getElementData(el,"auth:uid"),1))
        --exports['psz-mysql']:zapytanie(string.format("INSERT INTO psz_items SET item_name='Czapka Świąteczna', item_id=%d, item_subtype=1, item_owner=%d, item_usage=0;",getElementData(el,"auth:uid"), getElementData(el,"auth:uid")))
        outputChatBox("Znajdowałeś się w TOP 10 - otrzymujesz nagrodę pocieszenia: $4500.", el, 255,0,0)
        givePlayerMoney(el,4500)
    else
        outputChatBox("Nie znajdowałeś się na liście TOP 10!", el, 255,0,0)
    end

end)
