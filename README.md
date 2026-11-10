# FS Notification

A clean, lightweight notification UI for FiveM. Works with ESX, QBCore, or standalone, and replaces the default framework notifications automatically.

## Features
- 4 styles: `info`, `success`, `warning`, `error`
- 6 screen positions
- Optional sound with adjustable volume
- Auto-detects ESX or QBCore and takes over their notifications
- Client and server exports

## Installation
1. Put the folder in your `resources` directory and name it `fs-notification`.
2. Add `ensure fs-notification` to your `server.cfg` (after your framework).
3. Adjust `config.lua` to taste.

## Usage

**Client side**
```lua
exports['fs-notification']:Notify('success', 'Garage', 'Vehicle stored', 5000)
```

**Server side**
```lua
exports['fs-notification']:Notify(source, 'error', 'Bank', 'Not enough money', 5000)
```

**Client event**
```lua
TriggerEvent('f-notification:notify', 'info', 'Title', 'Message', 5000)
```

## Config
| Option | Description |
|---|---|
| `Config.Position` | `top-right`, `top-left`, `bottom-right`, `bottom-left`, `top-center`, `bottom-center` |
| `Config.DefaultDuration` | Time on screen in ms |
| `Config.UseSound` / `Config.Volume` | Notification sound |
| `Config.Themes` | Colour and Font Awesome icon per type |

## License
MIT — see [LICENSE](LICENSE). Made by FS Labs.
