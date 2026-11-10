-- Global Function for Notifications
function Notify(type, title, message, duration)
    SendNUIMessage({
        action = 'notify',
        type = type or 'info',
        title = title or 'Notification',
        message = message or '',
        duration = duration or (Config and Config.DefaultDuration or 5000),
        position = Config and Config.Position or 'top-right',
        useSound = not Config or Config.UseSound ~= false,
        volume = Config and Config.Volume or 0.5
    })
end

-- Export to be used by other scripts
exports('Notify', Notify)

-- Client Event Handler
RegisterNetEvent('f-notification:notify', function(type, title, message, duration)
    Notify(type, title, message, duration)
end)

-- Framework Specific Overrides
-- This part checks the config and routes system notifications to our UI
Citizen.CreateThread(function()
    -- Small delay to ensure Config is loaded
    Wait(500)
    
    if Config.Framework == "qb" then
        RegisterNetEvent('QBCore:Notify', function(text, type, length)
            Notify(type, "System", text, length)
        end)
    elseif Config.Framework == "esx" then
        RegisterNetEvent('esx:showNotification', function(msg, type, length)
            Notify(type, "System", msg, length)
        end)
    end
end) -- This closes the CreateThread