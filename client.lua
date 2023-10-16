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
            local Players = lib.getNearbyPlayers(GetEntityCoords(cache.ped), 25.0, false)
            for i = 1, #Players do
                local TargetPlayer = Players[i]
                local ThisGamerTag = CreateFakeMpGamerTag(GetPlayerPed(TargetPlayer), '\n'..GetPlayerServerId(TargetPlayer), false, false, '', false)
                Tags[#Tags+1] = ThisGamerTag
                SetMpGamerTagAlpha(ThisGamerTag, 0, 255)
                SetMpGamerTagColour(ThisGamerTag, 0, 18 or NetworkIsPlayerTalking(TargetPlayer) and 19)
                SetMpGamerTagsVisibleDistance(10.0)
            end
        end 
        lib.hideMenu()
        for i = 1, #Tags do 
            RemoveMpGamerTag(Tags[i])
        end 
    end,
})