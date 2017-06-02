cd c:\vagrant

$chocoCheck = Get-Command choco -ErrorAction SilentlyContinue
if (!$chocoCheck) {
	Write-Host "Attempting to install Chocolatey..."
	iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
	refreshenv
}
else {
    Write-Host "Chocolatey already installed"
}

$gitCheck = Get-Command git -ErrorAction SilentlyContinue
if (!$gitCheck) {
    Write-Host "Attempting to install Git..."
    choco install git -params "/GitAndUnixToolsOnPath" --yes --limitoutput --no-progress
    refreshenv
}
else {
    Write-Host "Git already installed"
}

Write-Host "Attempting to install ColdFusion 11..."
# Installs on port 8500, how to check when installation is done?
&.\ColdFusion_11_WWEJ_win64.exe -f silent.properties