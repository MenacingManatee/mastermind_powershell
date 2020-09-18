# Mastermind

## About / synopsis
The game [mastermind](https://en.wikipedia.org/wiki/Mastermind_\(board_game\)) written as a PowerShell script

## Built With

* [PowerShell]

## Built By

* [Anthony Sims]
* [Brett Davis]
* [Corbin Enterline]
* [Gunter Pearson]
* [Staci Aaenson-Fletcher]

### Project contents

| Project Title | Short Description |
| --- | --- |
|mastermind.ps1|Main PowerShell script running the game|

### How to Play:
Run the mastermind script on a terminal with PowerShell. The master key is set by a randomizer, with duplicates possible. To guess, enter 4 colors, separated by a comma. The game will return you a list of up to 4 items, consisting of the colors red and white. A red indicates one of the colors is the correct color, and is in the correct position. A white indicates one of the colors is correct, but is in the incorrect position. Which color matches is not indicated by the program. The object of the game is to guess the correct 4-key passkey in 10 guesses or fewer, using the hints given after each attempt to narrow down the options.

### Examples