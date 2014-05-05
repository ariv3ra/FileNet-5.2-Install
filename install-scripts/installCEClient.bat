@echo off

rem Licensed Materials - Property of IBM
rem 5725A15, 5724R81
rem (c) Copyright IBM Corp. 2010, 2011  All Rights Reserved.
rem US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
rem
rem parameter 1 = installerScriptFolder - Script folder
rem parameter 2 = decompressedFolder    - Destination folder to decompress files to
rem parameter 3 = p8DownloadFolder      - Source folder of the IBM software packages
rem parameter 4 = 32 or 64              - Bitness of the OS 64 or 32 (optional)

echo ====================
echo Start installCEClient.bat
time /t

set ScriptsDir=%1
set DirToDecompressTo=%2
set P8DownloadDirectory=%3

set ScriptsDir=%ScriptsDir:~1,-1%
set P8DownloadDirectory=%P8DownloadDirectory:~1,-1%
set DirToDecompressTo=%DirToDecompressTo:~1,-1%

call "%ScriptsDir%\setDirs.bat" 

set P8CEClientInstallerFullPath="%DirToDecompressTo%\%P8CEClientDirName%"

echo Updating IBM FileNet Content Engine client files for Process Engine and Workplace XT ...

pushd "%P8CEClientInstallerFullPath%"
set INSTALLER-NAME=5.2.0-P8CE-CLIENT-WIN.EXE

if not exist %INSTALLER-NAME% goto EXIT_ERROR
call %INSTALLER-NAME% -i silent -f "%ScriptsDir%\installCEClient.txt"  -DDO_INSTALL_WITH_PAYLOAD=1
popd

time /t
:EXIT_OK
echo  IBM FileNet Content Engine client files for Process Engine and Workplace XT updated
echo ====================
exit 0

:EXIT_ERROR
echo %INSTALLER-NAME% not found!
echo ====================
exit -1
