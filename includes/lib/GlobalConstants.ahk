#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetWinDelay, 0


; Discover the window title
BLUESTACK_WINDOW_TITLE := ""
if (winExist("BlueStacks App Player"))
{
  BLUESTACK_WINDOW_TITLE := "BlueStacks App Player"
  WinActivate, %BLUESTACK_WINDOW_TITLE%
  WinWaitActive, %BLUESTACK_WINDOW_TITLE%, , 2
}
else if (winExist("Bluestacks App Player"))
{
  BLUESTACK_WINDOW_TITLE := "Bluestacks App Player"
  WinActivate, %BLUESTACK_WINDOW_TITLE%
  WinWaitActive, %BLUESTACK_WINDOW_TITLE%, , 2
}
else
{
  msg := "Check to see if your Bluestack's title is one of the following: `n"
          . " BlueStacks App Player`n"
          . " Bluestacks App Player"
  MsgBox,, "Error", msg
  ExitApp
}

; Obtain the window size in terms of width and height.
; We use the width and height to set the bot's parameters such as
; initial scan coordinates, the location to idly click, and image paths.
WinGetPos,,,width, height, %BLUESTACK_WINDOW_TITLE%
if (width == 0 || height == 0)
{
  MsgBox,, "Error", "Invalid window size"
  ExitApp
}
else 
{
  X2 := width
  Y2 := height
}

BATTLE_ICON := "FANTASICA IMAGES\MainPage\battle-" . width . "_" . height . ".png"
BATTLE_SELECT_TITLE := "FANTASICA IMAGES\Battle\SelectOpponent\title-" . width . "_" . height . ".png"
BATTLE_SELECT := "FANTASICA IMAGES\Battle\SelectOpponent\select-" . width . "_" . height . ".png"
BATTLE_TITLE := "FANTASICA IMAGES\Battle\Battle\title-" . width . "_" . height . ".png"
BATTLE_BUTTON := "FANTASICA IMAGES\Battle\Battle\battle-" . width . "_" . height . ".png"
BATTLE_RESULTS_TITLE := "FANTASICA IMAGES\Battle\Results\title-" . width . "_" . height . ".png"
BATTLE_MYPAGE := "FANTASICA IMAGES\Battle\Results\mypage-" . width . "_" . height . ".png"
BATTLE_TIMER := "FANTASICA IMAGES\Battle\timer-" . width . "_" . height . ".png"
  
STARTTRAINING1_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining1-" . width . "_" . height . ".png"
STARTTRAINING2_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining2-" . width . "_" . height . ".png" 
STARTTRAINING3_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining3-" . width . "_" . height . ".png"
STARTTRAINING4_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining4-" . width . "_" . height . ".png" 
STARTTRAINING5_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining5-" . width . "_" . height . ".png"
TRAININGCHALLENGE_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttrainingboss-" . width . "_" . height . ".png"
TRAINING_TEXT := "FANTASICA IMAGES\Training\TrainingSelection\texttraining-" . width . "_" . height . ".png"
ADVANCE_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonadvance-" . width . "_" . height . ".png" 
SENDBRAVE_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonsendbrave-" . width . "_" . height . ".png"
HEAL_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonheal-" . width . "_" . height . ".png"
HEALMID_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonhealmid-" . width . "_" . height . ".png"
HEALDARK_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonhealdark-" . width . "_" . height . ".png" 
HEALMOBACOIN_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonhealmobacoin-" . width . "_" . height . ".png"
HEALMOBACOINMID_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonhealmobacoinmid-" . width . "_" . height . ".png"
HEALMOBACOINDARK_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonhealmobacoindark-" . width . "_" . height . ".png"
USEPOTIONYES_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonpotionyes-" . width . "_" . height . ".png" 
OUTOFTP_TEXT := "FANTASICA IMAGES\Training\ActualTraining\texttrainingpoints-" . width . "_" . height . ".png"
CONTINUETRAINING_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttoncontinuetraining-" . width . "_" . height . ".png"
TRAININGMYPAGE_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonmypage-" . width . "_" . height . ".png"
TRAININGFIGHT_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonfight-" . width . "_" . height . ".png"
TRAININGSUMMONALLY_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonsummonally-" . width . "_" . height . ".png"
TRAININGPROGRESSCOMPLETE_TEXT := "FANTASICA IMAGES\Training\ActualTraining\textprogresscomplete-" . width . "_" . height . ".png"
  


FULLTRAININGPOINTS_TEXT := "FANTASICA IMAGES\MainPage\textmaxtrainingpoints-" . width . "_" . height . ".png"
DEPLETEDTRAININGPOINTS_TEXT := "FANTASICA IMAGES\MainPage\texttrainingpoints-" . width . "_" . height . ".png"
TRAINING1_ICON := "FANTASICA IMAGES\MainPage\icontraining1-" . width . "_" . height . ".png" ;Training icon on homepage at index 1 (starting with index 0)
TRAINING2_ICON := "FANTASICA IMAGES\MainPage\icontraining2-" . width . "_" . height . ".png" ;Training icon on homepage at index 2 (starting with index 0)
TRAINING3_ICON := "FANTASICA IMAGES\MainPage\icontraining3-" . width . "_" . height . ".png" ;Training icon on homepage at index 3 (starting with index 0)	
TRAINING4_ICON := "FANTASICA IMAGES\MainPage\icontraining4-" . width . "_" . height . ".png" ;Training icon on homepage at index 4 (starting with index 0)	
TRAINING5_ICON := "FANTASICA IMAGES\MainPage\icontraining5-" . width . "_" . height . ".png" ;Training icon on homepage at index 5 (starting with index 0)	
LOGINBINGOPANEL_ICON := "FANTASICA IMAGES\MainPage\Bingo\iconbingopanel-" . width . "_" . height . ".png" ;login bingo panel
LOGINBINGOMYPAGE_BUTTON := "FANTASICA IMAGES\MainPage\Bingo\buttonbingomypage-" . width . "_" . height . ".png" ;button to return to mypage from login bingo
LOGINBINGORECEIVE_BUTTON := "FANTASICA IMAGES\MainPage\Bingo\buttonbingoreceive-" . width . "_" . height . ".png" ; receive button when you click a panel in the daily login bingo
LOGINBINGO_TEXT := "FANTASICA IMAGES\MainPage\Bingo\textbingo-" . width . "_" . height . ".png" ;"Login Bingo"

INBOX1_ICON := "FANTASICA IMAGES\MainPage\iconinbox15-" . width . "_" . height . ".png"
INBOX2_ICON := "FANTASICA IMAGES\MainPage\iconinbox16-" . width . "_" . height . ".png"
INBOX_TITLE := "FANTASICA IMAGES\Inbox\texttitle-" . width . "_" . height . ".png"
INBOX_ALL_BUTTON := "FANTASICA IMAGES\Inbox\buttonall-" . width . "_" . height . ".png"
INBOX_ITEMS_BUTTON := "FANTASICA IMAGES\Inbox\buttonitems-" . width . "_" . height . ".png"
INBOX_RECEIVE_BUTTON := "FANTASICA IMAGES\Inbox\buttonreceive-" . width . "_" . height . ".png"
  
DAILY_BONUS := "FANTASICA IMAGES\MainPage\Bonus\dailybonus-" . width . "_" . height . ".png"
LOGINBONUSMYPAGE_BUTTON := "FANTASICA IMAGES\MainPage\Bonus\buttonmypage-" . width . "_" . height . ".png"

BACK_BUTTON := "FANTASICA IMAGES\_GeneralPupose\buttonback-" . width . "_" . height . ".png" ;The back button found in the bottom right corner of the app screen (not the corner of bluestack screen)
