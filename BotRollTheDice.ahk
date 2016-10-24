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
inboxBot := new InboxBot
loginBonusBot := new LoginBonusBot
mainPageBot := new MainPageBot("ROLL THE DICE")
maintenanceBot := new MaintenanceBot
startPageBot := new StartPageBot(questBattleBot)
rollTheDiceBot := new RollTheDiceBot

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
  inboxBot.play("ITEMS")
  mainPageBot.play()
  maintenanceBot.play()
  loginBonusBot.play()
  startPageBot.play()
  rollTheDiceBot.play()
}

; =================================================================================================
; -------------------------------------------- Hotkeys --------------------------------------------
; =================================================================================================
F1::ExitApp
F2::Pause
F3::Reload
