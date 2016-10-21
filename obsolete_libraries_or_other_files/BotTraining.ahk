#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#include .\includes\IncludeScript.ahk

appPlayerBot := new AppPlayerBot
bingoPageBot := new BingoPageBot
clubRookPageBot := new ClubRookPageBot
connectionErrorBot := new ConnectionErrorBot
loginBonusPageBot := new LoginBonusPageBot
mainPageBot := new MainPageBot
maintenanceBot := new MaintenanceBot
startPageBot := new StartPageBot
trainingBot := new TrainingBot
trainingPageBot := new TrainingPageBot
currentEpisode := TRAINING_EPISODE
currentStage := STAGE

loop {
  if (trainingPageBot.isTrainingPage()) {
    trainingPageBot.selectStage(currentEpisode, currentStage)
  }
  else if (mainPageBot.isMainPage()) {
    mainPageBot.selectMenu(mainPageBot.TRAINING)
  }
  else if (trainingBot.isTraining()) {
    if (trainingBot.isExitTraining()) {
      trainingBot.advance()
      trainingBot.summonAlly()
      trainingBot.fight()
      trainingBot.exitTraining()
    }
  }
  else if (trainingBot.isCard()) {
    trainingBot.continueTraining()
  }
  else if (trainingBot.isFriend()) {
    trainingBot.continueTraining()
  }
  else if (maintenanceBot.isMaintenance()) {
    maintenanceBot.startPage()
  }
  else if (connectionErrorBot.isConnectionError()) {
    connectionErrorBot.startPage()
  }
  else if (connectionErrorBot.isConnectionErrorRequiresRestart()) {
    connectionErrorBot.exitGame()
  }
  else if (appPlayerBot.isAppPlayerHomePage()) {
    if (appPlayerBot.isFantasicaRecentlyPlayed()) {
      appPlayerBot.startGame()
    }
    else {
      appPlayerBot.openAppDrawer()
      appPlayerBot.startGame()
    }
  }
  else if (startPageBot.isStartPage()) {
    startPageBot.startGame()
  }
  else if (clubRookPageBot.isClubRookPage()) {
    clubRookPageBot.exitPage()
  }
  else if (loginBonusPageBot.isLoginBonusPage()) {
    loginBonusPageBot.selectMyPage()
  }
  else if (bingoPageBot.isBingoPage()) {
    bingoPageBot.doBingo()
    sleep 5000
  }
  else if (mainPageBot.isAnnouncement()) {
    mainPageBot.closeAnnouncement()
  }
}

F1::ExitApp
F2::Pause
F3::Reload
