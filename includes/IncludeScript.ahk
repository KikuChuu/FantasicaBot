#NoEnv 
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include UserInput.txt
#include %A_ScriptDir%\includes\lib\GlobalConstants.ahk
#include %A_ScriptDir%\includes\lib\GuiConstructor.ahk
#include %A_ScriptDir%\includes\lib\ObjectInteraction.ahk 
;#include %A_ScriptDir%\includes\lib\QuestProcedures.ahk
#include %A_ScriptDir%\includes\lib\Log.ahk
#include %A_ScriptDir%\includes\lib\Decorate.ahk
#include %A_ScriptDir%\includes\lib\SB.ahk
#include %A_ScriptDir%\includes\lib\MainPageBot.ahk
#include %A_ScriptDir%\includes\lib\QuestMenuBot.ahk
#include %A_ScriptDir%\includes\lib\ResultsPageBot.ahk
#include %A_ScriptDir%\includes\lib\StartPageBot.ahk
#include %A_ScriptDir%\includes\lib\LoginBonusPageBot.ahk
#include %A_ScriptDir%\includes\lib\BingoPageBot.ahk
#include %A_ScriptDir%\includes\lib\ConnectionErrorBot.ahk
#include %A_ScriptDir%\includes\lib\AppPlayerBot.ahk
#include %A_ScriptDir%\includes\lib\QuestBattleBot.ahk
#include %A_ScriptDir%\includes\lib\QuestBattlePoints.ahk
#include %A_ScriptDir%\includes\lib\Controller.ahk
#include %A_ScriptDir%\includes\lib\ClubRookPageBot.ahk
#include %A_ScriptDir%\includes\lib\Class_SQLiteDB.ahk
#include %A_ScriptDir%\includes\lib\TowerBot.ahk
;#include %A_ScriptDir%\includes\lib\ScreenBot.ahk
