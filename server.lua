local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('oxToQbTargetSystem:getPlayerData', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        cb(Player.PlayerData)
    else
        cb(nil)
    end
end)

RegisterNetEvent('oxToQbTargetSystem:setupTarget')
AddEventHandler('oxToQbTargetSystem:setupTarget', function(entity, options)
    TriggerClientEvent('oxToQbTargetSystem:setupTarget', -1, entity, options)
end)