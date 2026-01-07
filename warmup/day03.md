# CTF Write-Up: Splunk Basics - Did you SIEM? 

## Story/Scenario:
-> The SOC dashboard flashes red. A ransom message suddenly appears. The message is from King Malhare.  
We act as SOC team and utilize splunk(SIEM tool) to determine how the ransomware infiltrated the system.

## Steps:
-> Go to Search and Reporting > change timeframe to all time.

**Q1.**  
SPL Query:  
```splunk
	index=main sourcetype="web_traffic"
```
> Filters only logs of web_traffic dataset.
-> Then go to interesting_field > client_ip and view the top suspicious ip with most req

**Q2.**  
-> Just view the timeline to get the answer. Or use:  
SPL Query:  
```splunk
	index=main sourcetype=web_traffic | timechart span=1d count | sort by count | reverse
```
> Timechart -> stastical command used to display events into fixed time intervals  
> span=1d -> groups events of 1day and displays   
> sort by -> sorts the output by count in asc order  
> reverse -> sakasama(inverts) the output

SPL Query:  
```splunk
or,	index=main sourcetype="web_traffic" | timechart span=1d count | sort -count
```
> sort -count -> Basically sorts output by count in desc

**Q3.**  
-> Same query as Q1  
-> Go to Interesting Fields > click user_agent and use your eyes.

**Q4.**  
SPL Query:  
```splunk
	sourcetype=web_traffic client_ip="198.51.100.55" AND path="*..\/*"	
```
> client_ip -> filters out the events/logs of specific ip only  
path="*..\/*" checks for path traversal vulnerabilites
 
-> Then, just check total no of events

SPL Query:  
```splunk
	sourcetype=web_traffic client_ip="198.51.100.55" AND path="*..\/..\/*" OR path="*redirect*" | stats count by path
```
> path=*redirect* checks for open redirect vulnerabilites
> stat -> just to aggregate results

**Q5.**  
-> Attacker built a outbiund C2 communication to exfiltrate data

SPL Query:  
```splunk
	index=main sourcetype="firewall_logs" src_ip="10.10.1.5" AND dest_ip="198.51.100.55" AND action="ALLOWED" | stats sum(bytes_transferred) by src_ip
```
> src_ip -> ip of the server being compromised  
> dest_ip -> ip of attacker  
> action=ALLOWED -> Filters the events allowed by firewall  
> stats sum(bytes_transferred) by src_ip -> to view total volume of data exfiltrated

## Skills Learned:
- SIEM tool (Splunk):
	- Ingesting and interpreting custom log data
	- Using SPL(Search Processing Language) to filter
	- Create and apply custom field extractions
