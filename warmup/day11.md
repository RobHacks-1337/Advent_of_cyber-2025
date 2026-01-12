# CTF Write-Up: XSS - Merry XSSMas

## Story/Scenario:
-> McSkidy has a secure message portal where you can contact her directly with any questions.  
However, the logs have been lighting up with unusual activity, like odd messages, suspicious search terms. Even Santa's letter seems to be scripts or code.  
Our mission is to dig through the logs, uncover the mischief 

## Important Notes:
-> XSS(Cross-Site Scripting) is a web app vulnerability which allows attackers to inject malicious codes (usually js) into the input field.  
-> It happens when the programmer does not sanitize/validate the user input before processing it.  
-> There are various XSS attacks but we learn only Reflected XSS and Stored XSS now.

**Reflected XSS**:  
-> Payload is injected directly into the url and the response is immediately projected.   
-> Payload only afffects the client-side.
Eg: `https://trygiftme.thm/search?term=<script>alert( atob("VEhNe0V2aWxfQnVubnl9") )</script>`
-> It's usually exploited via phishing to trick users into clicking a link with malicious code injected.

**Stored XSS**:  
-> Payload is injected into an unsanitized input field.  
-> Here, the payload is saved in the server. So, the script will run on anyone who accesses the affected page.  
 
***Mitigate against XSS***
- Disable dangerous rendering raths: Instead of using `innerHTML` property, use `textContent ` property.
> `innerHTML` property lets attacker inject any content directly into HTML
> `textContent ` property treats input as text and parses it for HTML

- Make cookies inaccessible to JS
- Sanitise input/output and encode

## Steps:
-> View the website at http://MACHINE_IP

**Q1.**  
**Answer**: `stored`

**Q2.**  
-> Perform reflected XSS attack to 
```reflected XSS
	http://MACHINE_IP/search?term=<script>alert('Reflected Attack')</script>  
```
or,  
-> Add the above payload to Search Messages to find the flag.

Alternative,  
-> Read the reflected XSS theory carefully and you will find: `atob("VEhNe0V2aWxfQnVubnl9")`  
-> Then simply use tool like CyberChef to decode the string from base64 to get the flag.  
> atob() method in javascript is used to decode from base64 to plain message.

**Flag**: `THM{Evil_Bunny}`

**Q3.**  
-> Perform Stored XSS attack by entering the payload in the input field send message:
```Stored XSS
	<script>alert('Stored XSS attack')</script>
```
-> Then enter send message to get the flag.

Alternative,  
-> Read the Stored XSS theory carefully and you will find: `atob("VEhNe0V2aWxfU3RvcmVkX0VnZ30=")`  
-> Then simply use tool like CyberChef to decode the string from base64 to get the flag.  
> atob() method in javascript is used to decode from base64.

**Flag**: `THM{Evil_Stored_Egg}`

## Skills Learned:
- Understand how XSS works
- Learn to prevent XSS attacks
