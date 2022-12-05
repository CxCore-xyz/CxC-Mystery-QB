local QBCore = exports['qb-core']:GetCoreObject()

function Random_I_Fuc()
    return Config.Basic[math.random(#Config.Basic)]
end

function Random_GI_Fuc()
    return Config.Golden[math.random(#Config.Golden)]
end

RegisterNetEvent("G_M_P_A_F")
AddEventHandler("G_M_P_A_F", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', source, 'You opened mystery pack!', "info")  
    Citizen.Wait(5000)
    Player.Functions.AddItem(Random_I_Fuc(), 1, item.slot)
    print("Just opened an mystery pack! User: " ..Player)
    TriggerClientEvent('QBCore:Notify', source, 'Reward was added to your backpack!', "success")
end)

RegisterNetEvent("G_G_M_P_A_F")
AddEventHandler("G_G_M_P_A_F", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', source, 'You opened golden mystery pack!', "success") 
    Citizen.Wait(5000)
    Player.Functions.AddItem(Random_GI_Fuc(), 1, item.slot)
    print("Just opened an golden mystery pack! User: " ..Player)
    TriggerClientEvent('QBCore:Notify', source, 'Reward was added to your backpack!', "success")
end)

QBCore.Functions.CreateUseableItem('mpack', function(source, item)
	local src = source
        local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items['mpack'], "remove")
        TriggerEvent("G_M_P_A_F", src, item.name)
        print("Just used ^1MPACK item! User: " ..Player)
    end
end)

QBCore.Functions.CreateUseableItem('gmpack', function(source, item)
	local src = source
        local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items['gmpack'], "remove")
        TriggerEvent("G_G_M_P_A_F", src, item.name)
        print("Just used ^1GMPACK item! User: " ..Player)
    end
end)
