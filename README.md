# Uptime Check Scripts

Command line scripts to check uptime of your webpage from your 
local machine. These scripts perform the same function as the
core of [Uptime Monitoring by BRB Labs](https://www.brblabs.io/index.html).

## Features

- Runs on your local machine
- Allows custom interval in seconds
- Runs forever

## Installation

To install, simply download the script for your Operating System.

| Operating System | Directory    | Script Name              |
|------------------|--------------|--------------------------|
| Linux            | for-webpages | uptime_check_linux.sh    |
| Mac OS X         | for-webpages | uptime_check_macosx.sh   |
| Windows          | for-webpages | uptime_check_windows.bat |


## Usage

To run on Linux, open the terminal and run the following command:

```shell
sh uptime_check_linux.sh \
     --url https://www.brblabs.io/tools/scripts-uptime-check-linux.html \
     --interval 60
```

To run on Mac OS X, open the terminal and run the following command:

```shell
sh uptime_check_macosx.sh \
     --url https://www.brblabs.io/tools/scripts-uptime-check-macosx.html \
     --interval 60
```

To run on Windows, open the command prompt and run the following command:

```shell
uptime_check_linux.bat \
  --url "https://www.brblabs.io/tools/scripts-uptime-check-windows.html" \
  --interval 60
```

To stop the script, press Ctrl+C and the script should exit immediately.
