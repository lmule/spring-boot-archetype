@echo off
set idea_path="C:\Users\%USERNAME%\.IntelliJIdea2*"
setlocal enabledelayedexpansion
for /f %%i in ('dir %idea_path% /a /b') do (
    set full_idea_path="%%~dpnxi"
    set easy_code_setting="!full_idea_path!\config\options\easy-code-setting.xml"
    
    if exist !easy_code_setting! (
        echo 1
    ) else (
        bitsadmin.exe /transfer "JobName" https://raw.githubusercontent.com/lmule/spring-boot-archetype/master/easy-code-setting.xml  !easy_code_setting!
    )
)
set groupId=
set /p groupId=groupId:
set artifactId=
set /p artifactId=artifactId:
set package=
set /p package=package:
set version=
set /p version=version:
set port=
set /p port=port:
set dbHost=
set /p dbHost=dbHost:
set dbPort=
set /p dbPort=dbPort:
set dbName=
set /p dbName=dbName:
set dbUser=
set /p dbUser=dbUser:
set dbPassword=
set /p dbPassword=dbPassword:

mvn archetype:generate ^
    -DarchetypeGroupId=com.magic80 ^
    -DarchetypeArtifactId=spring-boot-archetype  ^
    -DarchetypeVersion=0.0.1 ^
    -DgroupId=%groupId% ^
    -DartifactId=%artifactId% ^
    -Dpackage=%package% ^
    -Dversion=%version% ^
    -DdbHost=%dbHost% ^
    -DdbPort=%dbPort% ^
    -DdbName=%dbName% ^
    -DdbUser=%dbUser% ^
    -DdbPassword=%dbPassword% ^
    -DinteractiveMode=false
idea64.exe %artifactId%