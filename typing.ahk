#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

^!b::
    Loop, read, typing.txt
    {
        command := SubStr(A_LoopReadLine, 1, 2)
        output  := SubStr(A_LoopReadLine, 4)
        if (command = "pa")
        {
            Sleep, %output%
        }
        else
        {
            Loop, parse, output
            {
                SendRaw, %A_LoopField%
                Random, rand, 1, 225
                Sleep, %rand%
            }
            if (command = "te")
            {
                SendInput, {enter}
            }
            Random, rand, 500, 1500
            Sleep, %rand%
        }
    }
return

^!k::
    ExitApp

