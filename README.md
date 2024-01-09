# Full Definition Upgrade and Enhancement for THQBY's AutoHotkey v2 VS Code Support Addon

***

This is a full update for the definition file `ahk2.d.ahk` and the directive/flow control/variable file `ahk2.json` for [THQBY's AHKv2 support addon](https://github.com/thqby/vscode-autohotkey2-lsp).

### Contents
- [Why use this update](#why-use-this-update)
- [Installing](#installing)
- [Update Log](#update-log)
  - [2023-12-18](#2023-12-18)
  - [2023-12-24](#2023-12-24)
  - [2024-01-08](#2024-01-08)
  - [2024-01-09](#2024-01-09)
- [In-depth Showcase](#in-depth-showcase)
- [Different Widget Types](#different-widget-types)
- [Will THQBY Implement This?](#will-thqby-implement-this)

***

### Why use this update
This is a full rewrite from the ground up. 
It adds many things to the definition that it's currently missing.  
All parameters are included, all functions and methods have return values, the text of the calltips are now formatted and more aesthetically pleasing, hyperlinks are added, all options are accounted for, the structure of the defintion file has been expanded and updated, autocomplete features have been added for directives and flow control, and much more.

To put things in perspective, the current definition file is ~4,200 lines long and ~185,000 characters.  
The updated definition file is ~24,000 lines long and ~1,510,000 characters.  
The information difference is substantial and borderline palpable.  
In all fairness, a chunk of this character increase comes from the numerous hyperlinks, markdown formatting, and individual GUI controls added coupled with them now having individualized methods and properties.  

Please see the In-depth Showcase section to see a large listing of the numerous changes I've implemented to these files.  
There are pictures and videos for almost every topic covered.

***

### Installing
It's super easy.  
First, optionally backup the old files, just in case you want to revert.  
If you delete them and want them back, [get them from THQBY's GitHub](https://github.com/thqby/vscode-autohotkey2-lsp/tree/main/syntaxes).  

Next, download these two files and install them in the addon's `syntaxes` folder.  
The deafult location for this folder is:

    C:\Users\<YourUsername>\.vscode\extensions\thqby.vscode-autohotkey2-lsp-<SomeVersionNumber>\syntaxes

Alternatively, you can open the two files in the syntaxes folder and copy + paste the updated code directly over the old code.

***

### Update Log

I'll try to post all changes and updates I make:

##### 2023-12-18  
- All functions, classes, methods, and properties are done.  
- Added `ahk2.json` file. This includes many updates to directives and flow control statements.  
- More text will auto-complete and more menu selections have been added.  
- [Some examples can be seen here.](https://github.com/GroggyOtter/ahkv2_definition_rewrite/assets/29220773/8cafcd52-823c-4861-aa29-5f6a3452e8da)  

##### 2023-12-24
- Fixed a bunch of typos and errors.  
- Fixed functions/methods with variadic parameters.  
- Added string, integer, number, and float call tags.  
- Added comobjarray, comobject, and comvalue class calls.  
- Cleaned up a lot of tags to try and make them more compact.  
- Update ahk2.json with new version for #Requires.  

##### 2024-01-08
- Fixed a typo in the autocomplete for loop count that included an invalid comma
- Fixed FileSelect() title parameter as the addon was reading the default value as 2 things

##### 2024-01-09
- Rewrote the entire readme file for this GitHub page.  
- Added a plethora of pictures and vidoes.  

***

### In-depth Showcase

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

It seems unlikely.  
I showed the updated files to him and he immediately pass on them.  
I'm not sure he even tried them...  
I cannot convey how disappointed I am thinking about the hours I invested into this thinking it'd be picked up immediately.  
Especially considering the current incomplete and lacking state the definition file is in.  
I don't know. Maybe he'll get curious about it later, try it, and change his mind.  
Until then, I fully intend on maintaining these files and keeping them up to date.
