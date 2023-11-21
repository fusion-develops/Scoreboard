local Tags = {}
local open = false

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
        open = not open
        if open then 
            lib.showMenu('Scoreboard')
            CreateThread(function ()
                while open do 
                    local P = lib.getNearbyPlayers(cache.coords, 10, true)
                    local TargetPlayer = P[i]
                    local ThisGamerTag = CreateFakeMpGamerTag(TargetPlayer.ped, '\n'..GetPlayerServerId(TargetPlayer.id), false, false, '', false)
                    Tags[#Tags+1] = ThisGamerTag
                    SetMpGamerTagAlpha(ThisGamerTag, 0, 255)
                    SetMpGamerTagColour(ThisGamerTag, 0, 18 or NetworkIsPlayerTalking(TargetPlayer.id) and 19)
                    SetMpGamerTagsVisibleDistance(10.0)
                    Wait(1500)
                end
            end)
        end
    end,
    onReleased = function()
        for i = 1, #Tags do 
            local Tag = Tags[i]
            RemoveMpGamerTag(Tag)
            Tag = nil
        end 
        lib.hideMenu()

    end
})