----------------------------------------------------------------------------------------------------
--------------------------------  PandaCore by lykos -----------------------------------------------
----------------------------------------------------------------------------------------------------
--[Pvp]
AddEventHandler("playerSpawned", function()
	NetworkSetFriendlyFireOption(true)
	SetCanAttackFriendly(PlayerPedId(), true, true)
end)

----------------------------------------------------------------------------------------------------
--------------------------------  PandaCore by lykos --------------
----------------------------------------------------------------------------------------------------

-- [no police]
Citizen.CreateThread(function()
	while true do
Citizen.Wait(0)
	local playerPed = GetPlayerPed(-1)
	local playerLocalisation = GetEntityCoords(playerPed)
ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 400.0)
	end
end)

----------------------------------------------------------------------------------------------------
--------------------------------  PandaCore by lykos --------------
----------------------------------------------------------------------------------------------------


--[No drop pnj]
function SetWeaponDrops()
	local handle, ped = FindFirstPed()
	local finished = false
repeat
	if not IsEntityDead(ped) then
	SetPedDropsWeaponsWhenDead(ped, false)
end
	finished, ped = FindNextPed(handle)
until not finished
	EndFindPed(handle)
end

Citizen.CreateThread(function()
	while true do
	SetWeaponDrops()
Citizen.Wait(500)
  end
end)



----------------------------------------------------------------------------------------------------
--------------------------------  PandaCore by lykos-------------
----------------------------------------------------------------------------------------------------

-- [Pas reticule (viseur)]
Citizen.CreateThread(function()
  local isSniper = false
	while true do
Citizen.Wait(0)
  local ped = GetPlayerPed(-1)
  local currentWeaponHash = GetSelectedPedWeapon(ped)
	if currentWeaponHash == 100416529 then
		isSniper = true
	elseif currentWeaponHash == 205991906 then
	isSniper = true
	elseif currentWeaponHash == -952879014 then
	isSniper = true
	elseif currentWeaponHash == GetHashKey('WEAPON_HEAVYSNIPER_MK2') then
	isSniper = true
else
	 isSniper = false
end
	if not isSniper then
		HideHudComponentThisFrame(14)
		end
	end
end)

----------------------------------------------------------------------------------------------------
--------------------------------  PandaCore by lykos --------------
----------------------------------------------------------------------------------------------------

-- [Blips]
local blips = {
	{title="Aeroport Cayo Perico", colour=50, id=423, x = 4464.371, y = -4503.880, z = 4.18537},
}
	Citizen.CreateThread(function()
		for _, info in pairs(blips) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, info.id)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 0.8)
		SetBlipColour(info.blip, info.colour)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(info.title)
		EndTextCommandSetBlipName(info.blip)
	end
end)

----------------------------------------------------------------------------------------------------
--------------------------------  PandaCore by lykos -----------------------------------------------
----------------------------------------------------------------------------------------------------
-- Pause Menu by PandaCore
function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

local config = {
    ["TITLE"] = "SLite | FA ",
    ["SUBTITLE"] = "SLite Roleplay",
    ["MAP"] = "Map",
    ["STATUS"] = "Status",
    ["GAME"] = "Jeux",
    ["INFO"] = "Information",
    ["SETTINGS"] = "~r~ Paramêtre",
    ["R*EDITOR"] = "EDITOR"
}

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        N_0xb9449845f73f5e9c("SHIFT_CORONA_DESC")
        PushScaleformMovieFunctionParameterBool(true)
        PopScaleformMovieFunction()
        N_0xb9449845f73f5e9c("SET_HEADER_TITLE")
        PushScaleformMovieFunctionParameterString(config["TITLE"])
        PushScaleformMovieFunctionParameterBool(true)
        PushScaleformMovieFunctionParameterString(config["SUBTITLE"])
        PushScaleformMovieFunctionParameterBool(true)
        PopScaleformMovieFunctionVoid()
    end
end)

Citizen.CreateThread(function()
    AddTextEntry('PM_SCR_MAP', config["MAP"])
    AddTextEntry('PM_SCR_STA', config["STATUS"])
    AddTextEntry('PM_SCR_GAM', config["GAME"])
    AddTextEntry('PM_SCR_INF', config["INFO"])
    AddTextEntry('PM_SCR_SET', config["SETTINGS"])
    AddTextEntry('PM_SCR_RPL', config["R*EDITOR"])
end)
 

----------------------------------------------------------------------------------------------------
--------------------------------  PandaCore by lykos --------------
----------------------------------------------------------------------------------------------------

-- [MODE DRIFT]
local kmh = 3.6
local mph = 2.23693629
local carspeed = 0
local driftmode = true
local speed = kmh
local drift_speed_limit = 120.0
local toggle = 21 -- touche
Citizen.CreateThread(function()
	while true do
Citizen.Wait(1)
	if IsControlJustPressed(1, 118) then
		driftmode = not driftmode
	if driftmode then
         TriggerEvent("chatMessage", 'DRIFT', { 255,255,255}, '^2ON')
    else
         TriggerEvent("chatMessage", 'DRIFT', { 255,255,255}, '^1OFF')
     end
  end
	if driftmode then
		if IsPedInAnyVehicle(GetPed(), false) then
			CarSpeed = GetEntitySpeed(GetCar()) * speed
		if GetPedInVehicleSeat(GetCar(), -1) == GetPed() then
			if CarSpeed <= drift_speed_limit then
		if IsControlPressed(1, 21) then
        	SetVehicleReduceGrip(GetCar(), true)
         else
        	SetVehicleReduceGrip(GetCar(), false)
        			   end
                    end
                end
            end
        end
    end
end)

function GetPed() return GetPlayerPed(-1) end
function GetCar() return GetVehiclePedIsIn(GetPlayerPed(-1),false) end

----------------------------------------------------------------------------------------------------
--------------------------------  PandaCore by lykos------------------------------------------------
----------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        SetDiscordAppId(1127722170458579055)
        SetDiscordRichPresenceAsset('logo')
        SetDiscordRichPresenceAssetText('🧡Base Template by Panda')
        SetDiscordRichPresenceAssetSmall('logo')
        SetDiscordRichPresenceAssetSmallText('💛BaseTemplate')
        SetDiscordRichPresenceAction(0, "💛Discord exemple!", "https://discord.gg/")
        SetDiscordRichPresenceAction(1, "👻Se Connecter", "fivem://connect/localhost:30120")
        -- Seconde par minute 
        Citizen.Wait(60000)
    end
end)
Citizen.CreateThread(function()
    while true do
        local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
        if VehName == "NULL" then VehName = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))) end
        local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
        local StreetHash = GetStreetNameAtCoord(x, y, z)
        local pId = GetPlayerServerId(PlayerId())
        local pName = GetPlayerName(PlayerId())
        Citizen.Wait(15000)
        if StreetHash ~= nil then
            StreetName = GetStreetNameFromHashKey(StreetHash)
            if IsPedOnFoot(PlayerPedId()) and not IsEntityInWater(PlayerPedId()) then
                if IsPedSprinting(PlayerPedId()) then
                    SetRichPresence("ID: "..pId.." | "..pName.." court sur "..StreetName)
                elseif IsPedRunning(PlayerPedId()) then
                    SetRichPresence("ID: "..pId.." | "..pName.." s'épuise sur "..StreetName)
                elseif IsPedWalking(PlayerPedId()) then
                    SetRichPresence("ID: "..pId.." | "..pName.." marche sur "..StreetName)
                elseif IsPedStill(PlayerPedId()) then
                    SetRichPresence("ID: "..pId.." | "..pName.." est debout sur "..StreetName.."")
                end
            elseif GetVehiclePedIsUsing(PlayerPedId()) ~= nil and not IsPedInAnyHeli(PlayerPedId()) and not IsPedInAnyPlane(PlayerPedId()) and not IsPedOnFoot(PlayerPedId()) and not IsPedInAnySub(PlayerPedId()) and not IsPedInAnyBoat(PlayerPedId()) then
                local MPH = math.ceil(GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId())) * 2.236936)
                if MPH > 50 then
                    SetRichPresence("ID: "..pId.." | "..pName.." accélère sur "..StreetName.." à "..MPH.."KM/H dans un(e) "..VehName)
                elseif MPH <= 50 and MPH > 0 then
                    SetRichPresence("ID: "..pId.." | "..pName.." est en croisière vers "..StreetName.." à "..MPH.."KM/H dans un(e) "..VehName)
                elseif MPH == 0 then
                    SetRichPresence("ID: "..pId.." | "..pName.." est garé sur "..StreetName.." dans un(e) "..VehName)
                end
            elseif IsPedInAnyHeli(PlayerPedId()) or IsPedInAnyPlane(PlayerPedId()) then
                if IsEntityInAir(GetVehiclePedIsUsing(PlayerPedId())) or GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) > 5.0 then
                    SetRichPresence("ID: "..pId.." | "..pName.." est en train de survoler "..StreetName.." dans un(e) "..VehName)
                else
                    SetRichPresence("ID: "..pId.." | "..pName.." à atterri sur "..StreetName.." dans un(e) "..VehName)
                end
            elseif IsEntityInWater(PlayerPedId()) then
                SetRichPresence("ID: "..pId.." | "..pName.." nage")
            elseif IsPedInAnyBoat(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
                SetRichPresence("ID: "..pId.." | "..pName.." navigue dans un "..VehName)
            elseif IsPedInAnySub(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
                SetRichPresence("ID: "..pId.." | "..pName.." est dans un sous-marin jaune")
            end
        end
    end
end)
----------------------------------------------------------------------------------------------------
--------------------------------  PandaCore by lykos ----------------------------------------------
----------------------------------------------------------------------------------------------------
--- Retirer les policier 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(375)
        local myCoords = GetEntityCoords(GetPlayerPed(-1))
        ClearAreaOfCops(myCoords.x, myCoords.y, myCoords.z, 100.0, 0)
    end
end)

Citizen.CreateThread(function()
    for i = 1, 12 do
        Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300)

        if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
    end
end)

-- Retirer les drop arme pnj 
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    -- List of pickup hashes (https://pastebin.com/8EuSv2r1)
    RemoveAllPickupsOfType(0xDF711959) -- carbine rifle
    RemoveAllPickupsOfType(0xF9AFB48F) -- pistol
    RemoveAllPickupsOfType(0xA9355DCD) -- pumpshotgun
  end
end)

