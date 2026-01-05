# CTF Write-Up: Exploitation with cURL - Hoperation Eggsploit

## Story/Scenario:
-> The wormhole is held open by a control panel on a web server. We must shut it down.
However the Terminal is bare (No burp,no browser, just a command prompt)
We have to use cURL to speak HTTP directly in terminal.

## Steps:

-> Used curl http://<target-machine-ip> to send get request to the home page
**Q1.**
> curl -i -X POST -d "username=admin&password=admin" http://<target-machine-ip>/post.php
```
|-> We are sending POST request to the destination with username and password "admin"
|-> -i option is used to view the headers, -d defines data to be sent, -X defines method. 	
```
	Flag: `THM{curl_post_success}`

**Q2.**
> curl -c cookie1.txt -i -X POST -d "username=admin&password=admin" http://<target-machine-ip>/cookie.php
|-> -c option captures any cookies received from the server and writes into the file 
> curl -b  cookie1.txt http://<target-machine-ip>/post.php
|-> -b option tells curl to send the saved cookies in the next request(like a browser)
	Flag: `THM{session_cookie_master}`

**Q3.**
-> Basically ran the bash script to obtain the password.
	Password: `secretpass`

**Q4.**
> curl -i -A "TBFC" http://<target-machine-ip>/agent.php
|-> -A option specifies the user-agent. 
	Flag: `THM{user_agent_filter_bypassed}`

**Q5.**
-> Look at the bonus_mission directory.
	Flag: ``

## Skills Learned:
- Deep understanding of HTTP request/response 
- Using cURL to:
	- Send basic GET requests
	- View raw http response in terminal
	- Send POST req to submit data 
	- Maintaining Login state using cookies and sessions
