# assign colors available
$available_colors = @('blue', 'green', 'red', 'yellow', 'orange', 'black')

# list 4 x above for random selection
$second_list = @($available_colors + $available_colors + $available_colors + $available_colors)

# assign random secret
$colors = @($second_list | Get-Random -Count 4)

# define indexes
$numbers = @(0, 1, 2, 3)

#  'all correct' result to match
$correct = @('red', 'red', 'red', 'red')

# starting gameplay iteration
$counter = 10

# Write initial text
Write-Output "Available colors are: blue, green, red, yellow, orange, black"

   #
DO # main loop
{

# Notify of progress and display prompt
$flag = 0;
Write-Output "You have $counter tries left, enter 4 comma separated colors"
$args = @(((Read-host -Prompt '> ').Split(",")).Trim())

# red/white pins to return
$true_list = @()

# validate number of args
if ($args.length -eq 4) {

    # make copy of the list of colors
    $copy = $colors.Clone()

    # loop through indexes to compare args to elements of copy
    ForEach ($i in $numbers) {

        # check for correct arg/color in correct index position
        # and assign red pin if true
        if ($args[$i] -notin $available_colors) {
            $flag += 1
        }
    }
    if ($flag -eq 1) {
        Write-Output "Invalid color detected, try again!"
        continue
    }
    $args_copy = $args.Clone()
    ForEach ($i in $numbers) {
        if ($args[$i] -eq $copy[$i]) {
            $true_list += 'red'
            $copy[$i] = "selected"
            $args_copy[$i] = "args_selected"
        }
    }
    $copy_2 = $copy.Clone()
    ForEach ($i in $numbers) {

        # check for correct arg/color in incorrect index position (ie. if in list)
        if ($args_copy[$i] -in $copy_2) {
            ForEach ($j in $numbers) {
                # remove index from possible red/white pins returned
                if ($copy_2[$j] -eq $args_copy[$i]) {
                    $copy_2[$j] = "copied"
                    break
                }
            }

            # and assign white pin if true
            $true_list += 'white'
        }
    }

    # if true list is correct (ie. if we have all red pins)
    $print = Compare-Object $true_list $correct
    $no_match = "No match, try again!"
    if ($null -eq $print) {
        Write-Output "You are the MASTERMIND!!!!"

        # exit all upon success
        exit
    } else {

        # sort return list with red pins at beginning
        $true_list = $true_list | Sort-Object
        ForEach ($i in $true_list) {

            # colorize each output pin
            if ($i -eq "red") {
                Write-Host $i " " -ForegroundColor Red -NoNewline
            } else {
                Write-Host $i " " -ForegroundColor White -NoNewline
            }
	    $no_match = ''
        }
        Write-Output $no_match
        $counter -= 1
    }
} else {
	Write-Output "Enter 4 comma separated colors!"
}

                           #
} While ($counter -gt 0)  # while we still have more tries left

# if we got this far we didn't win.
Write-Output "The correct answer is $colors"
