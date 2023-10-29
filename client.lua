local Tags = {}

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
        CreateThread(function ()
            while IsControlPressed(0, 303) do 
                local Players = lib.getNearbyPlayers(GetEntityCoords(cache.ped), 25.0, false)
                for i = 1, #Players do
                    local TargetPlayer = Players[i]
                    local ThisGamerTag = CreateFakeMpGamerTag(TargetPlayer.ped, '\n'..GetPlayerServerId(TargetPlayer.id), false, false, '', false)
                    Tags[#Tags+1] = ThisGamerTag
                    SetMpGamerTagAlpha(ThisGamerTag, 0, 255)
                    SetMpGamerTagColour(ThisGamerTag, 0, 18 or NetworkIsPlayerTalking(TargetPlayer.id) and 19)
                    SetMpGamerTagsVisibleDistance(10.0)
                end
            Wait(1000)
            end 
        end)

    end,
    onReleased = function()
        for i = 1, #Tags do 
            RemoveMpGamerTag(Tags[i])
            Tags[i] = nil
        end 
        lib.hideMenu()

    end
})