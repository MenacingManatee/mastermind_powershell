$available_colors = @('blue', 'green', 'red', 'yellow', 'orange', 'white', 'black')
$colors = @('red', 'blue', 'green', 'yellow')
$numbers = @(0, 1, 2, 3)
$correct = @('red', 'red', 'red', 'red')
$counter = 10
DO
{
Write-Host "you have $counter tries left"
$args = @(((Read-host -Prompt 'Enter comma separated colors').Split(",")).Trim())
$true_list = @()
if ($args) {
    ForEach ($i in $numbers) {
        if ($args[$i] -eq $colors[$i]) {
            $true_list += 'red'
        } elseif ($args[$i] -in $colors) {
            $true_list += 'white'
        }
    }
    $print = Compare-Object $true_list $correct
    if ($null -eq $print) {
        Write-Host "Congratulations"
        exit
    } else {
        $true_list = $true_list | Sort-Object
        Write-Host $true_list
        $counter -= 1
    }
}
} While ( $counter -gt 0)
