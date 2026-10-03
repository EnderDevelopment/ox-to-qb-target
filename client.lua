local QBCore = exports['qb-core']:GetCoreObject()

local function SetupTarget(entity, options)
    if not entity or not options then return end
    
    local targetOptions = {
        {
            name = options.name or 'default',
            label = options.label or 'Interact',
            icon = options.icon or 'fas fa-hand-pointer',
            action = function(entity)
                if options.event then
                    TriggerEvent(options.event, entity)
                elseif options.serverEvent then
                    TriggerServerEvent(options.serverEvent, entity)
                end
            end,
            canInteract = function(entity, distance, coords, name, bone)
                return distance < (Config.Target.Distance or 2.5)
            end
        }
    }
    
    exports['qb-target']:AddTargetEntity(entity, {
        options = targetOptions,
        distance = Config.Target.Distance or 2.5
    })
end

RegisterNetEvent('oxToQbTargetSystem:setupTarget')
AddEventHandler('oxToQbTargetSystem:setupTarget', function(entity, options)
    SetupTarget(entity, options)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if Config.Target.Debug then
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            local entity = GetEntityInFrontOfPlayer(playerPed, Config.Target.Distance or 2.5)
            
            if entity and DoesEntityExist(entity) then
                DrawText3D(coords.x, coords.y, coords.z + 0.5, 'Entity: ' .. entity)
            end
        end
    end
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry('STRING')
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end

function GetEntityInFrontOfPlayer(playerPed, distance)
    local coords = GetEntityCoords(playerPed)
    local forwardVector = GetEntityForwardVector(playerPed)
    local rayHandle = StartShapeTestRay(coords.x, coords.y, coords.z, coords.x + forwardVector.x * distance, coords.y + forwardVector.y * distance, coords.z + forwardVector.z * distance, -1, playerPed, 0)
    local _, _, _, _, entity = GetShapeTestResult(rayHandle)
    
    return entity
end