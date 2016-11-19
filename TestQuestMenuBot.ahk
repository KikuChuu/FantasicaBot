#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

;========================================================
;=================== QUEST ==============================
;========================================================

generalConfiguration := new GeneralConfiguration(APP_PLAYER_TITLE)
questConfiguration := new QuestConfiguration(QUEST_EPISODE, QUEST, DEPLOY_NUMBER, ALLY_NUMBER)
deploymentConfiguration := new DeploymentConfiguration(UNIT_LIMIT, ALLY_LIMIT)
detector := new Detector(generalConfiguration)
controller := new Controller
questMenuBot := new QuestMenuBot(generalConfiguration, questConfiguration, deploymentConfiguration, detector, controller)

test1() {
  questMenuBot.play()
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
