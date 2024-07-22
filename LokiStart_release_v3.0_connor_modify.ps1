# LokiStart V3.0
$LokiStart_Verison_Tag = 'V3.0'
$Description = 'Change download directory into C:\ti\ti-cc2340'

$origin_director = pwd

#############################################################################################################################################################################################
########################################################### [Do not change] URL and NAME of the Softwares ###################################################################################
#############################################################################################################################################################################################
$ccs_version = '12.4.0'
############################### Get latest sdk version through gihub ########################################################################################################################
$sdk_product_json_url = "https://raw.githubusercontent.com/TexasInstruments/simplelink-lowpower-f3-sdk/main/.metadata/product.json"
$sdk_product_json_file = Invoke-RestMethod -Uri $sdk_product_json_url
$sdk_version = $sdk_product_json_file.version

$compiler_verison = '2.1.3.LTS' #'2.1.2.LTS'
$rtos_version = '202104.00'

$ccs_name = 'CCS12.4.0.00007_win64'
$sdk_line_name = $sdk_version -replace '\.','_'
$sdk_name = 'simplelink_lowpower_f3_sdk_' + $sdk_line_name #'simplelink_lowpower_f3_sdk_7_10_00_35'
$compiler_name = 'ti_cgt_armllvm_2.1.3.LTS_windows-x64_installer' #'ti_cgt_armllvm_2.1.2.LTS_windows-x64_installer'
$rtos_name = 'FreeRTOSv202104.00'

$ccs_url = 'https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-J1VdearkvK/'+ $ccs_version + '/' + $ccs_name + '.zip'
$sdk_url = 'https://dr-download.ti.com/software-development/software-development-kit-sdk/MD-emMPuXshOG/' + $sdk_version + '/' + $sdk_name + '.exe'
$compiler_url = 'https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-ayxs93eZNN/' + $compiler_verison + '/' + $compiler_name + '.exe'
$rtos_url = 'https://github.com/FreeRTOS/FreeRTOS/releases/download/' + $rtos_version + '/' + $rtos_name + '.zip'
#############################################################################################################################################################################################
#############################################################################################################################################################################################
#############################################################################################################################################################################################

###################################
Write-Host "##################### Connor logging #####################`n"
Write-Host "URL of CCS: `n$ccs_url"
Write-Host "URL of SDK: `n$sdk_url"
Write-Host "URL of compiler: `n$compiler_url"
Write-Host "URL of rtos: `n$rtos_url`n"

# Getting Start
Write-Host "##################### LokiStart $LokiStart_Verison_Tag #####################`n"

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
Write-Host "`n------------------------ Start Download CCS ------------------------"
$ccs_zip = $ccs_name + '.zip'
$ccs_dl_path = $Download_Path +'\'+ $ccs_zip
if (Test-Path $ccs_dl_path) {
    Write-Host "File already exists: $ccs_dl_path"
} else {
    $ccs_dl_handle = new-object System.Net.WebClient
    $ccs_dl_handle.DownloadFile($ccs_url, $ccs_dl_path)
}
$ccs_unzip_path = $Download_Path + '\' + $ccs_name
if (Test-Path $ccs_unzip_path) {
    Write-Host "Already unzipped: $ccs_unzip_path"
} else {
    Write-Host 'Start Unzip...'
    Expand-Archive -Path $ccs_dl_path -DestinationPath $Download_Path
}
cd $ccs_unzip_path
Write-Host 'Download Success, Start Install CCS...'
$ccs_exe = Get-ChildItem -Path $ccs_unzip_path -Recurse '*ccs_setup*.exe'
try {
    Start-Process -FilePath $ccs_exe -Wait -ErrorAction Stop
}
catch {
    "Skip installing $ccs_exe, please confirm you have installed the CCS correctly!"
}

# Download SDK
Write-Host "`n ------------------------ Start Download SDK ------------------------"
cd $Download_Path
$sdk_name = $sdk_name + '.exe'
$sdk_dl_path = $Download_Path +'\'+ $sdk_name
if (Test-Path $sdk_dl_path) {
    Write-Host "File already exists: $sdk_dl_path"
} else {
    sdk_dl_handle = new-object System.Net.WebClient
    sdk_dl_handle.DownloadFile($sdk_url, $sdk_dl_path)
}
Write-Host 'Download Success, Start Install SimpleLink SDK...'
$sdk_exe = Get-ChildItem -Path $Download_Path -Recurse '*simplelink_lowpower_f3_sdk*.exe'
try {
    Start-Process -FilePath $sdk_exe -Wait -ErrorAction Stop
}
catch {
    "Skip installing $sdk_exe, please confirm you have installed the sdk correctly!"
}

# Download Compiler Toolchain
Write-Host "`n------------------------ Start Download TI-Clang ------------------------"
cd $Download_Path
$compiler_name = $compiler_name + '.exe'
$compiler_dl_path = $Download_Path +'\'+ $compiler_name
if (Test-Path $compiler_dl_path) {
    Write-Host "File already exists: $compiler_dl_path"
} else {
    $compiler_dl_handle = new-object System.Net.WebClient
    $compiler_dl_handle.DownloadFile($compiler_url, $compiler_dl_path)
}
Write-Host 'Download Success, Start Install TI-Clang...'
$compiler_exe = Get-ChildItem -Path $Download_Path -Recurse '*ti_cgt_armllvm*.exe'
try {
    Start-Process -FilePath $compiler_exe -Wait -ErrorAction Stop
}
catch {
    "Skip installing $compiler_exe, please confirm you have installed the compiler correctly!"
}

# Download FreeRTOS
Write-Host "`n------------------------ Start Download FreeRTOS ------------------------"
cd $Download_Path
$rtos_dl_path = $Download_Path +'\' + $rtos_name + '.zip'
if (Test-Path $rtos_dl_path) {
    Write-Host "File already exists: $rtos_dl_path"
} else {
    $rtos_dl_handle = new-object System.Net.WebClient
    $rtos_dl_handle.DownloadFile($rtos_url, $rtos_dl_path)
}
Write-Host 'Download Success, Start Unzip Free-RTOS...'
if (Test-Path $rtos_dl_path) {
    Write-Host "Already unzipped: $rtos_dl_path"
} else {
    Write-Host 'Start Unzip...'
    Expand-Archive -Path $rtos_dl_path -DestinationPath $Download_Path
}
Write-Host 'Unzip Success. you should add this unzip path into CCS project as FREERTOS_INSTALL_DIR when you want to use RTOS'

# # End of the scripts
Write-Host "`n------------------------ Finish!!! ------------------------"
Write-Host "Please find the CC2340 related softwares in path: $Download_Path `n"

cd $origin_director