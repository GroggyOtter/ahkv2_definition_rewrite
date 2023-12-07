# ahkv2_definition_rewrite

This is a WIP.

Full update of the definition file for THQBY's AHKv2 support addon.

Customized description for every item.  
I've gone through, from scratch, and transcribed everything from the docs into customized tooltips.  

I also took the liberty of rewording stuff, adding explanations, renaming some parameters, and other various tweaks in an attemp to make the tooltips more rich in information.

About 1/2 of the items in here have custom code examples written.  
This code shows up highlighted like normal code and can be copy/pasted directly into the browser.  
I tried to target a lot of the exmaples at commonly written uses for the code or code snippets that teach by design.  

Plenty of hyperlinks...sooooo many hyperlinks.  
Every tooltip card should now start with a hyperlink to take the user to that items online document page.
And all [Related](https://i.imgur.com/jTspzk9.png) hyperlinks are included on the cards now.

Blanket methods/properties removed.  
Individual cards are written for each method and property.  
Only information pertinent to that function/method/property is included
EX: A gui button `OnEvent()` would not list "Change" as an option b/c buttons do not have a Change event.  

Function/method throw errors are now included.  
This can help with writting error control features in your code.

All functions, methods, properties, and variables show their "type" so you know what you're getting.  
An HWND property shows as an integer because it is.  
Gui.AddButton() returns a `Gui.Button`.  
Etc...

ALL methods and functions should now have some sort of return
Functions/methods that return an empty string ` ` by default are marked as such with `EmptyString`.  

I've tried to include every option of all methods and functions.  
This can cause certain cards (like Format(), OnEvent(), Gui.Control.Opt(), etc) to be rather long.  
It's a constant struggle to determine what information stays and what information goes.  
This is also a source of my constant rewording.

***

Extra info: 

At the time of this readme creation, the current doc definition file is ~4200 lines.  
My customized definition file is currently at 13000 lines.  
I have a good chunk of the classes, methods, and properties done.  
I have functions A-N completed.  
And I still have directives, flow control, and built-in vars to do.

Updated: 20231207

***

Screenshots of changes:

Current `Format()` intellisense (top section):  

![](https://i.imgur.com/1MCWJRk.png)  

My updated `Format()` tooltip (top section):  

![](https://i.imgur.com/7JXsphO.png)  

Current `btn_con.OnEvent()` (Full thing):

![](https://i.imgur.com/GFkv1bc.png)  

My updated `btn_con.OnEvent()` (Most of it):  

![](https://i.imgur.com/VL69DsQ.png)  

Current `Hotkey()`:
![](https://i.imgur.com/9IFplwe.png)

My updated `Hotkey()`:
![](https://i.imgur.com/Yo2OvpI.png)

Current `Msgbox()`:
![](https://i.imgur.com/LoCx8k6.png)

My updated `Msgbox()`:
![](https://i.imgur.com/NkuYYKZ.png)
