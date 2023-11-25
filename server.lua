local Players = {}

RegisterNetEvent('esx:playerLoaded', function(_, xPlayer)
    Players[#Players+1] = {
        source = xPlayer.source,
        label = xPlayer.getName().. ' ['..xPlayer.source..']',
        close = false
    }
end)

RegisterNetEvent('esx:playerDropped', function(source)
    for i = 1, #Players do 
        local Player = Players[i]
        if Player.source == source then 
                Players[i] = nil
            break
        end
    end 
end)

lib.callback.register('GetScoreboard', function ()
    return Players
end)