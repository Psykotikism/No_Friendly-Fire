# Changelog

## Version 7.0 (October 14, 2020)

1. Changes:

- No longer relies on convars to block friendly-fire.
- Fire damage is now blocked without blocking all fires. (Thanks to Silvers for the code!)
- Blocked idle/spectator team change and player disconnect exploits. (Thanks to Silvers for the code!)
- Added the `nff_gamemodetypes` convar. (Thanks to Silvers for the code!)

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
3. Renamed the source code and .cfg files.

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
