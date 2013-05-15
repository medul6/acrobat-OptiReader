acrobat-OptiReader
=============

Description
-------
This is an AppleScript-Application to optimize and "Reader-Activate" opened pdf files in Acrobat.
There are different script versions for different Acrobat versions because this script
uses GUI-Scripting and every Acrobat version has a different menu layout ...
Use the one for your Acrobat version and don't use the others, they won't work anyway ...

But even if it uses GUI-Scripting it is pretty reliable and better then doing it by hand!

You can choose between the following functions:

* "Optimieren" -- optimize the pdf (reduces the filesize if possible)
* "Optimieren & Reader-Aktivierung" -- optimizes the pdf and activates the reader functionality (commenting, etc.)
* "Nur Reader-Aktivierung" -- just does the reader activating

The script is best saved as an Application!

After execution you can choose from one of the functions above.
After executing the chosen function the frontmost window closes.

The open files are overwritten – so you have to know what you are doing!



Disclaimer
-----
	Use my scripts at your own risk! I am not responsible for any damages to your pdf files!
	With my Repositories I just want to give the world back what I have got from others who share their code – 
    usable, productive AppleScripts!

Contributing
------------
Want to contribute? Great! You sure know what to do, I am new to Github so I don't know if I am doing this right :)

File-Formats
-----------
    Normally,I use the *.scpt format because it it precompiled but at the same time contains the code and is viewable via QuickLook. 
    I'm also commiting an *.applescript file, just because it it readable (If you just want to take a look) on github and the precompiled is not.
    In this repo I am also commiting a zipped(!) Application because it is easier this way to download and use ...
    The three types are commited together, always, if not then it wasn't necessary.
    
Localization
-----------
    At the moment the script is mixed, english and german. with the documentation beeing mostly in english but most strings are in german.
    As far as I researched it is not trivial to localize AppleScripts. We (the studio I work in) use these scripts as they are.

Installation
-----------
	Either save the script as an Application yourself or use the supplied [zipped] Applications.
    Put the Application where ever you want, put it in your Dock next to your Acrobat if you want to.

Usage
-----
    open some or just one pdf file and launch the app, choose a function and there you go!
