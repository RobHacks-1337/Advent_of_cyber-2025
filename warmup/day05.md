## Story:
-> Users cant activate vouchers on TryPresentMe website.
We have to investigate the website to look for potential vulnerabilities

## Important Notes:
-> IDOR is an access control vuln used for horizontal privilege escalation.
-> If a server fails to check the users authorization before sending the response, it leads to idor vuln

## Steps:
*Direct Object References:
    -> Logged in using a valid user, refereshed page and looked at network tab to see the requests being made.
    -> Found view_accountinfo req with naked user_id, opened Application->Local storage and tweaked the values of user_id.  
*In Disguise: Obvious References(Encoded):
    -> 
*In Digests, Objects Remain(Encrypted/Hashed):
    -> 

## Skills Learned:
- spotting potential IDOR(authorization bypass) opportunity
- Horizontal privilege escalation
- Burp Intruder
*Some websites used:
	- Hash Identifier
	- UUID Decoder
