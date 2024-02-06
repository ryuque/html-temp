local Zones = {}
QBCore = exports["qb-core"]:GetCoreObject()


OpenInventory = function(stashid, weight, slots)
    local other = {}
    other.maxweight = weight -- Custom weight statsh
    other.slots = slots -- Custom slots space
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Stash_"..stashid, other)
    TriggerEvent("inventory:client:SetCurrentStash", "Stash_"..stashid)
end

OpenBossMenu = function()
    local xPlayer = QBCore.Function.GetPlayerData()
    if xPlayer.job.name == Config.Jobname and xPlayer.job.grade.level >= Config.Jobgrade then
        TriggerEvent("qb-bossmenu:client:OpenMenu")
    end
end

OnDuty = function()
    TriggerServerEvent('QBCore:ToggleDuty')
end

ProgressBar = function(duration, label)
    if lib.progressActive() == true then return false end
    lib.progressCircle({
        duration = duration,
        position = 'bottom',
        label = label,
        useWhileDead = false,
        canCancel = false
    })
end


exports['qb-target']:AddCircleZone("ryuryushopcreat".. Config.Jobname .. "BossMenu", Config.Bossmenu.Zone.coords, Config.Bossmenu.Zone.radius, {name = "ryuryushopcreat".. Config.Jobname .. "BossMenu", debugPoly = Config.Bossmenu.Zone.debug}, {
    options = {
        {
            label = Config.Bossmenu.Zone.TargetLabel,
            action = function()
                OpenBossMenu()
            end,
            job = Config.Jobname,
        }
    },
    distance = 1.0, 
})









