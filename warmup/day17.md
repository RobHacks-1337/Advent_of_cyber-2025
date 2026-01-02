# CTF Write-Up: CyberChef - Hoperation Save McSkidy

## Story:
-> McSkidy is imprisoned!!! Sir BreachBlocker III implemented several access controls to prevent any escape.
However McSkidy managed to send vital clues using harmless bunny pics.
There are 5locks we need to disable to secure the escape route.

## Steps:
```
-> Scan the target which revealed a http-proxy at port 8080.
-> Then visited the site, inspected the site.
-> Looked at Sources tab -> static -> app.js to find the  Password login logic for each level. 
1. First Lock:
	-> Went to network tab, looked at level1 page response header to find the question.
	-> Converted the question into base64 and fed it to the guard to obtain a key in base64 format.
	-> Password Logic: Converted the key from base64 to obtain pwd
	Password: Iamsofluffy 

2. Second Lock: Outer Wall
	-> Same steps as before.
	-> Password Logic: Converted the key from base64 twice to obtain pwd.
	Password: Itoldyoutochangeit!

3. Third Lock: Guard House
	-> Requested password from the guard in base64, decoded to get passkey
	-> Found XOR recipekey from response header
	-> Password Logic: Coverted passkey from base64 and used XOR operation with recipekey on output to obtain pwd 
	Password: BugsBunny

4. Fourth Lock - Inner Castle
	-> Requested password from the guard in base64, decoded to obtain md5 hash
	-> Used crackstation to crack the hash and obtain pwd 
	-> Password Logic: Md5 Hashing algorithm used.
	Password: passw0rd1

5. Fifth Lock - Prison Tower
	-> Same steps as before
	-> Looked at the response header for Recipe Id and recipe key
	-> Used the correct logic to obtain the pwd
	-> Password Logic: ROT13 ⇒ From Base64 ⇒ ROT47 [RecipeId:R4] 
		(*Note: This logic may differ among individuals look at the correct recipe id from response header)
	Password: 51rBr34chBl0ck3r
	Flag: THM{M3D13V4L_D3C0D3R_4D3P7}
```

## Skills Learned:
- Encoding / Decoding
- Using CyberChef
- Inspecting Http-headers(request-response) to obtain useful information.
