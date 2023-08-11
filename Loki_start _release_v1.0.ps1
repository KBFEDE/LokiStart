
# Go to Downloads directory
cd C:\Users\A0503807\Downloads\
# Make a new subfolder for TI
mkdir ti_cc2340\

# Download and unzip CCS
$ccs_dl_handle = new-object System.Net.WebClient
$ccs_dl_handle.DownloadFile('https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-J1VdearkvK/12.4.0/CCS12.4.0.00007_win64.zip', 'C:\Users\A0503807\Downloads\ti_cc2340\CCS12.4.0.00007_win64.zip')
Expand-Archive -Path C:\Users\A0503807\Downloads\ti_cc2340\CCS12.4.0.00007_win64.zip -DestinationPath C:\Users\A0503807\Downloads\ti_cc2340\
cd C:\Users\A0503807\Downloads\ti_cc2340\CCS12.4.0.00007_win64
.\ccs_setup_12.4.0.00007.exe

# Return to TI CC2340 directory
cd C:\Users\A0503807\Downloads\ti_cc2340\

# Download SDK
$sdk_dl_handle = new-object System.Net.WebClient
$sdk_dl_handle.DownloadFile('https://dr-download.ti.com/software-development/software-development-kit-sdk/MD-emMPuXshOG/7.10.00.35/simplelink_lowpower_f3_sdk_7_10_00_35.exe', 'C:\Users\A0503807\Downloads\ti_cc2340\simplelink_lowpower_f3_sdk_7_10_00_35.exe')
.\simplelink_lowpower_f3_sdk_7_10_00_35.exe

# Download Compiler Toolchain
$compiler_dl_handle = new-object System.Net.WebClient
$compiler_dl_handle.DownloadFile('https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-ayxs93eZNN/2.1.2.LTS/ti_cgt_armllvm_2.1.2.LTS_windows-x64_installer.exe', 'C:\Users\A0503807\Downloads\ti_cc2340\ti_cgt_armllvm_2.1.2.LTS_windows-x64_installer.exe')
.\ti_cgt_armllvm_2.1.2.LTS_windows-x64_installer.exe

# Download FreeRTOS
$rtos_dl_handle = new-object System.Net.WebClient
$rtos_dl_handle.DownloadFile('https://github.com/FreeRTOS/FreeRTOS/releases/download/202104.00/FreeRTOSv202104.00.zip', 'C:\Users\A0503807\Downloads\ti_cc2340\FreeRTOSv202104.00.zip')
Expand-Archive -Path C:\Users\A0503807\Downloads\ti_cc2340\FreeRTOSv202104.00.zip -DestinationPath C:\Users\A0503807\Downloads\ti_cc2340\
