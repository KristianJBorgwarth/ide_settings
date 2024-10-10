function Initialize {
	#Install scoop
	if(-not (Get-Command scoop -ErrorAcrtion SilentlyContinue)){
		Write-Host "Installing Scoop..."
		Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
		Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
	}else{
		Write-Host "Scoop is already installed."
	}

	#Install Oh-My-Posh
	if(-not (Get-Command oh-my-posh -ErrorAction SilentlyContinue))
	{
		Write-Host "Installing oh-my-posh.."
		scoop install oh-my-posh
	}else{
		Write-Host "oh my posh is already installed."
	}

	#Install Zixode
	if(-not (Get-Command zoxide -ErrorAction SilentlyContinue))
	{
		Write-Host "Installing zoxide..."
		scoop install zixode
	}else{
		Write-Host "zixode is already installed"
	}

	#Install FZF
	if(-not (Get-Command fzfz -ErrorAction SilentlyContinue))
	{
		Write-Host "Installing fzf..."
		scoop install fzf 
	}else{
		Write-Host "fzf is already installed."
	}

	Write-Host "Initialization compelete. All necessary software is installed"
}

Initialize
