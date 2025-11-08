local spawnFlowRequested = false

local function triggerSpawnFlow()
    if spawnFlowRequested then
        return
    end

    spawnFlowRequested = true

    if SetManualShutdownLoadingScreen and not GetIsLoadingScreenActive() then
        SetManualShutdownLoadingScreen(true)
    end

    if ShutdownLoadingScreen then
        ShutdownLoadingScreen()
    end

    if ShutdownLoadingScreenNui then
        ShutdownLoadingScreenNui()
    end

    TriggerEvent('fgsk-spawnwrapper:begin')
end

local function waitForSessionAndSpawn()
    CreateThread(function()
        while not NetworkIsSessionStarted() do
            Wait(250)
        end

        while not NetworkIsPlayerActive(PlayerId()) do
            Wait(250)
        end

        -- Small delay to allow any intro UI clean-up before handing off.
        Wait(500)
        triggerSpawnFlow()
    end)
end

AddEventHandler('onClientResourceStart', function(resName)
    if resName ~= GetCurrentResourceName() then
        return
    end

    waitForSessionAndSpawn()
end)

RegisterNetEvent('intro:beginSpawnFlow', function()
    triggerSpawnFlow()
end)

RegisterCommand('intro_force_spawn', function()
    triggerSpawnFlow()
end, false)
