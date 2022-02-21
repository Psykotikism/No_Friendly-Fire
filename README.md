# No Friendly-Fire

## PayPal
[Donate to Motivate](https://paypal.me/Psyk0tikism?locale.x=en_US)

## License
> The following license is placed inside the source code of the plugin.
No Friendly-Fire: a L4D/L4D2 SourceMod Plugin
Copyright (C) 2021  Alfred "Psyk0tik" Llagas

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

## About
Disables friendly fire.

## Requirements
1. `SourceMod 1.9` or higher
2. Recommended: [[L4D & L4D2] Explosive Chains Credit](https://forums.alliedmods.net/showthread.php?t=334655)

## Installation
1. Delete files from old versions of the plugin.
2. Extract the folder inside the .zip file.
3. Place all the contents into their respective folders.
4. If prompted to replace or merge anything, click yes.
5. Load up `No Friendly-Fire` by doing one of the following:
- Type `sm_rcon sm plugins unload "no_friendly-fire"` in console.
- Restart the server.
6. Customize `No Friendly-Fire` (Config file generated on first load).

## Uninstalling/Upgrading to Newer Versions
1. Delete `no_friendly-fire.smx` from `addons/sourcemod/plugins` folder.
2. Delete `no_friendly-fire.sp` from `addons/sourcemod/scripting` folder.
3. Delete `no_friendly-fire.cfg` from `cfg/sourcemod` folder.
4. Follow the Installation guide above. (Only for upgrading to newer versions.)

## Disabling
1. Move `no_friendly-fire.smx` to `plugins/disabled` folder.
2. Unload `No Friendly-Fire` by doing one of the following:
- Type `sm_rcon sm plugins unload "no_friendly-fire"` in console.
- Restart the server.

## Configuration Variables (ConVars/CVars)
```
// Block explosive damage?
// 0: OFF
// 1: ON
// -
// Default: "1"
// Minimum: "0.000000"
// Maximum: "1.000000"
nff_blockexplosions "1"

// Block fire damage?
// 0: OFF
// 1: ON
// -
// Default: "1"
// Minimum: "0.000000"
// Maximum: "1.000000"
nff_blockfires "1"

// Block bullet damage?
// 0: OFF
// 1: ON
// -
// Default: "1"
// Minimum: "0.000000"
// Maximum: "1.000000"
nff_blockguns "1"

// Block melee damage?
// 0: OFF
// 1: ON
// -
// Default: "1"
// Minimum: "0.000000"
// Maximum: "1.000000"
nff_blockmelee "1"

// Disable the No Friendly-Fire in these game modes.
// Game mode limit: 16
// Character limit for each game mode: 32
// Empty: None
// Not empty: Disabled in these game modes.
// -
// Default: ""
nff_disabledgamemodes ""

// Enable the plugin?
// 0: OFF
// 1: ON
// -
// Default: "1"
// Minimum: "0.000000"
// Maximum: "1.000000"
nff_enable "1"

// Enable the No Friendly-Fire in these game modes.
// Game mode limit: 16
// Character limit for each game mode: 32
// Empty: None
// Not empty: Enabled in these game modes.
// -
// Default: ""
nff_enabledgamemodes ""

// Enable the No Friendly-Fire in these game mode types.
// 0 OR 15: ALL
// 1: Co-op
// 2: Versus
// 3: Survival
// 4: Scavenge
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "15.000000"
nff_gamemodetypes "0"

// Disable Infected team friendly-fire?
// 0: OFF
// 1: ON
// -
// Default: "1"
// Minimum: "0.000000"
// Maximum: "1.000000"
nff_infected "1"

// Only block friendly-fire when all survivors are still inside the saferoom.
// 0: OFF
// 1: ON
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
nff_saferoomonly "0"

// Disable Survivors team friendly-fire?
// 0: OFF
// 1: ON
// -
// Default: "1"
// Minimum: "0.000000"
// Maximum: "1.000000"
nff_survivors "1"
```

## Questions You May Have
> If you have any questions that aren't addressed below, feel free to message me or post on this [thread](https://forums.alliedmods.net/showthread.php?t=302822).

1. How do I enable/disable the plugin in certain game modes?

You must specify the game modes in the `nff_enabledgamemodes` and `nff_disabledgamemodes` convars.

Here are some scenarios and their outcomes:

- Scenario 1
```
nff_gamemodetypes "0" // The plugin is enabled in all game mode types.
nff_enabledgamemodes "" // The plugin is enabled in all game modes.
nff_disabledgamemodes "coop" // The plugin is disabled in "coop" mode.

Outcome: The plugin works in every game mode except "coop" mode.
```
- Scenario 2
```
nff_gamemodetypes "1" // The plugin is enabled in every Campaign-based game mode.
nff_enabledgamemodes "coop" // The plugin is enabled in only "coop" mode.
nff_disabledgamemodes "" // The plugin is not disabled in any game modes.

Outcome: The plugin works only in "coop" mode.
```
- Scenario 3
```
nff_gamemodetypes "5" // The plugin is enabled in every Campaign-based and Survival-based game mode.
nff_enabledgamemodes "coop,versus" // The plugin is enabled in only "coop" and "versus" mode.
nff_disabledgamemodes "coop" // The plugin is disabled in "coop" mode.

Outcome: The plugin works only in "coop" mode.
```

## Credits
**cravenge** - For the original source code; fixing all the errors and converting the original source code into the new syntax in this [post](https://forums.alliedmods.net/showthread.php?t=301873).

**Lux/LuxLuma** - For the previous source code; showed me a better and simpler way of handling friendly fire.

**Silvers (Silvershot)** - For the code that allows users to enable/disable the plugin in certain game modes and for blocking damage after idle/spectator team change and player disconnects.

**Kr3m, WhatsAnName** - For reporting an issue.

# Contact Me
If you wish to contact me for any questions, concerns, suggestions, or criticism, I can be found here:
- [AlliedModders Forum](https://forums.alliedmods.net/member.php?u=181166) (Use this for just reporting bugs/issues or giving suggestions/ideas.)
- [Steam](https://steamcommunity.com/profiles/76561198056665335) (Use this for getting to know me or wanting to be friends with me.)
- `Psyk0tik#6898` on Discord (Use this for pitching in new/better code.)

# 3rd-Party Revisions Notice
If you would like to share your own revisions of this plugin, please rename the files! I do not want to create confusion for end-users and it will avoid conflict and negative feedback on the official versions of my work. If you choose to keep the same file names for your revisions, it will cause users to assume that the official versions are the source of any problems your revisions may have. This is to protect you (the reviser) and me (the developer)! Thank you!