# No Friendly-Fire

## PayPal
[Donate to Motivate](https://paypal.me/Psyk0tikism?locale.x=en_US)

## License
> The following license is placed inside the source code of the plugin.

No Friendly-Fire: a L4D/L4D2 SourceMod Plugin
Copyright (C) 2022  Alfred "Psyk0tik" Llagas

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

## About
Disables friendly-fire.

## Credits
**cravenge** - For the original source code; fixing all the errors and converting the original source code into the new syntax in this [post](https://forums.alliedmods.net/showthread.php?t=301873).

**Lux/LuxLuma** - For the previous source code; showed me a better and simpler way of handling friendly fire.

**Silvers (Silvershot)** - For the code that allows users to enable/disable the plugin in certain game modes and for blocking damage after idle/spectator team change and player disconnects.

**Kr3m, WhatsAnName** - For reporting an issue.

**SourceMod Team** - For continually updating/improving `SourceMod`.

## Requirements
1. `SourceMod 1.9` or higher
2. Recommended: [[L4D & L4D2] Explosive Chains Credit](https://forums.alliedmods.net/showthread.php?t=334655)
3. Recommended: [[L4D & L4D2] Left 4 DHooks Direct](https://forums.alliedmods.net/showthread.php?t=321696)

## Notes
1. I do not provide support for listen/local servers but the plugin should still work properly on them.
2. I will not help you with installing or troubleshooting problems on your part.
3. If you get errors from SourceMod itself, that is your problem, not mine.
4. MAKE SURE YOU MEET ALL THE REQUIREMENTS AND FOLLOW THE INSTALLATION GUIDE PROPERLY.

## Features
1. Block friendly-fire for survivors.
2. Block friendly-fire for special infected.
3. Filter which damage types to allow/block.

## ConVar Settings
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
// Requires "Left 4 DHooks Direct": https://forums.alliedmods.net/showthread.php?t=321696
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

## Installation
1. Delete files from old versions of the plugin.
3. Place `no_friendly-fire.smx` in the `addons/sourcemod/plugins` folder.
4. Place `no_friendly-fire.sp` in the `addons/sourcemod/scripting` folder.

## Uninstalling/Upgrading to Newer Versions
1. Delete `no_friendly-fire.sp` from the `addons/sourcemod/scripting` folder.
2. Delete `no_friendly-fire.smx` from the `addons/sourcemod/plugins` folder.
4. Follow the Installation guide above. (Only for upgrading to newer versions.)

## Disabling
1. Move `no_friendly-fire.smx` to the `plugins/disabled` folder.
2. Unload `No Friendly-Fire` by typing `sm plugins unload no_friendly-fire` in the server console.

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

## Third-Party Revisions Notice
If you would like to share your own revisions of this plugin, please rename the files so that there is no confusion for users.

## Final Words
Enjoy all my hard work and have fun with it!