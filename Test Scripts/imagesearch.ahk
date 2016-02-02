#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

image_name := "training.bmp"

IfWinExist, Bluestacks App Player
    WinActivate ; use the window found above
WinGetActiveStats, title, width, height, x, y
ImageSearch, FoundX, FoundY, 0, 0, width, height, *75 %image_name%

if ErrorLevel = 2
    tooltip Could not conduct the search.
else if ErrorLevel = 1
{
    loop, 50
    {
        width := 16 + A_Index - 15
        loop, 50
        {
            height := 16 + A_Index - 15
            ImageSearch, FoundX, FoundY, 0, 0, width, height, *75 *w%width% *h%height% %image_name%
            tooltip Image could not be found on the screen. %width% and %height%
            
            if (ErrorLevel = 0)
            {
                mousemove, %FoundX%, %FoundY%, 10
                tooltip The image was found at %FoundX%x%FoundY%.
                break
            }
        }
        
        
    } 
}
else
{
    mousemove, %FoundX%, %FoundY%, 10
    tooltip The image was found at %FoundX%x%FoundY%.
}


F1::ExitApp
F2::Pause
F3::Reload
