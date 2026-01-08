# CTF Write-Up: Obfuscation - The Egg Shell File 

## Story/Scenario:
-> McSkidy finds an alert that caught her interest:  an email posing as northpole-hr. It is littered with carrot emojis  
Digging further she found a tiny PowerShell file from that email was downloaded. Among the code are random strings of characters, all gibberish, nothing readable at a glance.  
McSkidy knows malicious actors often hide code and data using a technique called obfuscation

## Important Notes:
- Obfuscation: practise of making data hard to read/analyze.   
>	(Basically converts plain data into random gibberish)
- Layered Obfuscation: multiple ofuscation techniques are used 
- Detecting some simple obfuscation techniques:
	- ROT1: one letter off, spaces stay the same
	- ROT13: check for common three letter words such as gur(the), naq(and)
	- Base64: long strings containing alpha-num characters, often ends with = or ==
	- XOR: If a short secret was reused, you may notice a tiny repeat every few characters.
- Cyberchef includes an recipe called `Magic`, which automatically guesses and tries normal decoders.
> Use this operation when we do not know what technique is being used

## Steps:
Q1.
-> Open the .ps1 file in notepad or vscode.  
-> copy the base64 hash > go to cyberchef and use "From Base64" recipe to obtain:  
**Deofuscated Value**: `https://c2.northpole.thm/exfil`
-> Paste the value in the required section of the code and run the script to obtain the flag.  
**Flag**: `THM{C2_De0bfuscation_29838}`

Q2.
-> Copy the API key and paste into cyberchef  
-> Select XOR recipe with key (0x37) > Select "To Hexadecimal" recipe with delimeter (none)  
-> Obtain the hexcode and paste into the desired section and run the script

**Flag**:`THM{API_Obfusc4tion_ftw_0283}`

## Skills Learned:
- Obfuscation, why & where is it used
- Diff betn encoding, encryption, and obfuscation
- Obfuscation and common techniques
- Use of cyberchef to obtain plaintext safely
