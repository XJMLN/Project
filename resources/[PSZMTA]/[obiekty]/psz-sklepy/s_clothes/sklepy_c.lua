--[[
Sklepy z odzieza

@author Jakub 'XJMLN' Starzak <jack@pszmta.pl
@package PSZMTA.gracz-sklep_odziezowy
@copyright Jakub 'XJMLN' Starzak <jack@pszmta.pl>
@contents Kacper "SzaG" Budak <szag@pszmta.pl>

Nie mozesz uzywac tego skryptu bez mojej zgody. Napisz - byc moze sie zgodze na uzycie.

]]--
local s_active = nil
local i = 1
local sw, sh = guiGetScreenSize()
local tWidth = dxGetTextWidth("Wciśnij strzałkę w lewo lub prawo aby poruszać się po menu. Wciśńij klawisz ENTER aby zakończyć.")
local type1_skinlist = {
	-- id, nazwa
	{11,"Człowiek z maską"},
	{14,"Joker"},
	{18,"Człowiek 'Steve' "},
	{20,"FBI"},
	--{21,"Człowiek w laczkach"},
	{22,"Luzak"},
	--{23,"Człowiek w dresach"},
	{24,"Czarnuch w sweterku"},
	{25,"Człowiek z czerwoną chustą"},
	{26,"Meksykanin"},
	{30,"Człowiek z niebieską chustą"},
	{32,"Lamar Davis"},
	{33,"Brooke Scott"},
	{40,"Kobieta"},
	{44,"Alan Walker"},
	{51,"Człowiek w niebieskiej koszuli"},
	{52,"Vito Scaletta"},
	{53,"Kobieta w okularach"},
	{54,"Kobieta w bluzie"},
	{59,"Człowiek w bluzie"},
	{79,"Teletubiś"},
	{80,"Grubas w bluzie"},
	{81,"Człowiek z tatuażami"},
	{82,"Wojskowa kobieta"},
	{83,"OBEY man"},
	{85,"Czarnuch w czapce NY"},
	{98,"ważniak"},
	{100,"Ballas"},	
	{104,"Ballas"},	
	{105,"Czarnuch z Grove"},	
	{108,"roznegliżowana dziołcha"},
	{120,"Człowiek renifer"},
	{121,"Człowiek z czapką"},
	{123,"Wietnamczyk"},
	{191,"Naruto"},	
	{246,"Klubowiczka"},	
	{254,"Motocyklista"},	
	
}


local function renderMainMenu()
	if (not s_active.active) then return end
	dxDrawImage(0,sh-256, 256/2, 256/2, "s_clothes/i/a_left.png")
	dxDrawImage(sw-256/2,sh-256, 256/2, 256/2, "s_clothes/i/a_right.png")
	if getTickCount()-s_active.ts<15000 then 
		local alpha = 1
		if (getTickCount()-s_active.ts>(5000-1000)) then 
			alpha = interpolateBetween(0,0,0,255,0,0,(getTickCount()-s_active.ts/500),"InQuad")
		end

		dxDrawText(s_active.descr,sw/2 - dxGetTextWidth(s_active.descr)/2,sh/2 - 50,250,250,tocolor(255,255,255,255*alpha))
	end
	dxDrawText("Wciśnij strzałkę w lewo lub prawo aby poruszać się po menu. Wciśnij klawisz ENTER aby zakończyć.",(sw/2 - tWidth/2), sh - 50,(sw/2 - tWidth/2), 50)
end

local function goRightSkin()
	if i>=#type1_skinlist then return end
	i=i+1 
	s_active = {active = true, descr = type1_skinlist[i][2], ts = getTickCount()}
	setElementModel(getLocalPlayer(),type1_skinlist[i][1])
end

local function goLeftSkin()
	if i == 0 or i == 1 then i = 1 return end
	i=i-1
	s_active = {active = true, descr = type1_skinlist[i][2], ts = getTickCount()}
	setElementModel(getLocalPlayer(),type1_skinlist[i][1])
end

function onPlayerEndShopping(plr,sid)
	if (not plr) then return end
	unbindKey("arrow_r","down",goRightSkin)
	unbindKey("arrow_l","down",goLeftSkin)
	unbindKey("enter","down",acceptOwnedSkin)
	removeEventHandler("onClientRender",root, renderMainMenu)
	s_active = nil
	i = 1
	triggerServerEvent("onPlayerRequestEnd",localPlayer, plr, tonumber(sid))
end
local function acceptOwnedSkin()
	if s_active and s_active.active then 
		local owned_skin = type1_skinlist[i][1]
		local owned_skin_desc = type1_skinlist[i][2]
		outputChatBox("Zmieniono wygląd postaci na "..owned_skin_desc..".",255,0,0)
		setElementModel(getLocalPlayer(),owned_skin)
		local c= getElementData(getLocalPlayer(),"character")
		if (not c or not c.skin) then return end
		c.skin = owned_skin
		setElementData(getLocalPlayer(),"character",c)
		fadeCamera(false)
		setCameraTarget(getLocalPlayer())
		setElementFrozen(getLocalPlayer(),false)
		setElementInterior(getLocalPlayer(),3)
		setElementDimension(getLocalPlayer(),0)
		showChat(true)
		showPlayerHudComponent("all",true)
		toggleAllControls(true)
		fadeCamera(true)
		onPlayerEndShopping(getLocalPlayer(),owned_skin)
	end
end

local function createChangeroomPerPlayer(plr)
	if (not plr == getLocalPlayer()) then return end
	fadeCamera(false)
	setElementFrozen(plr,true)
	showChat(false)
	showPlayerHudComponent("all",false)
	setElementPosition(plr,198.8,-127.64,1003.52)
	setElementRotation(plr,0,0,180)
	setElementDimension(plr,getElementData(plr,"id")*251)
	setCameraMatrix(198.94,-130.48,1005.52,198.93,-127.29,1004,0,0)
	toggleAllControls(false,true,true)
	setElementModel(plr,11)
end


addEvent("onPlayerHitShopMarker", true)
addEventHandler("onPlayerHitShopMarker", root, function()
	local c = getElementData(source,"character")
	if (not c or not c.skin) then return end 
	createChangeroomPerPlayer(source)
	setTimer(function() 
	
	bindKey("arrow_r","down",goRightSkin)
	bindKey("arrow_l","down",goLeftSkin)
	bindKey("enter","down",acceptOwnedSkin)
	local sd = type1_skinlist[i][2]
	s_active = {active = true, descr = sd, ts = getTickCount()}
	
	addEventHandler("onClientRender", root, renderMainMenu)
	fadeCamera(true)
	end,1500,1)
end)