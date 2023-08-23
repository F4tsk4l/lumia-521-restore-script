@echo off
title WINDOWS PHONE RECOVERY
color a
::author :F4tsk4k
mode con: cols=85 lines=37
::Other info on https://
:Welcome
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **---------------------------- NOKIA LUMIA -------------------------------**
echo **----------------- From Andoid Back To Windows 8.1 ----------------------**
echo **------------------------------ WELCOME ---------------------------------**
echo ****************************************************************************
echo.
echo *************************************************************
echo **   Skip The Extraction If Already Extracted The Parts    **
echo **     Follow Them In Sequence Or Skip Completed Ones      **
echo ** If it's A Fresh Recovery Do Them In Sequence For Better **
echo **                        Result.                          **
echo **                                                         **
echo **          Ctrl+c to cancel an operation if neeed.        **
echo *************************************************************
echo.
echo  [0] Extract IMG(Backup) parts with 1mgman64.exe
echo  [1] Recovery_unsecure img and 4DB push
echo  [2] Flash Partition Parts
echo  [3] Th0r2 Finish Up 
echo  [4] Exit
echo.
set /p choice="Select a Number : " 
if [%choice%]==[] (
echo.
echo Enter a value to proceed
timeout 2 >nul
goto Welcome
) 

if %choice% EQU 0 (
goto Extract
) else if %choice% EQU 1 (
 goto Begin
) else if %choice% EQU 2 (
 goto Parts
) else if %choice% EQU 3 (
goto Thor
) else if %choice% EQU 4 (
goto Exit
) else if %choice% GTR 4 (
echo Not a Valid Number !
timeout 2 >nul
goto Welcome
)

:Extract
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------- EXTRACT PARTS -------------------------------**
echo **---------------------------- Main Menu ---------------------------------**
echo ****************************************************************************
echo.
::------------------------------------
:: Manually, mkdir parts then run this
:: imgman64.exe <backup.img> parts
::------------------------------------
echo  [0] Default (DirName:parts)
echo  [1] Custom Directory Name
echo  [2] Already Have Custom Directory
echo  [3] Back to Main Menu
echo.
set /p choice1="Select a Number : "

if [%choice1%]==[] (
echo.
echo Enter a value to proceed
timeout 2 >nul
goto Extract

)

if %choice1% EQU 0 (
goto 0
) else if %choice1% EQU 1 (
goto 1
) else if %choice1% EQU 2 (
goto 2
) else if %choice1% EQU 3 (
goto 3
) else if %choice1% GTR 3 (
echo Not a Valid Number !
timeout 2 >nul
goto Extract
)

::---------------------------------------------
:0
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **--------------------------- EXTRACT PARTS ------------------------------**
echo **-------------------------- Default Option ------------------------------**
echo ****************************************************************************
set chck1="%cd%\parts"
if exist "%chck1%\*" (
echo Folder Exists
echo Resuming ....
timeout 2 >nul
goto 0.1		
) else if not exist "%chck1%\*" (
goto 0.2
)

::-------------------------------------------
:0.1
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **--------------------------- EXTRACT PARTS ------------------------------**
echo **--------------------------- Custom Option ------------------------------**
echo ****************************************************************************
set /p ans="Proceed With Existing Folder[p]|Create New(Deleting Existing One)[c];|Exit[x] : "
if [%ans%]==[] (
echo.
echo Enter a value to proceed
timeout 2 >nul
goto 0.1
)
 
if %ans% EQU p (
goto 0.1.1
) else if %ans% EQU c (
rmdir /q /s parts
goto 0.2
) else if %ans% EQU x (
goto Extract	 
) else (
echo Not a Valid Input
timeout 2 >nul
goto 0.1
)

::------------------------------------------
:0.1.1  
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------- EXTRACT PARTS -------------------------------**
echo **------------------------------------------------------------------------**
echo ****************************************************************************
echo --------------------------------------------------
echo **************************************************
echo If Script Is Running In The Same Folder As 
echo The Backup Img Use Name, Or Path If In a Different
echo Folder.
echo ***************************************************
echo ---------------------------------------------------     
set /p name1="Path[p] or Name[n] of Backup img; Exit[x] : "

if [%name1%]==[] (
echo.
echo Enter a value to proceed
timeout 2 >nul
cls
goto 0.1.1
)

if %name1% EQU p (
goto 0.2.1
) else if %name1% EQU n (
goto 0.2.2
) else if %name1% EQU x (
goto Extract
) else (
echo Not a Valid Input
timeout 2 >nul
cls
goto 0.1.1 
)

::----------------------------------------
:0.2
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------- EXTRACT PARTS -------------------------------**
echo **------------------------------------------------------------------------**
echo *****************************************************************************
echo Creating Directory....
mkdir parts
timeout 2 > nul
set /p name4="Path[p] or Name[n] of Backup img; Exit[x] : "
if [%name4%]==[] (
echo Enter a value to proceed
timeout 2 >nul
goto 0.1.1
)

if %name4% EQU p (
goto 0.2.1
) else if %name4% EQU n (
goto 0.2.2
) else if %name4% EQU x (
goto Extract
) else (
echo Not a Valid Input
timeout 2 >nul
goto 0.1.1
)

::-------------------------------------------------------
:0.2.1
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------- EXTRACT PARTS -------------------------------**
echo **------------------------------------------------------------------------**
echo ****************************************************************************
set /p name5="Type, Paste or Tab Complete Path to Backup Img; Exit[x] : "

if [%name5%]==[] (
echo.
echo Enter a value to proceed
timeout 2 >nul
goto 0.2.1
)

if %name5% EQU x (
goto Extract
)

imgman64.exe  "%name5%"  .\parts

echo.
pause
goto Extract

::-------------------------------------------------------
:0.2.2
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------- EXTRACT PARTS -------------------------------**
echo **------------------------------------------------------------------------**
echo ****************************************************************************
set /p name6="Type, Paste or Tab Complete Name of Backup Img; Exit[x] : "

if [%name6%]==[] (
echo.
echo Enter a value to proceed
timeout 2 >nul
goto 0.2.2
)

if %name6% EQU x (
goto Extract
)

imgman64.exe  "%cd%"\%name6%  .\parts

echo.
pause
goto Extract


::------------------------------------------
:1
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------- CREATING FOLDER -----------------------------**
echo **------------------------------------------------------------------------**
echo ****************************************************************************
set /p dname="Name of Your Directory : "
if ["%dname%"]==[] (
echo.
echo Input Directory Name to Proceed
timeout 2 >nul
goto 1
)
echo Making Directory...
mkdir "%dname%"
timeout 1 >nul
goto 1.1

::------------------------------------------
:1.1
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------- EXTRACT PARTS -------------------------------**
echo **------------------------------------------------------------------------**
echo ****************************************************************************
set /p name7="Path[p] or Name[n] of Backup img; Exit[x] : "
if [%name7%]==[] (
echo.
echo Enter a value to proceed
timeout 2 >nul
goto 1.1
)

if %name7% EQU p (
goto 1.1.1
)else if %name7% EQU n (
goto 1.1.2
)else if %name7% EQU x (
goto Extract
) else (
echo Not a Valid Input
timeout 2 >nul
goto 1.1
)

::-----------------------------------------
:1.1.1
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------- EXTRACT PARTS -------------------------------**
echo **------------------------------------------------------------------------**
echo ****************************************************************************
set /p name8="Type, Paste or Tab Complete Path to Backup Img; Exit[x] : "

if [%name8%]==[] (
echo.
echo Enter a value to proceed
timeout 2 >nul
goto 1.1.1
)

if %name8% EQU x (
goto Extract
)

imgman64.exe   "%name8%"   "%cd%"\%dname%\
pause
goto Extract

::-----------------------------------------
:1.1.2
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------- EXTRACT PARTS -------------------------------**
echo **------------------------------------------------------------------------**
echo ****************************************************************************
set /p name9="Type, Paste or Tab Complete Name of Backup Img; Exit[x] : "

if [%name9%]==[] (
echo.
echo Enter a value to proceed
timeout 2 >nul
goto 1.1.2
)

if %name9% EQU x (
goto Extract
)

imgman64.exe   "%cd%"\%name9%   "%cd%"\%dname%\
pause
goto Extract

::------------------------------------------
:2
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------- EXTRACT PARTS -------------------------------**
echo **------------------------------------------------------------------------**
echo ****************************************************************************
if DEFINED  "%dname%" (
echo Folder Exists
echo Resuming....
timeout 2 >nul
goto 1.1
) else (
echo Custom Folder Doesn't Exist !!!
timeout 2 >nul
goto 1
)

::-------------------------------------------
:3
goto Welcome

::--------------------------------------------
:Begin
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **---------------------- 4DB PUSH AND RECOVERY.IMG -----------------------**
echo **------------------------------------------------------------------------**
echo ****************************************************************************
:: ---------------------------
:: Getting Ready For Recovery
:: ---------------------------
fastboot boot D:\Lumia\Backup\recovery_unsecure.img
pause
adb push "%cd%\fame_wp_unlocked.gpt" /cache/
adb shell sgdisk --load-backup /cache/fame_wp_unlocked.gpt /dev/block/mmcblk0
adb shell sync
adb shell sync
adb shell reboot

pause
goto Welcome
::--------------------------------------------

:Parts
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------- EXTRACT PARTS -------------------------------**
echo **------------------------------------------------------------------------**
echo ****************************************************************************
echo.
echo  [0] Default(Directory name: parts)
echo  [1] For Custom Folder Name
echo  [2] Back to Main Menu
echo.
set /p parts="Select a Number : "
if [%parts%]==[] (
echo.
echo Enter a value to proceed
timeout 2 >nul
goto Parts
)

if %parts% EQU 0 goto D
if %parts% EQU 1 goto C
if %parts% EQU 2 goto X
if %parts% GTR 2 echo Not a Valid Number !
timeout 2 >nul
goto Parts

::------------------------------------------------------
:: Partition parts
:: fastboot flash <partition> parts\<partition>.img
:: TZ SSD RPM WINSECAPP MODEM_FSG MODEM_FS1 MODEM_FS2 UEFI_BS_NV UEFI_NV
:: UEFI_RT_NV UEFI_RT_NV_RPMB PLAT MMOS EFIESP UEFI
::------------------------------------------------------

:: -------------------------------------------
::Default
:D
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------- EXTRACT PARTS -------------------------------**
echo **------------------------------------------------------------------------**
echo ****************************************************************************
echo.
fastboot flash TZ parts\TZ.img
fastboot flash SSD parts\SSD.img
fastboot flash RPM parts\RPM.img
fastboot flash WINSECAPP parts\WINSECAPP.img
fastboot flash MODEM_FSG parts\MODEM_FSG.img
fastboot flash MODEM_FS1 parts\MODEM_FS1.img
fastboot flash MODEM_FS2 parts\MODEM_FS2.img
fastboot flash UEFI_BS_NV parts\UEFI_BS_NV.img
fastboot flash UEFI_NV parts\UEFI_NV.img
fastboot flash UEFI_RT_NV parts\UEFI_RT_NV.img
fastboot flash UEFI_RT_NV_RPMB parts\UEFI_RT_NV_RPMB.img
fastboot flash PLAT parts\PLAT.img
fastboot flash MMOS parts\MMOS.img
fastboot flash EFIESP parts\EFIESP.img
fastboot flash UEFI parts\UEFI.img  
fastboot reboot
echo.
pause
goto Parts

:: -------------------------------------------
::Custom
:C
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **--------------------------FLASHING PARTS--------------------------------**
echo **------------------------------------------------------------------------**
echo ****************************************************************************
echo.
if DEFINED "%dname%" (
fastboot flash TZ "%dname%"\TZ.img
fastboot flash SSD "%dname%"\SSD.img
fastboot flash RPM "%dname%"\RPM.img
fastboot flash WINSECAPP "%dname%"\WINSECAPP.img
fastboot flash MODEM_FSG "%dname%"\MODEM_FSG.img
fastboot flash MODEM_FS1 "%dname%"\MODEM_FS1.img
fastboot flash MODEM_FS2 "%dname%"\MODEM_FS2.img
fastboot flash UEFI_BS_NV "%dname%"\UEFI_BS_NV.img
fastboot flash UEFI_NV "%dname%"\UEFI_NV.img
fastboot flash UEFI_RT_NV "%dname%"\UEFI_RT_NV.img
fastboot flash UEFI_RT_NV_RPMB "%dname%"\UEFI_RT_NV_RPMB.img
fastboot flash PLAT "%dname%"\PLAT.img
fastboot flash MMOS "%dname%"\MMOS.img
fastboot flash EFIESP "%dname%"\EFIESP.img
fastboot flash UEFI "%dname%"\UEFI.img  
fastboot reboot
echo.
pause
goto Parts
) else (
echo Custom Folder Doesn't Exist !!!
echo Create One First.
timeout 2 >nul
goto Parts
)

::-------------------------------------------------
:X
goto Welcome

::----------------------------------------------------
:Thor
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------------  THOR2  --------------------------------**
echo **------------------------------------------------------------------------**
echo ****************************************************************************
echo.
echo ***************************************************************************
echo **                                                                       **
echo **   If WDRT is not added to path, copy this script and run this segment **
echo **   from within the WDRT folder.                                        **
echo **                                                                       **
echo ***************************************************************************
echo.
echo  [0] BootFlashApp
echo  [1] MainOs and Data (th0r2)
echo  [2] FFUfile
echo  [3] Back to Main Menu
echo.
set /p thr="Select a Number : "
if [%thr%]==[] (
echo.
echo Enter a value to proceed
timeout 2 >nul
goto Thor
)

if %thr% EQU 0 goto Tfa
if %thr% EQU 1 goto Md
if %thr% EQU 2 goto Ffu
if %thr% EQU 3 goto Ex
if %thr% GTR 3 echo Not a Valid Number !
timeout 2 >nul
goto Thor

::----------------------------------------------------
:Tfa
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------------  THOR2  --------------------------------**
echo **------------------------------------------------------------------------**
echo ****************************************************************************
thor2 -mode rnd -bootflashapp
pause
goto Thor

::----------------------------------------------------
:Md
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------------  THOR2  --------------------------------**
echo **------------------------------------------------------------------------**
echo ****************************************************************************
::-----------------------------------------------------
:: How To;
:: thor2 -mode uefiflash -partitionname MainOS -partitionimagefile parts\MainOS.img
:: thor2 -mode uefiflash -partitionname Data -partitionimagefile parts\Data.img
:: or use the ffufile with
:: thor2 -mode uefiflash -ffufile <Path-to-FFU> -do_full_nvi_update -do_factory_reset
::------------------------------------------------------
echo  [0] With Default Directory (parts/Parts)
echo  [1] With Custom Directory
echo  [2] Back 
echo.
set /p thr1="Select a Number : "
if [%thr1%]==[] (
echo.
echo Enter a value to proceed
timeout 2 >nul
goto Md
)

if %thr1% EQU 0 (
thor2 -mode uefiflash -partitionname MainOS -partitionimagefile parts\MainOS.img
pause
thor2 -mode uefiflash -partitionname Data -partitionimagefile parts\Data.img
pause
thor2 -mode rnd -bootnormalmode
pause

) else if %thr1% EQU 1 (
goto Mdc

) else if %thr1% EQU 2 (
goto Thor

) else (
echo Not a Valid Number !
timeout 2 >nul
goto Md
)

::---------------------------------------------------
:Mdc
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------------  THOR2  --------------------------------**
echo **------------------------------------------------------------------------**
echo ****************************************************************************
if DEFINED  "%dname%" (
thor2 -mode uefiflash -partitionname MainOS -partitionimagefile "%dname%"\MainOS.img
pause
thor2 -mode uefiflash -partitionname Data -partitionimagefile "%dname%"\Data.img
pause
thor2 -mode rnd -bootnormalmode
pause
goto Thor
) else (
echo Custom Folder Doesn't Exist !!!
timeout 2 >nul
goto Thor
)


::---------------------------------------------------
:Ffu
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------------  THOR2  --------------------------------**
echo **------------------------------------------------------------------------**
echo ****************************************************************************
set /p ffu1="Path[p] or Name[n] to/of FFufile; Exit[x] : "
if [%ffu1%]==[] (
echo.
echo Enter a value to proceed
timeout 2 >nul
goto Ffu
)

if %ffu1% EQU p (
goto Ff1
)else if %ffu1% EQU n (
goto Ff2
)else if %ffu1% EQU x (
goto Thor
) else (
echo Not a Valid Input
timeout 2 >nul
goto Ffu
)

::------------------------------------------------
:Ff1
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------------  THOR2  --------------------------------**
echo **---------------------------- Path Selection ----------------------------**
echo ****************************************************************************
set /p ffu2="Type, Paste or Tab Complete Path of FFufile; Exit[x] : "
if [%ffu2%]==[] (
echo.
echo Enter a value to proceed
timeout 2 >nul
goto Ff1
)

if %ffu2% EQU x (
goto Thor
)

thor2 -mode uefiflash -ffufile  "%ffu2%"  -do_full_nvi_update -do_factory_reset
pause

thor2 -mode rnd -bootnormalmode
pause
goto Thor

:Ff2
cls
echo ****************************************************************************
echo **------------------------------------------------------------------------**
echo **-------------------------------  THOR2  --------------------------------**
echo **---------------------------- Name Selection ----------------------------**
echo ****************************************************************************
echo ---------------------------------------------------
echo Script to be in the same Directory as the FFufile
echo ---------------------------------------------------
set /p ffu3="Type, Paste or Tab Complete Name of FFufile; Exit[x] : "
if [%ffu3%]==[] (
echo.
echo Enter a value to proceed
timeout 2 >nul
goto Ff1
)

if %ffu3% EQU x (
goto Thor
)

thor2 -mode uefiflash -ffufile  "%cd%\%ffu3%"  -do_full_nvi_update -do_factory_reset
pause

thor2 -mode rnd -bootnormalmode
pause
goto Thor

::-------------------------------------------------
:Ex
goto Welcome

:Exit
exit
