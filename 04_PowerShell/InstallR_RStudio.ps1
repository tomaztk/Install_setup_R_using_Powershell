##################################
#
# Author: Tomaz Kastrun
# Description: Installing R / RStudio 
#              silently using PS
# Date: 01.FEB.2019
# Blog: tomaztsql.wordpress.com
#
##################################


## Set working directory

$dir = "C:\DataTK\99_REnv\01_Source\"
Set-Location $dir

## Download RSTudio for Windows machine

# Version of RStudio is deliberatly set to specific version
# so that code is repeatable and always returns same results
$urlRStudio = "https://download1.rstudio.org/RStudio-1.1.463.exe"
$outputRStudio = "$dir\RStudio.exe"

$wcRStudio = New-Object System.Net.WebClient
$wcRStudio.DownloadFile($urlRStudio, $outputRStudio)   # $PSScriptRoot 
Write-Output "Download Completed"


## Download RSTudio for Windows machine

$urlR = "https://cran.r-project.org/bin/windows/base/R-3.5.2-win.exe"
$outputR = "$dir\R-win.exe"
$wcR = New-Object System.Net.WebClient
$wcR.DownloadFile($urlR, $outputR)
Write-Output "Download completed"


## Installing R / RStudio on desired Path
## Silent install
$dirRStudio = $dir + "RStudio.exe"
$dirR = $dir + "R-win.exe"

# "/c dir `"%systemdrive%\program files`""
Start-Process -FilePath $dirRStudio -ArgumentList "/S /v/qn"
Start-Process -FilePath $dirR       -ArgumentList "/S /v/qn"



##
## Downloading R Packages just an example
##

$ListRPackages= Invoke-WebRequest -Uri "https://cran.r-project.org/bin/windows/contrib/3.5"
$ListRPackages.ParsedHtml
$pack = ($ListRPackages.ParsedHtml.getElementsByTagName(‘a’)).outerText



##
## Read the list of packages also from the list
##

$ListPackageLocation = "C:\DataTK\99_REnv\01_SourceList\packages.txt"
$PackList = Get-Content -Path $ListPackageLocation
$dir = "C:\DataTK\99_REnv\01_Source\"


ForEach ($Name in $PackList)
{

    $UrlRoot = "https://cran.r-project.org/bin/windows/contrib/3.5/"
    $url = $UrlRoot + $Name
    $FileName = $dir +'\' + $Name
    $PackagesOut = New-Object System.Net.WebClient
    $PackagesOut.DownloadFile($url, $FileName)   
    Write-Output "Download Completed" 

}
