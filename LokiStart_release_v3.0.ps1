# LokiStart V3.0
$LokiStart_Verison_Tag = 'V3.0'
$Description = 'Change down load directory into C:\ti\ti-cc2340'

$origin_director = pwd

#############################################################################################################################################################################################
########################################################### [Do not change] URL and NAME of the Softwares ###################################################################################
#############################################################################################################################################################################################
$ccs_version = '12.4.0'
$sdk_version = '7.10.00.35'
$compiler_verison = '2.1.2.LTS'
$rtos_version = '202104.00'

$ccs_name = 'CCS12.4.0.00007_win64'
$sdk_name = 'simplelink_lowpower_f3_sdk_7_10_00_35'
$compiler_name = 'ti_cgt_armllvm_2.1.2.LTS_windows-x64_installer'
$rtos_name = 'FreeRTOSv202104.00'

$ccs_url = 'https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-J1VdearkvK/'+ $ccs_version + '/' + $ccs_name + '.zip'
$sdk_url = 'https://dr-download.ti.com/software-development/software-development-kit-sdk/MD-emMPuXshOG/' + $sdk_version + '/' + $sdk_name + '.exe'
$compiler_url = 'https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-ayxs93eZNN/' + $compiler_verison + '/' + $compiler_name + '.exe'
$rtos_url = 'https://github.com/FreeRTOS/FreeRTOS/releases/download/' + $rtos_version + '/' + $rtos_name + '.zip'
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#############################################################################################################################################################################################

# Getting Start
Write-Host  "[LokiStart]"

# Go to Downloads directory
cd 'C:\'
if (Get-ChildItem -Path $Download_Path 'ti') {
    Write-Host "C:\ti\ subfolder already exists."
} else {
    Write-Host "C:\ti\ subfolder already exists."
    Write-Host 'Make a new directory named \ti-cc2340 under \Downloads'
    mkdir ti
}
$Download_Path = 'C:\ti\'

cd $Download_Path
if (Get-ChildItem -Path $Download_Path 'ti-cc2340') {
    Write-Host "ti-cc2340\ subfolder already exists."
} else {
    Write-Host 'Make a new directory named ti-cc2340\ under C:\ti\'
    mkdir ti-cc2340
}
$Download_Path = $Download_Path + 'ti-cc2340\'

# Download and unzip CCS
Write-Host 'Start Download CCS...'
$ccs_zip = $ccs_name + '.zip'
$ccs_dl_path = $Download_Path +'\'+ $ccs_zip
$ccs_dl_handle = new-object System.Net.WebClient
$ccs_dl_handle.DownloadFile($ccs_url, $ccs_dl_path)
Write-Host 'Start Unzip...'
Expand-Archive -Path $ccs_dl_path -DestinationPath $Download_Path
$ccs_unzip_path = $Download_Path + '\' + $ccs_name
cd $ccs_unzip_path
Write-Host 'Download Success, Start Install CCS...'
$ccs_exe = Get-ChildItem -Path $ccs_unzip_path -Recurse '*ccs_setup*.exe'
Start-Process -FilePath $ccs_exe

# Download SDK
Write-Host 'Start Download SDK...'
$sdk_name = $sdk_name + '.exe'
$sdk_dl_path = $Download_Path +'\'+ $sdk_name
$sdk_dl_handle = new-object System.Net.WebClient
$sdk_dl_handle.DownloadFile($sdk_url, $sdk_dl_path)
Write-Host 'Download Success, Start Install SimpleLink SDK...'
$sdk_exe = Get-ChildItem -Path $Download_Path -Recurse '*simplelink_lowpower_f3_sdk*.exe'
Start-Process -FilePath $sdk_exe

# Download Compiler Toolchain
Write-Host 'Start Download TI-Clang...'
$compiler_name = $compiler_name + '.exe'
$compiler_dl_path = $Download_Path +'\'+ $compiler_name
$compiler_dl_handle = new-object System.Net.WebClient
$compiler_dl_handle.DownloadFile($compiler_url, $compiler_dl_path)
Write-Host 'Download Success, Start Install TI-Clang...'
$compiler_exe = Get-ChildItem -Path $Download_Path -Recurse '*ti_cgt_armllvm*.exe'
Start-Process -FilePath $compiler_exe

# Download FreeRTOS
Write-Host 'Start Download FreeRTOS...'
$rtos_dl_path = $Download_Path +'\' + $rtos_name + '.zip'
$rtos_dl_handle = new-object System.Net.WebClient
$rtos_dl_handle.DownloadFile($rtos_url, $rtos_dl_path)
Write-Host 'Download Success, Start Unzip Free-RTOS...'
Expand-Archive -Path $rtos_dl_path -DestinationPath $Download_Path
Write-Host 'Unzip Success. you should add this unzip path into CCS project as FREERTOS_INSTALL_DIR when you want to use RTOS'

# End of the scripts
Write-Host "Please find the CC2340 related softwares in path: " $Download_Path
cd $origin_director
