' Run googledriverestart.bat without a command prompt pop-up.
' Ideal for Scheduled Tasks.
' Assumes googledriverestart.bat is in the same folder.
' Run this script like:
' "%windir%\system32\wscript.exe" C:\path\to\runscheduled.vbs
Dim WinScriptHost
Dim FSO
Dim ScriptDir
Dim BatchFilePath
Dim Quote

Set WinScriptHost = CreateObject("WScript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")

ScriptDir = FSO.GetParentFolderName(WScript.ScriptFullName)
Quote = Chr(34)  ' quotation mark character
BatchFilePath = Quote & FSO.BuildPath(ScriptDir, "googledriverestart.bat") & Quote

WinScriptHost.Run BatchFilePath, 0
Set WinScriptHost = Nothing
