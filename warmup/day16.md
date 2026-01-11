# CTF Write-Up: Forensics - Registry Furensics 

## Story/Scenario:
-> TBFC is under attack. Systems are exhibiting weird behavior.  
We have to conduct a detailed forensic analysis on critical systems of TBFC, `dispatch-srv01`.  
`dispatch-srv01` coordinates the drone-based gifts delivery which was recently compromised.  
Our job is to investigate the registry of this compromised system.

## Important Notes:
-> Registry is the brain of windows OS which stores all the configuration files for functioning  
**Reg Hives**  
-> Registry files are not stored in a single place, It is made up of multiple seperate files known as the `Registry Hives`  
Some imp Hives:
| Hives | Absolute Path |
|------|-----------|
| SYSTEM  | `C:\Windows\System32\config\SYSTEM` |
| SECURITY | `C:\Windows\System32\config\SECURITY` |
| SOFTWARE | `C:\Windows\System32\config\SOFTWARE`|
| SAM | `C:\Windows\System32\config\SAM` |
| NTUSER.DAT | `C:\Users\username\NTUSER.DAT` |

-> However, these reg hives contain binary data which cannot be viewed dierctly. Hence we have to use **Registry Editor**

**Root Keys**  
-> Windows organizes all the Registry Hives into these structured **Root Keys** like `HKEY_LOCAL_MACHINE`, `HKEY_CURRENT_USER` etc.  

| Hive on Disk   | Registry Editor(Root key location) |
|:---------------:|:------------------------------------:|
| SYSTEM        | HKEY_LOCAL_MACHINE\SYSTEM            |
| SECURITY      | HKEY_LOCAL_MACHINE\SECURITY          |
| SOFTWARE      | HKEY_LOCAL_MACHINE\SOFTWARE          |
| SAM           | HKEY_LOCAL_MACHINE\SAM               |
| NTUSER.DAT    | HKEY_USERS\<SID> and HKEY_CURRENT_USER |
| USRCLASS.DAT  | HKEY_USERS\<SID>\Software\Classes    |

View connected USB devices: `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USBSTOR`  
View Programs ran using win+R: `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU`  
View recently accessed apps launched using GUI: `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist`  
View all locations typed inside address bar: `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths`  
*View info on startup programs: `HKLM\Software\Microsoft\Windows\CurrentVersion\Run`  
*View recently accessed files: `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs`  
View hostname: `HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName`  
*View info abt installed programs: `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall`

## Steps:
-> Launch Registry Explorer and load the hives clicking shift(for clean hive state).

**Q1.**  
-> Go to available bookmarks and type uninstall  
-> Order it by timestamp and look at the date 21st oct 2025.

**Answer**:
```
DroneManager Updater
```

**Q2.**  
-> Navigate to the below path in NTUSER.DAT hive
> Microsoft/Windows NT/CurrentVersion/APpCopFlag/Compatibility Assistant/Store
-> Use your eyes to find the path

**Answer**:
```
C:\Users\dispatch.admin\Downloads\DroneManager_Setup.exe
```

**Q3.**  
-> Search for Run in available bookmarks

**Answer**:
```
"C:\Program Files\DroneManager\dronehelper.exe" --background
```

## Skills Learned:
- Understand about Windows Registry in detail.
- Dive deep into Registry Hives and Root Keys.
- Analyze Registry Hives through the built-in Registry Editor tool.
- Learn Registry Forensics and investigate through the Registry Explorer tool.
