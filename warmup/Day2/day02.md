# CTF Write-Up: Phishing - Merry Clickmas

## Story:
-> Tbfc red team is conducting pentest against the employees to aware them about phising attacks.

## Social Engineering Toolkit (SET)
	Social Engineering Attack -> Mass Mailer Attack -> E-mail attack single email address

## Steps:
1. hosted a server on our local computer on port 8000 so that if the target enters the credentials then it will be displayed 
2. used setoolkit to form and send phising e-mail to the client mail server on default port 25
3. got credentials and checked whether the password was reused on the email portal
**Password**: `unranked-wisdom-anthem`

## Skills Learned:
- Understanding social engineering
- Explore how red teams create fake login pages
- Use the Social-Engineer Toolkit to send a phishing email
