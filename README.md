# Lottery Ticket Generator 🎟️

Welcome to the **Lottery Ticket Generator**! This script generates unique lottery ticket numbers based on the most frequent and consistent numbers from the last five years (2019-2024)📅.

## Overview 🌟

This script generates lottery ticket sequences based on the numbers that have appeared most frequently and consistently in the lottery over the past five years. By analyzing the draw history, we've identified the ranges and specific numbers that have the highest probability of appearing in the draws.

## How It Works 🛠️

The script divides the number pool into six columns, each representing a position on the lottery ticket. Each column contains a list of numbers or ranges from which a random number is selected. Here's a brief overview:

- **Column 1**: "01", "03:04", "07:08"
- **Column 2**: "07", "13", "15"
- **Column 3**: "21", "27:28", "33"
- **Column 4**: "37", "39"
- **Column 5**: "44", "50", "52"
- **Column 6**: "57:59"

The script ensures that the generated sequences are unique and calculates the total number of possible unique sequences. It can also export the generated tickets to a CSV file.

## Usage 🚀

### Prerequisites

- PowerShell

### Running the Script

1. **Clone or download the script** to your local machine.
2. **Open PowerShell** and navigate to the directory containing the script.
3. **Run the script** using the command:
   ```powershell
   .\LotteryTicketGenerator.ps1
   ```

### Parameters

- **-ticket**: Number of unique tickets to generate (default is 1).
- **-all**: Generate all possible unique sequences.
- **-now**: Generate the tickets and export them immediately to a CSV file.

### Examples

- **Generate a single ticket**:
  ```powershell
  Get-Tickets -ticket 1
  ```
- **Generate all possible tickets**:
  ```powershell
  Get-Tickets -all
  ```
- **Generate and export tickets**:
  ```powershell
  Get-Tickets -ticket 5 -now
  ```

## Output 📄

The script will display the generated ticket numbers, total possible sequences, the number of unique tickets generated, the cost per ticket, the total cost to play all possible combinations, and your percentage chance of winning the lottery.

### Sample Output

```plaintext
----- Tickets -----
1st number: 01, 2nd number: 07, 3rd number: 21, 4th number: 37, 5th number: 44, 6th number: 57
---
Total possible sequences based on values provided is: 162
Number of unique tickets generating: 1
---
Cost per ticket: £2
Total cost to play all possible combinations generated is: £324
---
Your percentage of winning the lottery is: 0.617%
---
```

## Banner 🐰
```plaintext
                   *            ,            *     2024
    *            .             /|      __.
                              / |   ,~` /
                             Y :|  //  /       .         *
  LOTTERY TICKET             | jj /( .^
                 .           >-"~"-v"
  .     '     ,             /       Y    .        *        .
 _ /_|_____|_\ _           /$  $    |
   '. \   / .'            ( ~T~     j
     '.\ /.'               >._-' _./             .
       '.'        .     /| ;-"~ _  l
                       / l/ ,-"~    \     +
    GENERATOR          \//\/      .- \
                       Y        /    Y                 .
                       l       I     !
     .                 ]\      _\    /"\       .
                      (" ~----( ~   Y.  )   by: CyberSamurai.co.uk
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
```

## Good Luck! 🍀

```plaintext
    ···························································
    :    ______                __   __              __     ____ :
    :   / ________  ____  ____/ /  / /  __  _______/ /__  / / / :
    :  / / __/ __ \/ __ \/ __  /  / /  / / / / ___/ //_/ / / /  :
    : / /_/ / /_/ / /_/ / /_/ /  / /__/ /_/ / /__/ ,<_  /_/_/   :
    : \____/\____/\____/\__,_/  /_____\__,_/\___/_/|_/ (_(_)    :
    ···························································
```

Enjoy and may the odds be ever in your favor! 🍀
