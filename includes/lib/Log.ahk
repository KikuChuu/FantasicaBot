#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FileEncoding, UTF-8

Log(str="")
{
  FormatTime, formattedTime,, yyyy-MM-dd HH:mm:ss: 
  msg := formattedTime . " " . str . "`n"
  FileAppend, %msg%, *Log
}