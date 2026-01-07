# CTF Write-Up: Linux CLI - Shells Bells

## Story:
-> Mcskidy has been kidnapped!!!  
We are looking for clues in the Linux server processing Cristmas whishlist

## Clues for vault passcode:
```
Access the user account:
	username: eddi_knapp
	password: S0mething1Sc0ming

1)
I ride with your session, not with your chest of files.
Open the little bag your shell carries when you arrive.

2)
The tree shows today; the rings remember yesterday.
Read the ledger’s older pages.

3)
When pixels sleep, their tails sometimes whisper plain words.
Listen to the tail.
	-	c0M1nG
```

## Walkthrough for side quest:

1) 
pass1	- 

2) 
pass2	-

3) basically catted the .secretimage which revealed the passphrase 
pass3	-       c0M1nG

## Skills Learned: 
- Basic navigation around the linux file system architecture
- Elevating to the super user - sudo su
