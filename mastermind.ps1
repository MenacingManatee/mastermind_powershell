$available_colors = @('blue', 'green', 'red', 'yellow', 'orange', 'black')
$second_list = @($available_colors + $available_colors + $available_colors + $available_colors)
$colors = @($second_list | Get-Random -Count 4)
$numbers = @(0, 1, 2, 3)
$correct = @('red', 'red', 'red', 'red')
$counter = 10
Write-Host "Available colors are: blue, green, red, yellow, orange, black"
Write-Host $colors
DO
{
$flag = 0;
Write-Host "You have $counter tries left, enter 4 comma separated colors"
$args = @(((Read-host -Prompt '> ').Split(",")).Trim())
$true_list = @()
if ($args) {
    $copy = $colors.Clone()
    ForEach ($i in $numbers) {
        if ($args[$i] -notin $available_colors) {
            $flag += 1
        }
    }
    if ($flag -eq 1) {
        Write-Host "Invalid color detected, try again"
        continue
    }
    ForEach ($i in $numbers) {
        if ($args[$i] -eq $copy[$i]) {
            $true_list += 'red'
            $copy[$i] = "selected"
        }
    }
    $copy_2 = $copy.Clone()
    ForEach ($i in $numbers) {
        if ($args[$i] -in $copy_2) {
            ForEach ($j in $numbers) {
                if ($copy_2[$j] -eq $args[$i]) {
                    $copy_2[$j] = "copied"
                    break
                }
            }
            $true_list += 'white'
        }
    }
    $print = Compare-Object $true_list $correct
    if ($null -eq $print) {
        Write-Host "You are the MASTERMIND!!!!"
        exit
    } else {
        $true_list = $true_list | Sort-Object
        ForEach ($i in $true_list) {
            if ($i -eq "red") {
                Write-Host $i " " -ForegroundColor Red -NoNewline
            } else {
                Write-Host $i " " -ForegroundColor White -NoNewline
            }
        }
        Write-Host ''
        $counter -= 1
    }
}
} While ( $counter -gt 0)
Write-Host "The correct answer is $colors"
