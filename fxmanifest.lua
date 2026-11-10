fx_version 'cerulean'
game 'gta5'

author 'Mafia Talha'
description 'F-Notification - Modern Notification System'
version '1.0.0'

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/style.css',
    'web/script.js',
    'web/sounds/notify.mp3'
}

client_scripts {
    'config.lua',
    'client/main.lua'
}

server_scripts {
    'config.lua',
    'server/main.lua'
}

exports {
    'Notify'
}

lua54 'yes'