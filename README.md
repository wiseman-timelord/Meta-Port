# MetaPort

### STATUS: WORKING
- It, works as intended. Further development includes...
1. Refinement of printed text.

## DESCRIPTION
- MetaPort is two batches placed in the MetaTrader 5 directory that neatly runs, MetaTrader and MetaEditor, in Portable mode, as such it uses its own directory to store, all or most, of the files. You will not be using Both, multi and single, versions, either you need to use one account between multiple computers, or you want to use multiple accounts on the same computer. Multiple instances means you will be able to mess around on a demo account, while not altering the main trader insterface configuration, this is VERY useful, and prevents accidental closure of charts when closing tabs related to backtesting. 
1. With the Multi-Versions - Run multiple accounts/instances on the same machine, for example, one forForex and one for Metals, or one for demo account and one for trading. . Though this still uses "%APPDATA%\MetaQuotes\", and so is not able to be used between different machines.
2. With the Single-Versions - Run single accounts/instances on any machines, for example, take it with you to work/home/holiday. The thing is, and **I WARN YOU EXPLICITLY**, when you run single version it will delete the "%APPDATA%\MetaQuotes\" folder, as it needs to create a symbolic link in its place, that points to the portable directory. This is the solution to using "%APPDATA%\MetaQuotes\". Potentially you could run it off a memory stick or the likes, maybe for day-traders on the go? Either way, there is a "fully portable" version and you have been warned!
3. There is additionally the, Personal or Server, Versions of the script, whereby, the user may choose the personal version for customization of setup or editing, or the server version intended for automated launching, without the menu and editor oprions.

### FEATURES
- **Infinite Licenses**: To not run out of activations on Expert Advisors, for example when you reinstall the OS (Single Version).
- **Multi-Instance**: Run multiple accounts in multiple Metatrader windows (Multi Version).
- **Clear Interface**: Text confirmations with short wait commands, explaining what is going on.
- **Self-Termination**: The batch closes itself after running MetaTrader.
- **Auto-Folders**: Automatic creation of required folders, ".\Temp" and ".\MetaQuotes" (Single Version).
- **Differing Editions**: The user can run, personal or server, versions of the script.

### PREVIEW
- Launch Menu...
```



         MetaPort Launch Menu
         --------------------

     1. MetaTrader (Terminal64.exe)

    2. MetaEditor (MetaEditor64.exe)


Select; Options = 1-2, Exit = X:




```
- Single Version Processes...
```

Found existing MetaQuotes directory
Copy successful. Deleting original MetaQuotes directory
MetaQuotes directory deleted successfully.
symbolic link created for C:\Users\Mastar\AppData\Roaming\MetaQuotes <<===>> D:\ProgsOthers\MetaPort-Test\MetaQuotes
Symlink created successfully.

```

## REQUIREMENTS
- Windows with scripting host enabled.
- Installation of MetaTrader 5.

### USAGE
1. Copy your MetaTrader 5 program directory to a safe location, such as for example `DRIVE:\PARENT FOLDER\Meta-Port`, somewhere that dont have permission issues, ie not `C:\Program Files\SOME FOLDER`.
2. Put, `MetaPort-MultiPersonal.Bat` and `MetaPort-MultiServer.Bat` in same dir as "Terminal64.exe", or if you only intend to use, one account on one instamce, then you can make it fully portable with, `MetaPort-SinglePersonal.Bat` and `MetaPort-SingleServer.Bat`, see explenation in "DESCRIPTION" section. You will not be using Both, multi and single, versions, either you need to use one accound between multiple computers, or you want to use multiple accounts on the same computer.
3. If you are using the multi-version, then ensure to create 1 copy of the Portable folder with the batches, for each account you intend to use, and name the folders relevantly.
4. Run, `MetaPort-MultiPersonal.Bat` by double clicking it, or `MetaPort-SinglePErsonal.Bat` by right click "Run As Admin", therein, the admin can be assigned if you make it into a shortcut, then do the cmd.exe /c thing detailed in "NOTATION" section below.
5. Set your stuff up again in MetaTrader 5, it will save for next time after you close MetaTrader 5, like normal
6. For Automation you can now relevantly run, `MetaPort-MultiServer.Bat` or `MetaPort-SingleServer.Bat`, to run metatrader minimized without menu.

### NOTATION
- If you intend to run metatrader automated on startup, then use a command such as `start /min "" ".\terminal64.exe" /portable` in the batch instead, soes they all start minimized. 
- If you want a shortcut to the batch, ensure the Target field looks like this `C:\Windows\System32\cmd.exe /c "DRIVE:\PATH TO BATCH\Port-Trade.Bat"`, if you want it on your TaskBar.
- If you have issues, and dont mind potentially corrupting your install, then you can run `Take Ownership` on the portable MetaTrader 5 directory, I found some settings were not saving otherwise, but I also found this not neccessary at other times, possibly depends on how things are installed.
- Do not copy across activated EAs from your normal install to the portable directory, this will not work. It will work with EAs not requiring activation, but ensure they also have any relating custom indicators copied over appropriately.

## DISCLAIMER
This software is subject to the terms in License.Txt, covering usage, distribution, and modifications. For full details on your rights and obligations, refer to License.Txt.
