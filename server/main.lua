-- Server-side helper: send a notification to one player (or -1 for everyone).
-- Usage from another server script:
--   exports['fs-notification']:Notify(source, 'success', 'Paid', 'You received $500', 5000)
local function Notify(target, type, title, message, duration)
    TriggerClientEvent('f-notification:notify', target, type, title, message, duration)
end

exports('Notify', Notify)
