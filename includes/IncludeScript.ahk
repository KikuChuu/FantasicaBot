#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; =================================================================================================
; ----------------------------- USER Configuration files
; =================================================================================================
#include UserInput.txt

; =================================================================================================
; ---------------------------------- Non-member helper functions ----------------------------------
; =================================================================================================
#include %A_ScriptDir%\includes\lib\Decorate.ahk
#include %A_ScriptDir%/includes/lib/EncloseInSingleQuotes.ahk
#include %A_ScriptDir%\includes\lib\GuiConstructor.ahk
#include %A_ScriptDir%\includes\lib\Log.ahk
#include %A_ScriptDir%\includes\lib\SB.ahk

; =================================================================================================
; ------------------------------------------- Classes ---------------------------------------------
; =================================================================================================
#include %A_ScriptDir%\includes\lib\AppPlayerBot.ahk
#include %A_ScriptDir%\includes\lib\BingoPageBot.ahk
#include %A_ScriptDir%\includes\lib\ClubRookPageBot.ahk
#include %A_ScriptDir%\includes\lib\ConnectionErrorBot.ahk
#include %A_ScriptDir%\includes\lib\Controller.ahk
#include %A_ScriptDir%\includes\lib\DatabaseQuestBattlePoints.ahk
#include %A_ScriptDir%\includes\lib\LoginBonusPageBot.ahk
#include %A_ScriptDir%\includes\lib\MainPageBot.ahk
#include %A_ScriptDir%\includes\lib\ObjectInteraction.ahk 
#include %A_ScriptDir%\includes\lib\QuestAllyPageBot.ahk
#include %A_ScriptDir%\includes\lib\QuestBattleBot.ahk
#include %A_ScriptDir%\includes\lib\QuestBattlePoints.ahk
#include %A_ScriptDir%\includes\lib\QuestMenuBot.ahk
#include %A_ScriptDir%\includes\lib\QuestUnitPageBot.ahk
#include %A_ScriptDir%\includes\lib\ResultsPageBot.ahk
#include %A_ScriptDir%\includes\lib\SQLiteDB.ahk
#include %A_ScriptDir%\includes\lib\StartPageBot.ahk
#include %A_ScriptDir%\includes\lib\TowerBot.ahk

; =================================================================================================
; --------------------------------------- SQLite scripts -------------------------------------------
; =================================================================================================
#include %A_ScriptDir%\includes\setup\InitializeDatabaseQuestBattlePoints.ahk

; =================================================================================================
; ----------------------------------- Global variables --------------------------------------------
; =================================================================================================
#include %A_ScriptDir%\includes\lib\GlobalConstants.ahk

