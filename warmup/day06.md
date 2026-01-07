# CTF Write-Up: Malware Analysis - Egg-xecutable

## Story:
-> A SUS email is recieved from "ELf McClause" with an executable file "HopHelper.exe" attached.

## Points to remember:
-> To gain persistence, most common technique a malware uses is to add a "Run" key into the registry. 

## Steps:
- Used PeStudio to check SHA256 Checksum(can use virustotal to analyze) and Strings in malware file.
- Used RegShot to create two "shots"(snapshot) of the registry - one before and one after malware is executed.
- Used ProcMon(Process Monitor) to view the processes the malware is performing on the system. Also used filters to filter out unnecessary processes.

## Skills Learned:
- Malware Analysis:
	- Static: Analyzing/Inspecting malware without running  
	- Dynamic: Analyzing malware by executing it
- Sandbox Environments
