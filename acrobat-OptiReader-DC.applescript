-- main
property functionChoice : {"Optimieren & Reader-Aktivierung"}
global thePreferenceReference

set thePreferencePath to "~/Library/Preferences/"
set thePreferenceFile to "com.sk.acrobat-OptiReader-DC"
set thePreferenceReference to thePreferencePath & thePreferenceFile

my whatFunction()

-- еееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееее

on whatFunction()
	
	my readPreferences()
	
	set functionChoice to choose from list {"Optimieren", "Optimieren & Reader-Aktivierung", "Nur Reader-Aktivierung"} default items functionChoice with prompt "Funktion wКhlen:" OK button name "Do it!"
	
	if the functionChoice = {"Optimieren"} then
		my writePreferences()
		my optimizePDF()
		tell application "Adobe Acrobat"
			close active doc
		end tell
	else if the functionChoice = {"Optimieren & Reader-Aktivierung"} then
		my writePreferences()
		my optimizePDF()
		my aktivatePDF()
		tell application "Adobe Acrobat"
			close active doc
		end tell
	else if the functionChoice = {"Nur Reader-Aktivierung"} then
		my writePreferences()
		my aktivatePDF()
		tell application "Adobe Acrobat"
			close active doc
		end tell
	end if
	
end whatFunction

-- еееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееее

on readPreferences()
	try
		--еееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееее
		set scriptStringToRead to "defaults read" & space & thePreferenceReference & space & "functionChoice"
		log scriptStringToRead
		set functionChoice to (do shell script scriptStringToRead) as list
		--еееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееее
	end try
end readPreferences

-- еееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееее

on writePreferences()
	try
		--еееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееее
		set scriptStringToWrite to "defaults write" & space & thePreferenceReference & space & "functionChoice" & space & quoted form of (functionChoice as string)
		log scriptStringToWrite
		do shell script scriptStringToWrite
		--еееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееее
	end try
end writePreferences

-- еееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееее

on optimizePDF() -- hier die optimierung!
	tell application "System Events"
		tell its process "AdobeAcrobat"
			--------------------------------------------------------------------------
			repeat until exists menu bar 1
				--
			end repeat
			click menu item "Optimiertes PDF..." of menu "Speichern als╩..." of menu item "Speichern als╩..." of menu "Datei" of menu bar item "Datei" of menu bar 1
			--------------------------------------------------------------------------
			repeat until exists window "PDF-Optimierung"
				--
			end repeat
			tell its window "PDF-Optimierung"
				if value of pop up button 1 is "sk-Optimiert" then
					click button "OK"
				else
					display dialog "Es muss das sk-Optimierungs-Preset gewКhlt sein!!!" buttons "OK" default button "OK"
				end if
			end tell
			--------------------------------------------------------------------------
			repeat until exists window "Optimierte speichern unter"
				--
			end repeat
			tell its window "Optimierte speichern unter"
				set fileNameVariable to text field 1's value
				set value of text field 1 to fileNameVariable --& "-optimized"
				tell its button "Speichern"
					click
				end tell
				try
					tell sheet 1
						click button "Ersetzen"
					end tell
				end try
			end tell
			--------------------------------------------------------------------------
		end tell
	end tell
end optimizePDF

-- еееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееее

on aktivatePDF() -- hier kommt die reader aktivierung!
	tell application "System Events"
		tell its process "AdobeAcrobat"
			--------------------------------------------------------------------------
			repeat until exists menu bar 1
				--
			end repeat
			click menu item "Weitere Werkzeuge aktivieren (mit AusfЯllen und Speichern von Formularen)..." of menu "PDF mit erweiterten Reader-Funktionen" of menu item "PDF mit erweiterten Reader-Funktionen" of menu "Speichern als╩..." of menu item "Speichern als╩..." of menu "Datei" of menu bar item "Datei" of menu bar 1
			--------------------------------------------------------------------------
			repeat until exists window "Verwendungsrechte in Adobe Acrobat Reader DC aktivieren"
				--
			end repeat
			click button "Jetzt speichern" of window "Verwendungsrechte in Adobe Acrobat Reader DC aktivieren"
			--------------------------------------------------------------------------
			repeat until exists window "Sichern"
				--
			end repeat
			tell window "Sichern"
				set fileNameVariable to text field 1's value
				set value of text field 1 to fileNameVariable --& "-readeractivated"
				tell its button "Sichern"
					click
				end tell
				try
					tell sheet 1
						click button "Ersetzen"
					end tell
				end try
			end tell
			--------------------------------------------------------------------------
		end tell
	end tell
end aktivatePDF

-- еееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееее
