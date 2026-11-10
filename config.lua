Config = {}

-- Positioning: 'top-right', 'top-left', 'bottom-right', 'bottom-left', 'top-center', 'bottom-center'
Config.Position = 'top-right'

Config.DefaultDuration = 5000 -- In milliseconds
Config.UseSound = true
Config.Volume = 0.5

Config.Framework = "esx" -- "esx", "qb", or "standalone"
-- Auto-detection logic:
Citizen.CreateThread(function()
    if GetResourceState('es_extended') == 'started' then
        Config.Framework = "esx"
    elseif GetResourceState('qb-core') == 'started' then
        Config.Framework = "qb"
    end
end)

Config.Themes = {
    ['info'] = {
        color = '#3498db',
        icon = 'fa-solid fa-circle-info'
    },
    ['success'] = {
        color = '#2ecc71',
        icon = 'fa-solid fa-circle-check'
    },
    ['warning'] = {
        color = '#f1c40f',
        icon = 'fa-solid fa-triangle-exclamation'
    },
    ['error'] = {
        color = '#e74c3c',
        icon = 'fa-solid fa-circle-xmark'
    }
}