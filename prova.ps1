Set-ExecutionPolicy Unrestricted

if (Test-Path -path C:\wsus_ivan\wsusscn2.cab -PathType Leaf)
{
    Write-Host "file exist"
}
else
{
    
    Write-Host "Inizio scaricamento di wsusscn2.cab di quasi 1Gb"
#    $WebClient = New-Object System.Net.WebClient
#    $WebClient.DownloadFile("https://go.microsoft.com/fwlink/?LinkID=74689","c:\wsus_ivan\wsusscn1.cab")
    Write-Host "Ho terminato lo scaricamento di wsusscn2.cab"
    Write-Host "Procedo con il controllo degli aggiornamenti"

}
end if
Set-ExecutionPolicy Restricted