#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FileEncoding, UTF-8

Decorate(str)
{
  global width, height    ; Defined in GlobalConstants.ahk
  extension := "-" . width . "_" . height . ".png"
  foundPos := InStr(str, ".png", false, 1)
  length := foundPos - 1
  return SubStr(str, 1, length) . extension
}
