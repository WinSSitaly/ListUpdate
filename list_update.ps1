$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile("https://go.microsoft.com/fwlink/?LinkID=74689","c:\wsus_ivan\wsusscn2.cab")


$Wsusscn2FilePath = "c:\wsus_ivan\wsusscn2.cab"

$UpdateSession = New-Object -ComObject Microsoft.Update.Session  
$UpdateServiceManager  = New-Object -ComObject Microsoft.Update.ServiceManager  
$UpdateService = $UpdateServiceManager.AddScanPackageService("Offline Sync Service", $Wsusscn2FilePath, 1)  
$UpdateSearcher = $UpdateSession.CreateUpdateSearcher()   
  
Write-Output "Searching for updates... `r`n"  
  
$UpdateSearcher.ServerSelection = 3 
 
$UpdateSearcher.IncludePotentiallySupersededUpdates = $true 
  
$UpdateSearcher.ServiceID = $UpdateService.ServiceID.ToString()  
  
$SearchResult = $UpdateSearcher.Search("IsInstalled=0") 
  
$Updates = $SearchResult.Updates  
  
if($Updates.Count -eq 0){  
    Write-Output "There are no applicable updates."  
    return $null  
}  
  
Write-Output "List of applicable items on the machine when using wssuscan.cab: `r`n"  
  
$i = 0  
foreach($Update in $Updates){   
    Write-Output "$($i)> $($Update.Title)"  
    $i++  
}