@echo off
rem Open five websites
start "" "https://www.youtube.com/index"
start "" "https://allmanga.to/"
start "" "https://deadcells.wiki.gg/wiki/Dead_Cells_Wiki"
start "" "https://learn.microsoft.com/en-us/windows/powertoys/"
start "" "https://www.geeksforgeeks.org/dos-commands/"

rem Launch calculator
start calc

rem Launch notepad
start notepad

rem Wait for 1 minute (60 seconds) before shutting down
timeout /t 60

rem Initiate system shutdown
shutdown /s /t 0
