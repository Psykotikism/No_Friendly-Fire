# Changelog

## Version 10.0 (June 1, 2022)

1. Bug fixes:

- Fixed compilation errors on `SM 1.10` regarding `Left 4 DHooks Direct`.
- Fixed `OnMapEnd` not triggering due to a typo.
- Added notification flag to the `nff_disabledgamemodes` convar.
- Added notification flag to the `nff_enabledgamemodes` convar.

2. Changes:

- The `nff_saferoomonly` convar is now only available when `Left 4 DHooks Direct` is installed.

## Version 9.5 (February 20, 2022)

1. Bug fixes:

- Fixed issues where certain special infected cannot suicide because of the friendly-fire block. (Thanks to `WhatsAnName` for testing and reporting!)

## Version 9.0 (October 10, 2021)

1. Bug fixes:

- Fixed game mode changes not being hooked and cached.

2. Changes:

- Added notification flags to each convar.
- Made the `nff_pluginversion` convar unchangeable outside of the source code.

## Version 8.5 (September 3, 2021)

1. Bug fixes:

- Fixed late-load error regarding invalid entities. (Thanks to `Kr3m` for reporting!)

2. Changes:

- Improved logic to catch possible exploits with gascan friendly-fire.

## Version 8.0 (December 9, 2020)

1. Bug fixes:

- Fixed damage from infected to survivors being blocked due to team check even if attacker was never on survivor team.

2. Changes:

- Added the `nff_saferoomonly` convar. (Requested by `lunatixxx`.)

## Version 7.5 (October 25, 2020)

1. Changes:

- Added multiple settings to determine which damage types to block and which teams to block friendly-fire for.

## Version 7.0 (October 14, 2020)

1. Changes:

- No longer relies on convars to block friendly-fire.
- Fire damage is now blocked without blocking all fires. (Thanks to `Silvers` for the code!)
- Blocked idle/spectator team change and player disconnect exploits. (Thanks to `Silvers` for the code!)
- Added the `nff_gamemodetypes` convar. (Thanks to `Silvers` for the code!)

## Version 6.5 (June 21, 2018)

1. Changes:

- Optimized code a bit.

## Version 6.0 (June 18, 2018)

1. Bug fixes:

- Fixed the `nff_enabledgamemodes` and `nff_disabledgamemodes` convars not working properly.

## Version 5.5 (June 16, 2018)

1. Bug fixes:

- Fixed the `nff_enabledgamemodes` and `nff_disabledgamemodes` convars not working properly.

## Version 5.0 (June 10, 2018)

1. Major code optimization.
2. Hid the `nff_pluginversion` convar.

## Version 4.0 (January 12, 2018)

1. Added support for other game modes.
2. Code optimization.
3. Renamed the source code and `.cfg` files.

## Version 3.0 (December 8, 2017)

1. Used a completely different code.
2. Added a check for game mode.

## Version 2.0 (November 25, 2017)

1. Implemented cravenge's entity reference check and explosive barrel check.
2. Removed cvar `l4d_friendlyfire_fire`.
3. Hid cvar `l4d_friendlyfire_version` and renamed it to `l4d_nff_version`.
4. Renamed cvar `l4d_friendlyfire` to `l4d_nff`.
5. Fire from explosive barrels no longer damage players (but the explosion still does).
6. Molotovs thrown by players that then switch teams or disconnect no longer do damage.

## Version 1.0 (November 12, 2017)

Initial Release.