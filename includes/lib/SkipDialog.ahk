#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; skipDialog - Skip dialogs when detected on-screen
; @return string - Returns a blank value (empty string) to its caller
skipDialog() {
  global DIALOG, BUFFER_X, BUFFER_Y

  if (detectObject(DIALOG, 0, 0)) ; dialogSubset represents a general subset image of the dialog)
  {
    clickAt(BUFFER_X, BUFFER_Y) ; image location is the coordnates of the detected image
  }
}
