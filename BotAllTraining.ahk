#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#include %A_ScriptDir%\includes\IncludeScript.ahk


; =================================================================================================
; ---------------------------------- Variable declarations ----------------------------------------
; =================================================================================================
allyApprovalPageBot := new AllyApprovalPageBot
allyPageBot := new AllyPageBot
appPlayerBot := new AppPlayerBot
bingoBot := new BingoBot
clubRookBot := new ClubRookBot
connectionErrorBot := new ConnectionErrorBot
loginBonusBot := new LoginBonusBot
mainPageBot := new MainPageBot("TRAINING")
maintenanceBot := new MaintenanceBot
startPageBot := new StartPageBot(questBattleBot)
trainingPageBot := new TrainingPageBot(TRAINING_EPISODE, STAGE)
trainingBot := new TrainingBot(trainingPageBot)

; =================================================================================================
; -------------------------------------------- Main loop ------------------------------------------
; =================================================================================================
loop
{
  allyApprovalPageBot.play()
  allyPageBot.play()
  appPlayerBot.play()
  bingoBot.play()
  clubRookBot.play()
  connectionErrorBot.play()
  mainPageBot.play()
  maintenanceBot.play()
  loginBonusBot.play()
  startPageBot.play()
  trainingBot.play(true)
  trainingPageBot.play()
}

; =================================================================================================
; -------------------------------------------- Hotkeys --------------------------------------------
; =================================================================================================
F1::ExitApp
F2::Pause
F3::Reload
