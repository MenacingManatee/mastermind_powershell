$master = @('blue', 'pink', 'red', 'yellow')
$guess = Read-Host "Please enter your guess"
$guess = $guess.split()
Write-Output $guess "this is guess`n"
Write-Output $master "this is master`n"
Compare-Object -ReferenceObject $master -DifferenceObject $guess -IncludeEqual | ? {$_.SideINdicator -eq "==" -Or $_.SideINdicator -eq "<="}
If ($_.SideINdictator -eq "==") {
   Write-Host "you found matches"
}
Else
{
	Write-Host "guess again"
}
$guess = Read-Host "enter guess"
$guess = $guess.split()
