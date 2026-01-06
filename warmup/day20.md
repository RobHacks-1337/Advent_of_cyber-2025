# CTF Write-Up: Race Conditions - Toy to The World 

## Story/Scenario:
```
-> TBFC launched its limited-edition SleighToy, with only ten pieces available. Within seconds, thousands rushed to buy one, but more than ten lucky customers received confirmation emails stating that their orders were successful.
	Problem: Multiple buyer purchased at the exact moment, slipping through systems timing flaw.
->The bandit bunnies exploited this flaw, flooding the checkout.
```

## Important Notes:
**Race Condition**: It happens when two or more actions occuring at same time.  
In context of web application, it happens when multiple users or automated req tries to access or modify shared resource simultaneously.  

**Types**:
- Time-of-Check to Time-of-Use (TOCTOU): happens when a program checks a resource/data first and uses it later. Hence what was true at check might not be the same at use. [Eg: checking an item is in stock first and before the time i click buy, someone else already bought it]
- Shared Resource: Multiple user or system tries to change same data simultaneously without proper control which leads output to be dependent upon one which finishes last. [Think of one user overwriting other users data]
- Atomicity violation: when parts of a process run separately, another request can sneak in between and cause inconsistent results. [Eg: paying for an item but just before system confirms, the price gets changed by someone]

## Steps:
```
Q1.
  1. Setting up BurpSuite:
	- Enable foxyproxy in browser and open burpsuite
	- Go to "Proxy" tab and disable intercept (to allow web req to flow normally)

  2. Visiting the webapp:
	- Visit the target webapp and login with credentials given
	- Make a legitimate purchase to a toy and place order.

  3. Exploiting race condition
	- Open Burpsuite proxy tab > HTTP history and search POST req of the checkout (order that we placed earlier)
	- Send the req to repeater (This copies he exact HTTP request (headers, cookies, body) into Burp’s Repeater tool). 
	- In "repeater" tab right-click the first tab and create a new group.
	- Then again right click the same tab and click "duplicate tab" > Select appropriate value as per stock.
	- Drop down send button > Send group in parallel (last-byte sync) [This will send all the checkout req at the exact moment]
  	  [We are *Here]
  4. Obtain the flag:
	- Click send and refresh the website to obtain the flag:
```
	**Flag**: `THM{WINNER_OF_R@CE007}`
Q2.
-> Same steps as above
	**Flag**: THM{WINNER_OF_Bunny_R@ce}

## Skills Learned:
- Understanding race conditions and its affect in web app
- Identify and exploit race conditions in web req
- Race Condition mitigation techniques 
