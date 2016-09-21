#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FileEncoding, UTF-8


; decorate - Formats the input path by inserting the globally defined  width 
;            and height between the path and the extension.
;            (i.e. If the global width is 1600 and the height is 900, then 
;            given an input path called "hello.png", the function returns
;            "hello-1600_900.png").
; @param string - The unformatted path
; @return string - The path decorated with the global width and height
decorate(str)
{
  global width, height    ; Defined in GlobalConstants.ahk

  extension := "-" . width . "_" . height . ".png"
  foundPos := InStr(str, ".png", false, 1)
  length := foundPos - 1
  return SubStr(str, 1, length) . extension
}
