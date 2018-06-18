// No Friendly-fire
#include <sourcemod>
#include <sdktools>
#pragma semicolon 1
#pragma newdecls required
#define NFF_VERSION "6.0"

public Plugin myinfo =
{
	name = "No Friendly-fire",
	author = "Psykotik (Crasher_3637)",
	description = "Disables friendly fire.",
	version = NFF_VERSION,
	url = "https://forums.alliedmods.net/showthread.php?t=302822"
};

char g_sGameName[32];
ConVar g_cvNFFAdvanced;
ConVar g_cvNFFBurnAdvanced;
ConVar g_cvNFFBurnEasy;
ConVar g_cvNFFBurnExpert;
ConVar g_cvNFFBurnNormal;
ConVar g_cvNFFDisabledGameModes;
ConVar g_cvNFFEnabledGameModes;
ConVar g_cvNFFEnable;
ConVar g_cvNFFEasy;
ConVar g_cvNFFExpert;
ConVar g_cvNFFGameMode;
ConVar g_cvNFFGLScale;
ConVar g_cvNFFGLScaleSelf;
ConVar g_cvNFFNormal;

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
	g_cvNFFAdvanced = FindConVar("survivor_friendly_fire_factor_hard");
	g_cvNFFBurnAdvanced = FindConVar("survivor_burn_factor_hard");
	g_cvNFFBurnEasy = FindConVar("survivor_burn_factor_easy");
	g_cvNFFBurnExpert = FindConVar("survivor_burn_factor_expert");
	g_cvNFFBurnNormal = FindConVar("survivor_burn_factor_normal");
	g_cvNFFDisabledGameModes = CreateConVar("nff_disabledgamemodes", "", "Disable the plugin in these game modes.\nGame mode limit: 64\nCharacter limit for each game mode: 32\n(Empty: None)\n(Not empty: Disabled in these game modes.)");
	g_cvNFFEnabledGameModes = CreateConVar("nff_enabledgamemodes", "", "Enable the plugin in these game modes.\nGame mode limit: 64\nCharacter limit for each game mode: 32\n(Empty: None)\n(Not empty: Enabled in these game modes.)");
	g_cvNFFEnable = CreateConVar("nff_enable", "1", "Enable the plugin?\n(0: OFF)\n(1: ON)");
	g_cvNFFEasy = FindConVar("survivor_friendly_fire_factor_easy");
	g_cvNFFExpert = FindConVar("survivor_friendly_fire_factor_expert");
	g_cvNFFGameMode = FindConVar("mp_gamemode");
	g_cvNFFGLScale = FindConVar("grenadelauncher_ff_scale");
	g_cvNFFGLScaleSelf = FindConVar("grenadelauncher_ff_scale_self");
	g_cvNFFNormal = FindConVar("survivor_friendly_fire_factor_normal");
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
		g_cvNFFEasy.SetString("0");
		g_cvNFFNormal.SetString("0");
		g_cvNFFAdvanced.SetString("0");
		g_cvNFFExpert.SetString("0");
		g_cvNFFBurnEasy.SetString("0");
		g_cvNFFBurnNormal.SetString("0");
		g_cvNFFBurnAdvanced.SetString("0");
		g_cvNFFBurnExpert.SetString("0");
		if (bIsL4D2Game())
		{
			g_cvNFFGLScale.SetString("0");
			g_cvNFFGLScaleSelf.SetString("0");
		}
	}
	else if (!g_cvNFFEnable.BoolValue || !bIsSystemValid())
	{
		g_cvNFFEasy.SetString("0");
		g_cvNFFNormal.SetString("0.1");
		g_cvNFFAdvanced.SetString("0.3");
		g_cvNFFExpert.SetString("0.5");
		g_cvNFFBurnEasy.SetString("0.2");
		g_cvNFFBurnNormal.SetString("0.2");
		g_cvNFFBurnAdvanced.SetString("0.4");
		g_cvNFFBurnExpert.SetString("1");
		if (bIsL4D2Game())
		{
			g_cvNFFGLScale.SetString("0.12");
			g_cvNFFGLScaleSelf.SetString("0.12");
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
	char sConVarModes[32];
	g_cvNFFGameMode.GetString(sGameMode, sizeof(sGameMode));
	Format(sGameMode, sizeof(sGameMode), ",%s,", sGameMode);
	g_cvNFFEnabledGameModes.GetString(sConVarModes, sizeof(sConVarModes));
	if (strcmp(sConVarModes, ""))
	{
		Format(sConVarModes, sizeof(sConVarModes), ",%s,", sConVarModes);
		if (StrContains(sConVarModes, sGameMode, false) == -1)
		{
			return false;
		}
	}
	g_cvNFFDisabledGameModes.GetString(sConVarModes, sizeof(sConVarModes));
	if (strcmp(sConVarModes, ""))
	{
		Format(sConVarModes, sizeof(sConVarModes), ",%s,", sConVarModes);
		if (StrContains(sConVarModes, sGameMode, false) != -1)
		{
			return false;
		}
	}
	return true;
}