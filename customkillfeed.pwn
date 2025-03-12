#include <a_samp>

#define MAX_PLAYER_NAME 24

new deathm[MAX_PLAYERS];
new PlayerText:DeathInfo[2][MAX_PLAYERS];

public OnPlayerConnect(playerid)
{
    InitializePTD(playerid);
    return 1l
}

public OnPlayerDeath(playerid, killerid, reason)
{
    deathm[killerid] = random(8);
    RandomKillMessages(killerid, playerid);
    return 1;
}

stock RandomKillMessages(killerid, playerid)
{
	new KillerIDString[360];
	new PlayerIDString[360];

    new KillerName[MAX_PLAYER_NAME];
    GetPlayerName(playerid, KillerName, MAX_PLAYER_NAME);

    new PlayerName[MAX_PLAYER_NAME];
    GetPlayerName(playerid, PlayerName, MAX_PLAYER_NAME);

	switch(deathm[killerid])
	{
	    case 0:
		{
		    format(KillerIDString, sizeof(KillerIDString), "You sent ~r~%s ~w~to heaven",PlayerName);
		    format(PlayerIDString, sizeof(PlayerIDString), "You got sent to heaven by ~r~%s",KillerName);
		}
        case 1:
		{
		    format(KillerIDString, sizeof(KillerIDString), "You killed ~r~%s",PlayerName);
		    format(PlayerIDString, sizeof(PlayerIDString), "You got killed by ~r~%s",KillerName);
		}
	    case 2:
		{
		    format(KillerIDString, sizeof(KillerIDString), "You fucked ~r~%s",PlayerName);
		    format(PlayerIDString, sizeof(PlayerIDString), "You got fucked by ~r~%s",KillerName);
		}
	    case 3:
		{
		    format(KillerIDString, sizeof(KillerIDString), "You reaped ~r~%s",PlayerName);
		    format(PlayerIDString, sizeof(PlayerIDString), "You got reaped by ~r~%s",KillerName);
		}
	    case 4:
		{
		    format(KillerIDString, sizeof(KillerIDString), "You sent ~r~%s ~w~to cemetery",PlayerName);
		    format(PlayerIDString, sizeof(PlayerIDString), "You got sent to cemetery by ~r~%s",KillerName);
		}
	    case 5:
		{
		    format(KillerIDString, sizeof(KillerIDString), "You ate ~r~%s",PlayerName);
		    format(PlayerIDString, sizeof(PlayerIDString), "You got eaten by ~r~%s",KillerName);
		}
		case 6:
		{
		    format(KillerIDString, sizeof(KillerIDString), "You owned ~r~%s",PlayerName);
		    format(PlayerIDString, sizeof(PlayerIDString), "You got owned by ~r~%s",KillerName);
		}
		case 7:
		{
		    format(KillerIDString, sizeof(KillerIDString), "You cooked ~r~%s",PlayerName);
		    format(PlayerIDString, sizeof(PlayerIDString), "You got cooked by ~r~%s",KillerName);
		}
	}
    PlayerTextDrawSetString(killerid, DeathInfo[0][killerid], KillerIDString);
    PlayerTextDrawShow(killerid, DeathInfo[0][killerid]);
    
    PlayerTextDrawSetString(playerid, DeathInfo[1][playerid], PlayerIDString);
    PlayerTextDrawShow(playerid, DeathInfo[1][playerid]);
	SetTimerEx("DeathMessage", 4000, false, "ii", killerid, playerid);
	return 1;
}

forward DeathMessage(killerid, playerid);
public DeathMessage(killerid, playerid)
{
	PlayerTextDrawHide(killerid, DeathInfo[0][killerid]);
	PlayerTextDrawHide(playerid, DeathInfo[1][playerid]);
}

stock InitializePTD(playerid)
{
    DeathInfo[0][playerid] = CreatePlayerTextDraw(playerid, 326.400146, 383.786285, "_");
	PlayerTextDrawLetterSize(playerid, DeathInfo[0][playerid], 0.280000, 1.000000);
	PlayerTextDrawAlignment(playerid, DeathInfo[0][playerid], 2);
	PlayerTextDrawColor(playerid, DeathInfo[0][playerid], -1);
	PlayerTextDrawSetShadow(playerid, DeathInfo[0][playerid], 0);
	PlayerTextDrawSetOutline(playerid, DeathInfo[0][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DeathInfo[0][playerid], 51);
	PlayerTextDrawFont(playerid, DeathInfo[0][playerid], 1);
	PlayerTextDrawSetProportional(playerid, DeathInfo[0][playerid], 1);

	DeathInfo[1][playerid] = CreatePlayerTextDraw(playerid, 326.000000, 400.000000, "_");
	PlayerTextDrawLetterSize(playerid, DeathInfo[1][playerid], 0.280000, 1.000000);
	PlayerTextDrawAlignment(playerid, DeathInfo[1][playerid], 2);
	PlayerTextDrawColor(playerid, DeathInfo[1][playerid], -1);
	PlayerTextDrawSetShadow(playerid, DeathInfo[1][playerid], 0);
	PlayerTextDrawSetOutline(playerid, DeathInfo[1][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DeathInfo[1][playerid], 51);
	PlayerTextDrawFont(playerid, DeathInfo[1][playerid], 1);
	PlayerTextDrawSetProportional(playerid, DeathInfo[1][playerid], 1);
}