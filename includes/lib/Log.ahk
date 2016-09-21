#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FileEncoding, UTF-8


; log - Writes an input message to a file with a general name called "Log"
; @param string - The message to write to the log file
; @return string - Returns a blank value (empty string) to its caller.
log(str="")
{
  global X2, Y2
  FormatTime, formattedTime,, yyyy-MM-dd HH:mm:ss: 
  msg := formattedTime . "   " . str . "`n"
  logname := "Log" . "-" . X2 . "_" . Y2
  FileAppend, %msg%, *%logname%
}
