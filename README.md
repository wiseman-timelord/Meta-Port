# MetaPort

### STATUS: WORKING
- It, works as intended with multi-instance and now has truly portable version. Further development includes...
1. Refinement of printed text.

## DESCRIPTION
- MetaPort is two batches placed in the MetaTrader 5 directory that neatly runs, MetaTrader and MetaEditor, in Portable mode, as such it uses its own directory to store all the files. There are 2 reasons you may want to do this, I use it for both these reasons...
1. To not run out of activations on Expert Advisors, for example when you reinstall the OS.
2. Run multiple accounts/instances on the same machine, for example, one forForex and one for Metals (with the Multi-Versions). Though this still uses "%APPDATA%\MetaQuotes\", and so is not able to be used between different machines.
3. Run single accounts/instances on any machines, for example, take it with you to work/home/holiday (with the Single-Versions). The thing is, and I WARN YOU EXPLICITLY, when you run single version it will delete the "%APPDATA%\MetaQuotes\" folder, as it needs to create a symbolic link in its place, that points to the portable directory. This is the solution to using "%APPDATA%\MetaQuotes\".

### FEATURES
- **Clear Interface**: Text confirmations with short wait commands, explaining what is going on.
- **Self-Termination**: The batch closes itself after running MetaTrader.

### PREVIEW
- Single...
```
Launcher Initialized...


Setting Temporary Dirs..
..Temporary Directories Set.

Found existing MetaQuotes directory
. Attempting to delete...
MetaQuotes directory deleted succes
sfully.
symbolic link created for C:\Users\
Mastar\AppData\Roaming\MetaQuotes <
<===>> D:\ProgsOthers\MetaPort-Test
\MetaQuotes
Symlink created successfully.

Launching MetaTrader 5 Portable..
..Terminal 5 Portable Launched.


...Script Complete.

```
- Multi...
```

Launcher Initialized...


Setting Temporary Dirs..
..Temporary Directories Set.

Launching MetaTrader Portable..
..MetaTrader Portable Launched.


...Script Complete.

```

## REQUIREMENTS
- Windows with scripting host enabled.
- Installation of MetaTrader 5.

### USAGE
1. Copy your MetaTrader 5 program directory to a safe location, such as for example `DRIVE:\PARENT FOLDER\Meta-Port`, somewhere that dont have permission issues, ie not `C:\Program Files\SOME FOLDER`.
2. Put, `MetaPort-TradeMulti.Bat` and `MetaPort-EditMulti.Bat` in same dir as "Terminal64.exe", or if you only intend to use, one account on one instamce, then you can make it fully portable with, `MetaPort-TradeSingle.Bat` and `MetaPort-EditSingle.Bat`, see explenation in "DESCRIPTION" section.
3. Run, `MetaPort-TradeMulti.Bat` by double clicking it, or `MetaPort-TradeSingle.Bat` by right click "Run As Admin", therein, the admin can be assigned if you make it into a shortcut, then do the cmd.exe /c thing detailed in "NOTATION" section below.
5. Set your stuff up again in MetaTrader 5, it will save for next time if you close MetaTrader 5.
6. When everything Setup (including the EAs you use), back it up, this is now your Master for install/restore purposes.

### NOTATION
- If you have issues, and dont mind potentially corrupting your install, then you can run `Take Ownership` on the portable MetaTrader 5 directory, I found some settings were not saving otherwise, but I also found this not neccessary at other times.
- If you intend to run multiple "MetaPorts", then use a command such as `start /min "" ".\terminal64.exe" /portable` in the batch instead, soes they all start minimized. 
- It turned out to not be possible to run MetaPort on other machines, you need to make up a portable directory from the metatrader 5 on the machine you are using it on.
- If you want to run multiple accounts on same machine, then duplicate the resulting portable folder.
- If you want a shortcut to the batch, ensure the Target field looks like this `C:\Windows\System32\cmd.exe /c "DRIVE:\PATH TO BATCH\Port-Trade.Bat"`, if you want it on your TaskBar.
- Do not copy across activated EAs from your normal install to the portable directory, this will not work.
- Issues with multi-core now fixed, phew, almost resulted to reinstalling my OS, and even as a last resort installing a beta Motherboard Bios.
  
## DEVELOPMENT
- Use same theme of windows and text as my other batch launchers.

## DISCLAIMER
This software is subject to the terms in License.Txt, covering usage, distribution, and modifications. For full details on your rights and obligations, refer to License.Txt.
