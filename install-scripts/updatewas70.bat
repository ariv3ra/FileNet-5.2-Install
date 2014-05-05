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
echo Start updateWAS70.bat
time /t

set ScriptsDir=%1
set DirToDecompressTo=%2
set P8DownloadDirectory=%3

set ScriptsDir=%ScriptsDir:~1,-1%
set P8DownloadDirectory=%P8DownloadDirectory:~1,-1%
set DirToDecompressTo=%DirToDecompressTo:~1,-1%

call "%ScriptsDir%\setDirs.bat"

set WASUpdaterFullPath="%PBSTargetDrive%%PBSTargetRootDir%\%WASUpdateInstallerTargetDirName%"

pushd "%WASUpdaterFullPath%"
set INSTALLER-NAME=update.exe

if not exist %INSTALLER-NAME% goto EXIT_ERROR

call %INSTALLER-NAME% -options "%ScriptsDir%\updatewas70.txt" -silent
popd

time /t
:EXIT_OK
echo End updatewas70.bat
echo ====================
exit 0

:EXIT_ERROR
echo %INSTALLER-NAME% not found!
echo ====================
exit -1
