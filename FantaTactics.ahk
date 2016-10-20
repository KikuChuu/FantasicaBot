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
fantaTacticsBot := new FantaTacticsBot
inboxBot := new InboxBot
loginBonusBot := new LoginBonusBot
mainPageBot := new MainPageBot("FANTA TACTICS")
maintenanceBot := new MaintenanceBot
startPageBot := new StartPageBot(questBattleBot)

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
  fantaTacticsBot.play()
  inboxBot.play() 
  loginBonusBot.play()
  mainPageBot.play()
  maintenanceBot.play()
  startPageBot.play()
}

; =================================================================================================
; -------------------------------------------- Hotkeys --------------------------------------------
; =================================================================================================
F1::ExitApp
F2::Pause
F3::Reload
