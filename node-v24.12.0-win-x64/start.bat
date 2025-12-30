@echo off
:: Set the current folder as the "Home" for this program
set "CURRENT_DIR=%~dp0"
set "PATH=%CURRENT_DIR%;%PATH%"

:: Check if code-server is installed.
if not exist "node_modules\.bin\code-server.cmd" (
    echo Installing code-server - this runs once...
    call npm install code-server --save
)

:: Run the server
echo Starting Server...
echo Password is in: %CURRENT_DIR%config.yaml

:: Generate a config file on first run if missing
if not exist "config.yaml" (
    echo bind-addr: 127.0.0.1:8080 > config.yaml
    echo auth: password >> config.yaml
    echo password: changeme >> config.yaml
    echo cert: false >> config.yaml
)

:: Launch!
call "node_modules\.bin\code-server.cmd" --config "%CURRENT_DIR%config.yaml"
pause