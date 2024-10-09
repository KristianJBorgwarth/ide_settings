function Update  {
	$sourceProfile = "$PSScriptRoot\profile.ps1"

	$destinationProfile = $PROFILE

	if(Test-Path $sourceProfile){
		Copy-Item -Path $sourceProfile -Destination $destinationProfile -Force
		Write-Host "Profile updated"
	}else{
		Write-Host "Source profile not found at $sourceProfile"
	}
}

Update

. $PROFILE
