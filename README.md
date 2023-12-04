# ahkv2_definition_rewrite

This is a WIP.

Full update of the definition file for THQBY's AHKv2 support addon.

Customized description for every item.  

Plenty of hyperlinks
Each tooltip starts with a hyperlink to its online doc. 

Blanket methods/properties removed.  
Individual cards are written for each method and property.  
Only information pertinent to that function/method/property is included
EX: A gui button `OnEvent()` would not list "Change" as an option b/c buttons do not have a Change event.  

Custom written examples

"Related" hyperlinks included with each card.

Function errors are now included.

All functions, methods, properties, and variables show their "type" so you know what you're getting.  
An HWND property shows as an integer because it is.  
Gui.AddButton() returns a `Gui.Button`.  
Etc...

Functions/methods that return an empty string ` ` by default are marked, too.  
There should be no missing return values.  

I've tried to include every option of all methods and functions (so far).

At the time of this readme creation, the current doc definition file is ~4200 lines.  
My customized definition file is currently over 11000 lines.  
I have a good chunk of the classes, methods, and properties done.  
I have functions A-G completed.  
And I still have directives, flow control, and built-in vars to do.

