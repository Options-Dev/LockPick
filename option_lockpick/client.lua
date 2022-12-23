local Promise = nil

RegisterNUICallback('close', function()
    TriggerScreenblurFadeOut(1000)
    SetNuiFocus(false, false)
    Promise:resolve(false)
end)

RegisterNUICallback('succeed', function()
    TriggerScreenblurFadeOut(1000)
    SetNuiFocus(false, false)
    Promise:resolve(true)
end)

RegisterNUICallback('failed', function()
    TriggerScreenblurFadeOut(1000)
    SetNuiFocus(false, false)
    Promise:resolve(false)
end)

-- RegisterCommand('lockpicktry', function()
--     local result = exports['lockpick']:startLockpick()
--     print(result, 'lockpicking result')
-- end)

exports('startLockpick', function(tries)
    TriggerScreenblurFadeIn(1000)
    SendNUIMessage({
        start = true,
        tries = tries
    })
    SetNuiFocus(true, true)

    Promise = promise.new()

    local result = Citizen.Await(Promise)
    return result
end)

-- RegisterCommand('lockpicktry', function()
--     local result = exports['option_lockpick']:startLockpick()
--     print(result, 'lockpicking result')
-- end)