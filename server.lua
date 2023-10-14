local function GetPlayersForScoreboard()
    local Players = {}
    local xPlayers = ESX.GetExtendedPlayers()
    for i = 1, #xPlayers do 
        local xPlayer = xPlayers[i]
        Players[#Players+1] = {
            label = xPlayer.name.. 'ID: ('.. xPlayer.source.. ')',
            close = false 
        }
    end 
    return Players 
end


lib.callback.register('GetScoreboard', GetPlayersForScoreboard)