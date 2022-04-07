Network Configuration monitoring using PowerShell script

Summary:

It provides the information logs about System configuration, Network Configuration, Firewalls, Services running, policies and more hidden data regarding the network and the machine.


[int]$startMs = (Get-Date).Millisecond 


#draws the date, time in milliseconds and stores it in “startMs”


$n=netsh trace start capture=yes 


#store the required command in “$n”, so that we could use it in our future script


for($num=1; $num -le 10; $num++) 


#it loops the script written inside for 10 times


Start-Sleep -s 10


#It takes 10 seconds to stay idle and joins the loop


[int]$endMs = (Get-Date).Millisecond
Write-Host $($startMs - $endMs)


# it draws the current time and gives you the total time taken to execute the loop


New-Item -Name "Unzipped" -ItemType "directory"


# creates a directory named Unzipped


expand.exe .\NetTrace.cab -f:* '.\Unzipped'


# unzips the NetTrace.cab file


Set the path where the files needs to be extracted


Get-Content ".\adapterinfo.txt"


# It draws the data present in adapterinfo.txt


There are other information that could be drawn and displayed but it would confuse the user with its huge data. Hence I have uncommented some infrequent data requirement by the users.


If the user requires any other data
1. Check what data the use require in the commented list
2. uncomment the required line