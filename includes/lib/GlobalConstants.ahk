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

