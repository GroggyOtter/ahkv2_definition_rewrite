# Full Definition Upgrade and Enhancement for THQBY's AutoHotkey v2 VS Code Support Addon
This is a full update for the definition file `ahk2.d.ahk` and the directive/flow control/variable file `ahk2.json` for [THQBY's AHKv2 support addon](https://github.com/thqby/vscode-autohotkey2-lsp).
***
### Contents
- [Why use this update](#why-use-this-update)
- [Installation](#installation)
- [Auto-Updater](#auto-updater)
- [In-depth Showcase](#in-depth-showcase)
- [Different Widget Types](#different-widget-types)
- [Will THQBY Implement This?](#will-thqby-implement-this)
- [Change Log](#change-log)
  - [2024-07-11](#2024-07-11)
  - [2024-07-04](#2024-07-04)
  - [2024-07-02 (Big Update)](#2024-07-02-big-update)
  - [2024-04-20](#2024-03-20)
  - [2024-03-20](#2024-03-20)
  - [2024-03-19](#2024-03-19)
  - [2024-03-18 (Big Update)](#2024-03-18-big-update)
  - [2024-01-10](#2024-01-10)
  - [2024-01-09](#2024-01-09)
  - [2024-01-08](#2024-01-08)
  - [2023-12-24](#2023-12-24)
  - [2023-12-18](#2023-12-18)
***

### Why use this update
[`[Return to Contents]`](#contents)  

This is a full rewrite from the ground up. 
It adds many things to the definition that it's currently missing.  
All parameters are included, all functions and methods have return values, the text of the calltips are now formatted and more aesthetically pleasing, hyperlinks are added, all options are accounted for, the structure of the definition file has been expanded and updated, autocomplete features have been added for directives and flow control, and much more.

To put things in perspective, the current definition file is ~4,200 lines long and ~185,000 characters.  
The updated definition file is ~24,000 lines long and ~1,510,000 characters.  
The information difference is substantial and borderline palpable.  
In all fairness, a chunk of this character increase comes from the numerous hyperlinks, markdown formatting, and individual GUI controls added coupled with them now having individualized methods and properties.  

Please see the In-depth Showcase section to see a large listing of the numerous changes I've implemented to these files.  
There are pictures and videos for almost every topic covered.

***

### Installation 
[`[Return to Contents]`](#contents)  
There are multiple ways to update the definition file.  

To do it automatically, use the provided Auto Updater file.  
`definition_updater.v2.ahk`

To do it manually, start by optionally backing up your original files.  
`ahk2.d.ahk` and `ahk2.json`  
If you delete them and decide you want to go back to the standard definition files, they can always be redownloaded from [THQBY's GitHub for the addon](https://github.com/thqby/vscode-autohotkey2-lsp/tree/main/syntaxes).  

Now download the `ahk2.d.ahk` and `ahk2.json` files.  
Copy them into the addon's `syntaxes` folder.  
The default location for this folder is:

    C:\Users\<YourUsername>\.vscode\extensions\thqby.vscode-autohotkey2-lsp-<HighestVersionNumber>\syntaxes

Alternatively, you can always copy and paste the text from here to the installed ones on your computer.  
***

### Auto-Updater
[`[Return to Contents]`](#contents)  
I've written an auto-updater so you don't have to keep updating the file.  
It can be ran as its own script or can be copy and pasted into a main script, as the updater is self-contained and will auto-run.

Properties and methods of the updater:

- Methods:
  - `start()` = Starts/enables update checking  
  - `stop()` = Stops/disables update checking  
  - `force_check()` = Forces a 1-time check.
      - This does not affect on/off status.

- Properties:
  - `frequency` = How often to check for updates, in hours.  
    This can be a fractional number: 1.5 = 1 hr 30 min  
    Default value is 4.  
  - `notify` = If set to true, TrayTips will pop up to notify of updates or errors.  
    Setting this to false will suspend all TrayTip popups.
  - `update_updater` = Set to false if you don't want the auto-updater updating itself.

***

### In-depth Showcase
[`[Return to Contents]`](#contents)  
- All [classes](https://i.imgur.com/yWE0gy2.png), [functions](https://i.imgur.com/i5SxgMR.png), [methods](https://i.imgur.com/yRKoani.png), and [properties](https://i.imgur.com/yiMJbvX.png) now have complete information provided for them.

- I've applied a set standard of JSDoc tags to all these items.
  - Examples:
    - [EVERYTHING starts with an `@description` tag](https://i.imgur.com/lw8VaiZ.png) and provides a hyperlink (mentioned below) to that item's official online doc pages.
    - A function will always list all [parameters and their types](https://i.imgur.com/HYLfynA.png), [return values and types](https://i.imgur.com/GLih0VE.png), and any listed [throw errors](https://i.imgur.com/xiHrryF.png).
      - This is everything you need to utilize a function or method.
    - Properties will always list [the value type](https://i.imgur.com/TgQFXhq.png).

- I've applied Markdown formatting to each item so the displayed popup (called a widget) has formatted text.
  - A Gui control's `Opt()` method is a great example. (Please note that this is one of the largest calltips)
    - [Tables](https://i.imgur.com/gajdRkx.png)
    - [Headers](https://i.imgur.com/bQVHPrh.png)
    - [Bulleted lists](https://i.imgur.com/lNDYksc.png)
    - [Code blocks](https://i.imgur.com/jWjV2N3.png)
    - More

- ALL methods and functions now have a return value.
  - If a function or method has no actual defined return value and uses the default "empty string", it's [explicitly marked as `EmptyString`](https://i.imgur.com/BiosGhy.png).

- I've updated and rewritten some of the [descriptions](https://i.imgur.com/yxRZ7qz.png), [parameters](https://i.imgur.com/q3SGxPl.png), etc. to be more clear and understandable.
  - This is a big one for me. It's important that people understand exactly how something works.
  - I strive to use proper terminology, but I also choose my words carefully, trying to never be ambiguous.

- Added my own custom "things" to the script
  - Examples:
    - My own personal [RegEx cheat sheets](https://i.imgur.com/VuJEr5i.png) that I created for this file.
    - Custom `@example` tags (mentioned below).
    - Other stuff.

- [Hyperlinks (everything in blue text)](https://i.imgur.com/yCvTcz1.png) have been added. Plenty of them.
  - As mentioned above, every class, function, method, and property now starts with an `@description` tag that starts with the name of the item and that name is always a hyperlink to the respective online docs page.
  - There are multiple other links throughout the calltips.
  - All ["Related" items from the docs](https://i.imgur.com/pS4Jj9m.png) are now included in the [calltip's `@see` tag](https://i.imgur.com/jGbVza8.png).
    - The links are not limited to the ones listed. I've included other links that I thought would be beneficial, such as linking to [regex101.com and an online regex cheat sheet in the RegExMatch() and RegExReplace() functions](https://i.imgur.com/sCkTDic.png).  

- The `ahk2.json` file has also been updated with a lot of new menus and auto-complete features.
  - Directives with a set amount of options now show those options in a popup instead of expecting you to type them.
    - [`#MaxThreadsBuffer`](https://i.imgur.com/eNv5lIj.png)
    - [`#UseHook`](https://i.imgur.com/nkyaurP.png)
    - `#Warn` has [two](https://i.imgur.com/CQfitck.png) different [menus](https://i.imgur.com/S4SzUbn.png).
  - Directives where you're expected to type one or more fields prepopulate those fields and describe what each field expects.
    - `#ClipboardTimeout` shows [it expects milliseconds](https://i.imgur.com/ZRWxqaW.mp4).
    - `#MaxThreads` shows the [value must be between 1 and 255](https://i.imgur.com/j2wTys4.png).
    - `#Include` tells you [it expects a file, directory, or <library>](https://i.imgur.com/JFBxXC9.mp4).
  - [`#Requires` got an overhaul](https://i.imgur.com/3eVwt2t.mp4) and now provides multiple menus to generate the requirement. It also respects Semantic Versioning.
    - Version operator (less than, greater than, etc...)
    - Minor revision. 1 or 2.
    - Patch revision. 0 through 11 at the time of me writing this.
    - And finally bit requirement
  - All loops have a pre-defined setup, so [each one is setup with some form of auto-complete](https://i.imgur.com/aEuPFLb.mp4).

- Custom examples galore.
  - I've written an `@example` tag for many of the [functions](https://i.imgur.com/tjeDnjv.png) and [methods](https://i.imgur.com/HjvMHTr.png) (though only about 1/2 of them are done)
    - Doing this exposes people to the different ways something can be used or even different ways to write code in general.
    - I'll be continuing to add more over time.
    - Some examples show the different configurations or ways to use a command.
      - [`Click()`](https://i.imgur.com/yeZUJjN.png) would be a good example of this.
    - A lot of examples show a functioning piece of code that demonstrates how to use one or more items.
      - The [`AddSlider()` example](https://i.imgur.com/sBNyBJK.png) creates a GUI with a slider to control system volume.
  - Code in the @example tag is properly syntax highlighted. How very meta!
  - Text from the calltips can be [copied and pasted directly into the editor](https://i.imgur.com/ftwvN1W.mp4).
    - This can eliminate a lot of typing, especially when working with GUIs.

- All GUI controls are now defined as their own class.
  - Blanket methods and properties for GUI Controls have been removed and replaced with individual classes.
  - This ensures each control object now registers as its own control type.
    - Before, a button, checkbox, and edit field would all show as a `Gui.Control` whereas now they show as `Gui.Button`, `Gui.Checkbox`, and `Gui.Edit` respectively.
  - Each control now only contains information pertaining to that specific control.
    - `OnEvent()` for example:
      - Before, [`OnEvent()` listed all possible event types](https://i.imgur.com/IEhfmiL.png) for all control types, regardless if they can be used by the control type.
      - Now, each method and property that contains unique information has its own calltip.
      - A Button control's `OnEvent()` includes "Click" but not "Change" because buttons don't have change events.
      - Conversley, an Edit control's `OnEvent()` includes "Change" but not "Click", making writing code easier.
    - `Value` for example:
      - A [Checkbox control's value](https://i.imgur.com/ghygzrS.png) explains it stores the state of the checkbox and can be a `1`, `0`, or `-1`
      - A [DateTime control's value](https://i.imgur.com/PyxY7YS.png) sets/gets the current date-time stamp in YYYYMMDDHH24MISS format.
        - Don't know what that format means? Good thing it's a hyperlink to the docs page explaining it!

- `@throw` tags have been included to [show what causes certain errors](https://i.imgur.com/xiHrryF.png).
  - This should help when troubleshooting or writing your own error handling.

- An `InputBox object class` has been [added to the definition file](https://i.imgur.com/XS4twV0.png) and associated with the return value of InputBox().
  - This ensures that when working with any object returned by InputBox(), it will provide the [`Value`](https://i.imgur.com/xcf3izs.png) and [`Result`](https://i.imgur.com/Xev3S7I.png) properties to the user in the autocomplete menu.
  - This also allows those specific properties to be defined like all other properties.

- I've tried to ensure every possible option available for each parameter and property (within reason) is included.  
  - For some functions and methods, this can cause some calltips to be long. For example:
    - Format(): [1](https://i.imgur.com/MO1sJHL.png), [2](https://i.imgur.com/wlzNXYJ.png), [3](https://i.imgur.com/oeyHKyO.png)
      - [Current Format()](https://camo.githubusercontent.com/0185bea594b1571d1e5627fc3ddd34de87292d13e7acbcc8d7c4e9c34f586d0d/68747470733a2f2f692e696d6775722e636f6d2f314d43574a526b2e706e67)
    - Gui.AddTYPE(): [1](https://i.imgur.com/AS3ngsC.png), [2](https://i.imgur.com/d0qxezI.png)
    - [GuiCtrl.Opt()](https://i.imgur.com/yPIshCd.png)
    - RegExMatch(): [1](https://i.imgur.com/gPhxc11.png), [2](https://i.imgur.com/RhKkApA.png), [3](https://i.imgur.com/RhKkApA.png)
    - MsgBox(): [1](https://i.imgur.com/AFQ3qxE.png), [2](https://i.imgur.com/myahX9F.png)
      - [Current MsgBox()](https://camo.githubusercontent.com/9e5a944135282f836d3d9d175ece584ea4cdf91c44bb27707b93c60094474db3/68747470733a2f2f692e696d6775722e636f6d2f4c6f4378386b362e706e67)
    - DllCall(): [1](https://i.imgur.com/ePutO0l.png), [2](https://i.imgur.com/0UJI8sJ.png)
  - Note that cards with elongated parameters aren't too much of a problem b/c when typing out parameters, the addon puts the current param up top.
    - This prevents a huge parameter section from eclipsing another one while you're typing out each param.

- There are other things I'm sure I'm forgetting.

***

### Different Widget Types
[`[Return to Contents]`](#contents)  

It should pointed out that there are multiple types of widgets that popup.  
- If you hover a function/method/class/property, the [hover widget](https://i.imgur.com/J2D1Aot.png) shows up.
  - It's resizeable, has the best header syntax highlighting out of all the widgets, and shows all calltip information, in order
- If you start typing a new name, the [autocomplete widget](https://i.imgur.com/lYjXtk3.png) shows up.
  - This window is also resizeable.
  - This view can be expanded [or hidden](https://i.imgur.com/MfnPPOT.png)
    - Pressing `Ctrl+Space` brings up autocomplete as well as toggles the widget window.
- If you start typing the parameters of a method of function, the [parameter widget](https://i.imgur.com/gVu03QR.png) shows up.
  - This widget is unique in the fact that it can't be resized (and I don't know why b/c all the other ones are resizeable).
  - It also puts the current parameter at the top of the card, preventing the need to scroll to get to the info.
  - Pressing `Ctrl+Shift+Space` brings up the parmeter widget whenever you're between the parentheses of a function or method.

***

### Will THQBY Implement This?
[`[Return to Contents]`](#contents)  

It seems unlikely.  
I showed the updated files to him and he immediately pass on them.  
I'm not sure he even tried them...  
I cannot convey how disappointed I am thinking about the hours I invested into this thinking it'd be picked up immediately.  
Especially considering the current incomplete and lacking state the definition file is in.  
I don't know. Maybe he'll get curious about it later, try it, and change his mind.  
Until then, I fully intend on maintaining these files and keeping them up to date.

***

### Change Log
[`[Return to Contents]`](#contents)  

##### 2024-07-11
- Updated JSON file to v1.4
  - #Requires now has the most up-to-date version
- Updated the definition updater file to v1.6
  - I was concerned that users who implement the updater into a main script file would have their main script deleted by an update.
  - Updater will now notify you of the file that needs to be updated, the version, and it will request permission before updating each file.
  - Deleted files are no longer explicitly deleted but instead moved to the recycle bin, allowing for retrieval.

##### 2024-07-04
- Updated the `definition_updater.v2.ahk` script to v1.4:
  - Fixed a problem where it would sometimes throw an error b/c it couldn't find a file.
  - Added a new "Force Definition Update" to the program's system tray menu.
    - [Right click the AHK icon](https://i.imgur.com/PGiMJ9g.png) in the system tray.
    - This immediately runs the update checker.
- Updated definition file to v1.5:
  - Added key names to all parameters that expect a key name.
    - Examples: GetKeyState() and GetKeySc()
    - I was using GetKeyState() and thought "this is stupid that I have to type out the whole key name...", hence this update.
  - Took it a step further and updated all Send() variants and InputHook() to include key names that are already wrapped in curly braces.
    - This means you no longer need to type curly braces or the full key word.
      - Example: [Typing `ent` and pressing enter](https://i.imgur.com/5kpTqa8.mp4) will insert `{Enter}`.  
      - Typing [`nump` shows all Numpad options](https://i.imgur.com/jY9sOdf.png).  
  - Added some missed options for hotstrings.

##### 2024-07-02 (Big Update)
- All functions and method parameters that have pre-defined values will now show up in the autocomplete when you're working with that parameter.
- Added __Class property to the Any object.
    - This is a property that everything in AHK has and is what Type() references.
- Added new syntax to the definition file that defines set and get values.  
- Enumerator information is now provided in the form of "generics" in the definition file.
- Updated the IL_Add() method to be more accurate and fixed the optional parameter (thanks to visua0)
- Updated all optional parameters with a value of :=[] to be :=Array to indicate an empty array.
    - Pretty much did it just so I didn't have to see the VS Code error message.
- ComObjQuery() 3rd param is set to optional (thanks to TJGinis)
    - This prompted me to fix multiple parameter problems where a parameter was marked required when it should be optional.
- Recreated all "color tables"
- Color chart tables now include hex values next to each name.
- Added "Default" to Button control options.
- Fixed a TON of random backticks that were introduced during a mass replace I did a while ago.  
  This will fix a lot of odd formatting problems you may have seen where random blocks of text are "code blocked" and they shouldn't be.
- Added the StatusBar methods and Tab methods (I can't figure out how I missed these first time around.)
- Fixed a TON of different stuff...to the point where I stopped keeping track of them.
    - You can always look at a version diff if you want see them all.
- Created MANY more examples.
    - Almost every Gui method/property has an example now
- Updated `#Requires` version numbers is ahk2.json file.

##### 2024-03-20
- Updated JSON file to include new version.

##### 2024-03-20
- Did a full rewrite of the updater to fix some bugs and an error in the code.
- Reduced code size and streamlined things. (The code looks way better now.)

- Pushed a second update because I got confirmation that encoding must be UTF-8-RAW as the file expected to be without BOM.

##### 2024-03-19
- Fixed some bugs in the auto-updater.
- Added a property to enable/disable auto-updating the auto-updater.

##### 2024-03-18 (Big Update)
- **This is one of a few big updates that will be coming to fix lots of things, continuously adding example code, and doing other improvements.**
- Added an auto-updater to the repository that should automatically keep the defintion files up-to-date.
- ahk2.json updates:
    - Added a version key to the main json file for anyone who wants to use an auto-updater
        - Format: `"version": 1.1`
    - Core revisions based on updates made by THQBY.
    - ahk_criteria, such as ahk_exe, ahk_class, etc., are now recognized in any field that expects a WinTitle.
        - This includes functions like WinActivate(), WinExist(), ControlClick(), ControlGetPos(), etc.
    - THQBY has moved most built-in var descriptions to the ahk2.d.ahk file.
        - I've applied standardized tags to all of them including hyperlinks to their docs pages, formatted text, improved descriptions, and many examples of how to utilize them.
    - Hotstring options have been added to the json file but I haven't figured out exactly what they do. HotString() seems to perform the same with and without them.
    - The keyword Static now has an autocomplete for creating variables and methods
    - Per /u/Laser-Made's request, each loop type's definition includes a list of A_LoopVARTYPE variables available to that specific loop.
        - Examples:
            - Parse-loop's definition now shows it has access to A_Index and A_LoopField.
            - Registry-Loops have access to A_Index, A_LoopRegName, A_LoopRegType, A_LoopRegKey, and A_LoopRegTimeModified.

- ahk2.d.ahk updates:
    - Added a version tag to the top of the file for anyone who wants to use an auto-updater
        - Format: `;@region v1.1`
    - Per THQBY's update, most built-in variables are now included in the ahk2.d.ahk file instead of the JSON file.  
    - Lots of small changes throughout the file. Grammar/captializations/corrected errors/etc.
    - The @see tags are now separated by pipes to make them more distinguishable from each other.
        - They're also stored on one line intstead of individual lines.
    - Added many more examples.
        - Started adding comments to some of the example code to assist with learning and understanding.
        - I've made it a point to not write everything the same way in an attempt to expose people to the many ways things can be structured and written.
            - Examples: Using both traditional and fat arrow functions
            - Parsing text by using both parse-loops and StrSplit()
            - Writing if-statements with curly braces (code blocks) and without by utilizing commas (multi-statement operator)
            - Putting commands on the same line as Else or Try to illustrate the different ways to use them
        - Most examples are written in a way that they can be copy+pasted into a blank file and ran.
            - Some examples are not meant to be ran, but instead illustrate the the multiple ways of using them, such as Click().

- ahk2.d.ahk specifics:
    - Any class:
        - Improved description.
    - Any.GetMethod():
        - Updated return value.
    - Any.HasBas():
        - Updated description and corrected return type from bool to integer.
    - Any.HasMethod():
        - Rewrote to be more understandable and clearly worded.
        - Added new examples.
    - Any.HasProp():
        - Updated description.
        - Added example.
    - __Init():
        - Added a description as it lacked one.
    - __Delete():
        - Added to the definition file and should appear in autocomplete now.
        - Given a description.
    
    - Object class:
        - Updated description.
        - Added examples.
    - Object.Clone():
        - Updated description.
        - Improved example code.
    - Object.DefineProp():
        - Updated description.
        - Added more example code.
    - Object.DeleteProp():
        - Updated description.
        - Added better example code.
    - Object.GetOwnPropDesc():
        - Updated description.
        - Added better example code.
    - Object.OwnProps():
        - Updated description.
        - Added better example code.
    
    - Array class:
        - Updated description.  
    - Array.__Item:
        - Updated description.
        - Corrected an error.
        - Updated and improved examples.
    - Array.Default:
    - Array.__Item:
        - Uprdated definition to be more clear and inclusive.
    - Array.Clone():
        - Updated definition to be more clear about shallow copies.
        - Improved example code.
    - Array.Delete():
        - Corrected an error in its description.
        - Added error.
        - Improved example.
    - Array.Get():
        - Clarified return value.
        - Updated example to show more variation and usage.
    - Array.Has():
        - Clarified when it returns true.
        - Improved example.  
    - Array.InsertAt():
        - Rewrote definition to clarify multiple things.
        - Corrected an error in the description.
        - Improved existing code and added more examples for clairfication.
        - Updated AdditionalValues parameter to be variadic.
    - Array.Pop():
        - Improved definition.
    - Array.Push():
        - Rewrote definiton to be more accurate and informative.  
        - Added more examples.
    - Array.RemoveAt():
        - Corrected erroneous information in the description.
        - Improved overall description.
        - Improved example code.
    - Array.__New():
        - Updated definition to clarify __New() should not be called directly
    - Array.__Enum():
        - Updated enumerator's definition.
        - Updated and added to examples.
    
    - Buffer class:
        - Updated definition.
        - Corrected default values from Unset to 0.
    - Buffer.__New():
        - Updated definition.
        - Included default values.
    
    - ClipboardAll class:
        - Updated definition.
        - Added example code.
    - ClipboardAll.Ptr:
        - Updated definition.
             - Added @throw error
    - ClipboardAll.Call():
        - Updated definition to be more clear.
        - Included information I missed before.
    - Class():
        - Improved and expanded the definition.
    - Class.Prototype:
        - Improved definition
        - Changed return type from Prototype to Object, as this is how the addon needs to see it
            - There is no "prototype object" in AHK. Just an object we refer to as the "prototype".
    
    - Error class:
        - Did a full update to all error sub-types and descriptions
    - Error.Stack:
        - Rewrote definition to be easier to understand.
        - Improved what the output structure looks like.
    - Error():
        - Example code was improved.
    - All the error subtypes:
        - Updated definitions to be more clear.
        - Provided type-specific properties and parameters.
            - Such as Message and Extra info for TypeError and ValueError
    
    - OSError Class:
        - Added missing number property and definition (Thanks THQBY)
        - Updated definition.
        - Changed the first parameter to ErrorNumber and assigned the correct default value to it.
    
    - File class:
        - Updated definitions for almost all properties and methods.
        - Included number range and byte sizes with each type of Read()/Write() method.
        - Ensured each method now has some form of example.
    
    - Func.Bind():
        - Improved description.
        - Added more examples.
    
    - Func.IsByRef():
        - Improved description.
        - Added more examples.
    
    - Func.IsOptional():
        - Improved description.
        - Added more examples.
    
    - BoundFunc Class:
        - Updated description.
        - Added examples for both types of boundfuncs.
    
    - Enumerator Class:
        - Added new examples to show enumerator structure and use.
        - Included examples for making any object enumerable with a custom enumerator.
    
    - Closure Class:
        - Updated definition and added better example code that differntiates between closures and static nested functions.
    
    - Gui Class:
        - New example code showing the many fascets of making a GUI.
    
    - Gui.Control Class:
        - Added a description and properties to class definition.
        - Updated the description of almost all properties and methods belonging to this class.
        - Added example code to all properties and methods of this class.
    
    - ComCall():
        - Made function call variadic as multiple type/args can be passed. (Thanks /u/bleurgh96230)
        - Changed return type form an `String | Integer` to `Primitive`.
    
    - DateDiff():
        - Updated description to state required format.
    
    - Exp():
        - Fixed return value type from String to Number.
    
    - NumGet():
        - Completely overhauled this function.
        - Corrected a syntax error.
        - Made things more understandable
        - Created a new "data type" table, including byte/bit information.
        - Added multiple examples.
    
    - NumPut():
        - Completely overhauled this function.
        - Corrected a syntax error.
        - Made things more understandable
        - Created a new "data type" table, including byte/bit information.
        - Added multiple examples.
        - Made function variadic as to not cause an error when setting multiple numbers.
            - Due to limitations, the variadic parameter is the offset, which is incorrect.
            - Currently, there is no way to tell the addon that the first 2 parameters can be repeated any number of times.
            - It's a bandaid until THQBY comes up with a more elegant solution to this.

    - ObjBindMethod():
        - Made function variadic to pre

    - PixelGetColor:
        - Added example code.
    
    - SendMessage():
        - Fixed doc URL.
    - SendMode():
        - Fixed doc URL.
    
    - WinGetTransparent():
        - Fixed @see links


##### 2024-01-10
- Updated a lot of the verbiage in the `Format()` tag to make it more understandable.
- Removed unused tags left over from template pasting.
- Adjusted formatting of `@throw` tags.
- Added missing "Related" links to the `@see` tag for `OnError()`.

##### 2024-01-09
- Rewrote and restructured the entire ReadMe file for this GitHub page.  
- Added a plethora of pictures and videos to the showcase section.
- Fixed InputBox() `Result` and `Value` information, as they were accidentally swapped.
- Added more examples to the code.
- Multiple formatting fixes.
- Fixed `ObjRelease()` not having the `Ptr` param in the function definition. (Thanks camkidd)
- Fixed a description error in Array's `Get()` and `Has()` methods.

##### 2024-01-08
- Fixed a typo in the autocomplete for `Loop Count` that included an invalid comma between the two. (Thanks /u/Hukepi)
  - This shows how ingrained some v1 syntax is in me.
- Fixed `FileSelect()` root directory and title parameter default.

##### 2023-12-24
- Fixed a bunch of typos and errors.
- Fixed functions/methods that should have had variadic parameters.
- Added String, Integer, Number, and Float class `Call()` functions and calltips.
- Added ComObjArray, ComObject, and ComValue class `Call()` functions and calltips.
- Cleaned up a lot of tags to try and make them more compact.
- Updated `ahk2.json` with new version for #Requires.

##### 2023-12-18  
- All functions, classes, methods, and properties are done.  
- Added `ahk2.json` file. This includes many updates to directives and flow control statements.  
- [Some examples can be seen here.](https://github.com/GroggyOtter/ahkv2_definition_rewrite/assets/29220773/8cafcd52-823c-4861-aa29-5f6a3452e8da)  
