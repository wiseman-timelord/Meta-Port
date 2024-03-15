# Meta-Port

### STATUS: WORKING
- It works as intended, there will be, limited or no, further development.

## DESCRIPTION
This is a batch that neatly runs MetaTrader in Portable mode, as such it uses its own directory to store all the files. There are 2 reasons you may want to do this, I use it for both these reasons...
1. To not run out of activations on Expert Advisors, for example when you reinstall the OS.
2. There is an issue assigning threads to backtesting.

### FEATURES
- **Clear Interface**: Text confirmations with short wait commands, explaining what is going on.
- **Self-Termination**: The batch closes itself after running MetaTrader.

### PREVIEW
- No frills here yet...
```

Script Initialized...


Launching MetaTrader 5 in Portable Mode..
..MetaTrader 5 Launched.


...Script Complete.











```


## REQUIREMENTS
- Windows with scripting host enabled.
- Installation of MetaTrader 5.

### USAGE
1. Copy your MetaTrader 5 program directory to a safe location, such as, `c:\Network Files\MetaTrader-Portable` or `c:\Trading Files\MetaTrader-Portable`, somewhere that dont have permission issues.
2. Put "Meta-Port.Bat" file in same dir as "Terminal64.exe". 
3. Run "Meta-Port.Bat" by double clicking it. 
4. Set your stuff up again in MetaTrader 5, it will save for next time if you close MetaTrader 5.
5. When everything setup in the portable version (including the EAs you use), back it up, then you can reinstall your OS as many times as you like, and each time just plop in the backed up MetaTrader 5 Portable, the activations should theoretically be ok.

### NOTATION
- Do not copy across activated EAs from your normal install to the portable directory, this will not work.
- Issues with multi-core now fixed, phew, almost resulted to reinstalling my OS, and even as a last resort installing a beta Motherboard Bios.
  
## DEVELOPMENT
- Use same theme of windows and text as my other batch launchers.

## DISCLAIMER
This software is subject to the terms in License.Txt, covering usage, distribution, and modifications. For full details on your rights and obligations, refer to License.Txt.
