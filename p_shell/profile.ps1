oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\zash.custom.omp.json" | Invoke-Expression

Invoke-Expression (& { (zoxide init powershell | Out-String) })

$env:PATH += ";$env:USERPROFILE\scoop\shims"

Set-PSReadLineKeyHandler -Key Tab -Function AcceptSuggestion

function Touch {
		    New-Item -Path $args[0] -ItemType "File" -Force
 }
