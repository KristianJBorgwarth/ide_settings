function Update {
	UpdateThemes
	UpdateProfile
}

function UpdateProfile {
	$sourceProfile = "$PSScriptRoot\profile.ps1"

	$destinationProfile = $PROFILE

	if (Test-Path $sourceProfile) {
		Copy-Item -Path $sourceProfile -Destination $destinationProfile -Force
		Write-Host "Profile updated"
	}
	else {
		Write-Host "Source profile not found at $sourceProfile"
	}
}

function UpdateThemes {
	$themes = "$PSScriptRoot\custom_themes"

	foreach ($theme in (Get-ChildItem $themes -Filter *.json)) {
		$sourceTheme = "$themes\$($theme.Name)"
		$destinationTheme = "$env:POSH_THEMES_PATH\$($theme.Name)"

		try {
			if (Test-Path $destinationTheme) {
				Remove-Item -Path $destinationTheme -Force
			}

			Copy-Item -Path $sourceTheme -Destination $destinationTheme -Force
			Write-Host "Theme $($theme.Name) updated"
		}
		catch {
			Write-Host "Failed to update theme $($theme.Name): $_" -ForegroundColor Red
		}
	}
}

Update

. $PROFILE
