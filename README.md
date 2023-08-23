# LokiStart Project

This powershell scripts meant to help you download and install all the mandatory software tools when you choose [CC23xx](https://www.ti.com/product/CC2340R5), the MCU based BLE (low energy bluetooth) chip designed and manufactured by [Texas Instruments](https://www.ti.com/).

## How to use
1. Open the `LokiStar_release_vx.0.ps1` with VS Code or other editors.
```
Note:
- For release v2.0, you should change the USER_NAME to your own.
- For release v3.0, directly execute it and you will find the softwares are under path `C:\ti\ti-cc2340`.
```

3. Change directory to where you download the script, open a powershell terminal.
```c
.\LokiStart_release_v2.0.ps1
```
or 
```c
.\LokiStart_release_v3.0.ps1
```

## Feature Not Support

I don't want to make this tools so sofisticated, so there won't be so much features in this project.

**You have my word, simple is more.**

1. Do not need to change the script, just run it, and it will prepare all the softwares
- [Why not] I want to download the softwares under `.\Downloads\`, so it needs your own user name on a specific PC.
2. Select the versions of the software you want.
- [Why Not] SDK is not a software that changes frequently, and I don't want to let yourself to choose the SDK version.
3. Check whether the download is successful.
- [Why Not] I'm still learning how to do it.
4. Check whether there is a update of the softwares.
  - [Why Not] I'm still learning how to do it.

## Plan for the change

This project will only has the `main` branch, I will add new release when new SDK released.
