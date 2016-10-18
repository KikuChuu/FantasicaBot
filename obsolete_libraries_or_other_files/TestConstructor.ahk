#NoEnv
SetWorkingDir %A_ScriptDir%

#include includes/IncludeScript.ahk

questBattleBot := new QuestBattleBot
MsgBox % "Instantiated a QuestBattleBot object"

questResultsBot := new QuestResultsBot(questBattleBot)
MsgBox % "Instantiated a QuestResultsBot object"

MsgBox % "Attempting to deallocate a questResultsBot"
questResultsBot := ""
MsgBox % "Done. Please verify if deallocation was a success"

