[int]$startMs = (Get-Date).Millisecond
$n=netsh trace start capture=yes
$n  
$s=netsh trace stop
for($num=1; $num -le 10; $num++)
    {
        
        Write-Host "Capturing.....Pls Wait $num Second(s)"
        Start-Sleep -s 10
    }
[int]$endMs = (Get-Date).Millisecond
Write-Host $($startMs - $endMs)
New-Item -Name "Unzipped" -ItemType "directory"
expand.exe .\NetTrace.cab -f:* '.\Unzipped'
Set-Location -Path 'C:\Users\Prash\AppData\Local\Temp\NetTraces\Unzipped\'
Start-Sleep -s 5
Get-Content ".\adapterinfo.txt"
Start-Sleep -s 5
Get-Content ".\powershellinfo.log"
#Get-Content ".\envinfo.txt"
#Get-Content ".\neighbours.txt"
#Get-Content ".\osinfo.txt"
#Get-Content ".\wcninfo.txt"
#Get-Content ".\wlaninfo.txt"
while($true) {
    " `n "
    $StartTime = Get-Date
    Write-Host $StartTime
    Start-Sleep -s 5
    Get-Content ".\adapterinfo.txt"
    Start-Sleep -s 5
    Get-Content ".\powershellinfo.log"
    #Get-Content ".\envinfo.txt"
    #Get-Content ".\neighbours.txt"
    #Get-Content ".\osinfo.txt"
    #Get-Content ".\wcninfo.txt"
    #Get-Content ".\wlaninfo.txt"
    do { Start-Sleep -Seconds 5 } until ((get-date) -ge ($StartTime.AddSeconds(10)))
}
$s