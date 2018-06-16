// No Friendly-fire
#include <sourcemod>
#include <sdktools>
#pragma semicolon 1
#pragma newdecls required
#define NFF_VERSION "5.5"

public Plugin myinfo =
{
	name = "No Friendly-fire",
	author = "Psykotik (Crasher_3637)",
	description = "Disables friendly fire.",
	version = NFF_VERSION,
	url = "https://forums.alliedmods.net/showthread.php?t=302822"
};

char g_sGameName[32];
ConVar g_cvNFFDisabledGameModes;
ConVar g_cvNFFEnabledGameModes;
ConVar g_cvNFFEnable;

public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max)
{
	GetGameFolderName(g_sGameName, sizeof(g_sGameName));
	if (!StrEqual(g_sGameName, "left4dead", false) && !StrEqual(g_sGameName, "left4dead2", false))
	{
		return APLRes_SilentFailure;
	}
	return APLRes_Success;
}

public void OnPluginStart()
{
	g_cvNFFDisabledGameModes = CreateConVar("nff_disabledgamemodes", "", "Disable the plugin in these game modes.\nGame mode limit: 64\nCharacter limit for each game mode: 32\n(Empty: None)\n(Not empty: Disabled in these game modes.)");
	g_cvNFFEnabledGameModes = CreateConVar("nff_enabledgamemodes", "", "Enable the plugin in these game modes.\nGame mode limit: 64\nCharacter limit for each game mode: 32\n(Empty: None)\n(Not empty: Enabled in these game modes.)");
	g_cvNFFEnable = CreateConVar("nff_enable", "1", "Enable the plugin?\n(0: OFF)\n(1: ON)");
	CreateConVar("nff_pluginversion", NFF_VERSION, "No Friendly Fire version", FCVAR_NOTIFY|FCVAR_DONTRECORD);
	g_cvNFFDisabledGameModes.AddChangeHook(vNFFCvarChanges);
	g_cvNFFEnabledGameModes.AddChangeHook(vNFFCvarChanges);
	g_cvNFFEnable.AddChangeHook(vNFFCvarChanges);
	AutoExecConfig(true, "no_friendly-fire");
	vChangeCvars();
}

public void vNFFCvarChanges(ConVar convar, const char[] oldvalue, const char[] newvalue)
{
	vChangeCvars();
}

void vChangeCvars()
{
	if (g_cvNFFEnable.BoolValue && bIsSystemValid())
	{
		FindConVar("survivor_friendly_fire_factor_easy").SetString("0");
		FindConVar("survivor_friendly_fire_factor_normal").SetString("0");
		FindConVar("survivor_friendly_fire_factor_hard").SetString("0");
		FindConVar("survivor_friendly_fire_factor_expert").SetString("0");
		FindConVar("survivor_burn_factor_easy").SetString("0");
		FindConVar("survivor_burn_factor_normal").SetString("0");
		FindConVar("survivor_burn_factor_hard").SetString("0");
		FindConVar("survivor_burn_factor_expert").SetString("0");
		if (bIsL4D2Game())
		{
			FindConVar("grenadelauncher_ff_scale").SetString("0");
			FindConVar("grenadelauncher_ff_scale_self").SetString("0");
		}
	}
	else if (!g_cvNFFEnable.BoolValue || !bIsSystemValid())
	{
		FindConVar("survivor_friendly_fire_factor_easy").SetString("0");
		FindConVar("survivor_friendly_fire_factor_normal").SetString("0.1");
		FindConVar("survivor_friendly_fire_factor_hard").SetString("0.3");
		FindConVar("survivor_friendly_fire_factor_expert").SetString("0.5");
		FindConVar("survivor_burn_factor_easy").SetString("0.2");
		FindConVar("survivor_burn_factor_normal").SetString("0.2");
		FindConVar("survivor_burn_factor_hard").SetString("0.4");
		FindConVar("survivor_burn_factor_expert").SetString("1");
		if (bIsL4D2Game())
		{
			FindConVar("grenadelauncher_ff_scale").SetString("0.12");
			FindConVar("grenadelauncher_ff_scale_self").SetString("0.12");
		}
	}
}

stock bool bIsL4D2Game()
{
	GetGameFolderName(g_sGameName, sizeof(g_sGameName));
	return (StrEqual(g_sGameName, "left4dead2", false));
}

stock bool bIsSystemValid()
{
	char sGameMode[32];
	char sConVarModes[2049];
	char sModeName[64][32];
	FindConVar("mp_gamemode").GetString(sGameMode, sizeof(sGameMode));
	g_cvNFFEnabledGameModes.GetString(sConVarModes, sizeof(sConVarModes));
	ExplodeString(sConVarModes, ",", sModeName, sizeof(sModeName), sizeof(sModeName[]));
	for (int iMode = 0; iMode < sizeof(sModeName); iMode++)
	{
		if (StrContains(sGameMode, sModeName[iMode], false) != -1 && sModeName[iMode][0] != '\0')
		{
			return true;
		}
	}
	g_cvNFFDisabledGameModes.GetString(sConVarModes, sizeof(sConVarModes));
	ExplodeString(sConVarModes, ",", sModeName, sizeof(sModeName), sizeof(sModeName[]));
	for (int iMode = 0; iMode < sizeof(sModeName); iMode++)
	{
		if (StrContains(sGameMode, sModeName[iMode], false) == -1 && sModeName[iMode][0] != '\0')
		{
			return true;
		}
	}
	return false;
}