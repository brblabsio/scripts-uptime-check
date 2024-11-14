@echo off

REM Function to send HTTP HEAD request and capture status code and date
:send_head_request
set "url=%1"

REM Send the HTTP HEAD request and capture the response
curl -sI -w "%%{http_code}" -o response_headers.txt "%url%" > nul
set /p httpStatusCode=<response_headers.txt

REM Extract the Date from the response headers
for /f "tokens=2,* delims=: " %%a in ('findstr /i "^Date:" response_headers.txt') do set "httpResponseDate=%%b"

REM Output the captured values
echo HTTP Status Code: %httpStatusCode%, HTTP Response Date: %httpResponseDate%

del response_headers.txt
goto :eof

REM Parse command line flags
:parse_flags
setlocal enabledelayedexpansion
:next_arg
if "%1"=="" goto after_flags
if "%1"=="--url" (
  set "url=%2"
  shift
  shift
  goto next_arg
)
if "%1"=="--interval" (
  set "interval=%2"
  shift
  shift
  goto next_arg
)
echo Unknown flag: %1
exit /b 1
:after_flags

REM Function to check uptime
:check_uptime
set "url=%1"
set "interval=%2"

echo Checking uptime for URL: %url% with interval: %interval% seconds

:uptime_loop
call :send_head_request "%url%"

REM Sleep for the specified interval
ping -n %interval% 127.0.0.1 > nul
goto uptime_loop

