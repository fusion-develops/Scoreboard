lib.addKeybind({
    name = 'Scoreboard',
    description = 'U To Open Scoreboard',
    defaultKey = 'U',
    onPressed = function()
        local Players = lib.callback.await('GetScoreboard', false)
        lib.registerMenu({
            id = 'Scoreboard',
            position = 'bottom-right',
            title = 'Scoreboard',
            options = Players
        })

        lib.showMenu('Scoreboard')
        local Tags = {}
        while IsControlPressed(0, 303) do 
            Wait(1000)
            local Players = GetActivePlayers()
            for i = 1, #Players do
                local TargetPlayer = Players[i]
                if TargetPlayer ~= cache.playerId then
                    local ThisGamerTag = CreateFakeMpGamerTag(GetPlayerPed(TargetPlayer), '\n'..GetPlayerServerId(TargetPlayer), false, false, '', false)
                    Tags[#Tags+1] = ThisGamerTag
                    if NetworkIsPlayerTalking(TargetPlayer) then
                        SetMpGamerTagAlpha(ThisGamerTag, 0, 255)
                        SetMpGamerTagColour(ThisGamerTag, 0, 18)
                    else
                        SetMpGamerTagAlpha(ThisGamerTag, 0, 150)
                        SetMpGamerTagColour(ThisGamerTag, 0, 19)
                    end
                    SetMpGamerTagsVisibleDistance(10.0)
                end
            end
        end 
        lib.hideMenu()
        for i = 1, #Tags do 
            RemoveMpGamerTag(Tags[i])
        end 
    end,
})