# OxToQbTarget

Convert ox_target to qb-target in FiveM with ease.

## Features

- Convert ox_target interactions to qb-target
- Debug mode to visualize target entities

## Requirements

- FiveM server
- QB-Core framework
- qb-target resource

## Installation

1. Download the script from the [GitHub repository](https://github.com/EnderDevelopment/ox-to-qb-target).
2. Extract the files into your FiveM resources folder.
3. Add `ensure ox-to-qb-target` to your server.cfg file.

## Usage

### Client-side

To set up a target entity, use the following event:

```lua
TriggerEvent('oxToQbTargetSystem:setupTarget', entity, options)
```

### Server-side

To set up a target entity from the server, use the following event:

```lua
TriggerClientEvent('oxToQbTargetSystem:setupTarget', -1, entity, options)
```

### Configuration

Edit the `config.lua` file to adjust settings:

```lua
Config = {}

-- Target settings
Config.Target = {
    Distance = 2.5,
    Width = 0.5,
    Height = 0.5,
    Debug = false
}

-- QB-Core settings
Config.QBCore = {
    Framework = 'qb-core',
    PlayerData = 'PlayerData'
}
```

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=ox-to-qb-target&utm_content=bottom) — describe it in one sentence and get the full source code.
