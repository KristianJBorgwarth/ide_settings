function Update{
	UpdateKeybindings	
}

function UpdateKeybindings {
	$sourceProfile = "$PSScriptRoot\keybindings.json"
	
	$destinationProfile = "C:\Users\kjfic\AppData\Roaming\Code\User\keybindings.json"
	
	if(Test-Path $sourceProfile){
		Copy-Item -Path $sourceProfile -Destination $destinationProfile -Force
		Write-Host "Keybindings updated"
	}else {
		Write-Host "Source profile not found at $sourceProfile, while attempting to update keybindings for VS Code"
	}
}


Update
