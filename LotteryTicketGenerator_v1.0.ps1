<#
Based on data obtained from between years 2020-2025
https://www.beatlottery.co.uk/lotto/draw-history/year/2020

#>
#------------------------- GLOBAL VARS -------------------------
$list = @() # separate tickets
$concatList = @() # all 6 digits combined into one string

#---------------------

#------------------------ TEMP VARIABLES -------------------------
$outPath = "C:\temp\tickets.csv"
$ticketPrice = 2

#-------------------- SEQUENCE OF NUMBERS -------------------------
    $column1 = "01","03:04","07:08"
    $column2 = "07","13","15"
    $column3 = "21","27:28","33"
    $column4 = "37","39"
    $column5 = "44","50","52"
    $column6 = "57:59"
#------------------------------------------------------------------

function Get-NumberOfOptions {
    param (
        [string[]]$ranges
    )
    $totalOptions = 0
    foreach ($range in $ranges) {
        $parts = $range -split ':'
        if ($parts.Length -eq 2) {
            $start = [int]$parts[0]
            $end = [int]$parts[1]
            $totalOptions += ($end - $start + 1)
        } else {
            $totalOptions += 1
        }
    }
    return $totalOptions
}
function Get-RandomNumberFromRange {
    param (
        [string]$range
    )
    $parts = $range -split ':'
    if ($parts.Length -eq 2) {
        $start = [int]$parts[0]
        $end = [int]$parts[1]
        return Get-Random -Minimum $start -Maximum ($end + 1)
    } else {
        return [int]$parts[0]
    }
}
function Get-UniqueSequence {

    $columns = @($column1, $column2, $column3, $column4, $column5, $column6)

    $sequence = @()

    foreach ($column in $columns) {
        if ($column -is [string]) {
            $number = Get-RandomNumberFromRange -range $column
        } else {
            $randomRange = Get-Random -InputObject $column
            $number = Get-RandomNumberFromRange -range $randomRange
        }
        $sequence += $number
    }

    $customObject = [PSCustomObject]@{
        '1st number' = $sequence[0]
        '2nd number' = $sequence[1]
        '3rd number' = $sequence[2]
        '4th number' = $sequence[3]
        '5th number' = $sequence[4]
        '6th number' = $sequence[5]
    }

    return $customObject
}
function Get-TotalUniqueSequences {

   
   $columns = @($column1, $column2, $column3, $column4, $column5, $column6)

    $totalColumn1 = Get-NumberOfOptions -ranges $column1
    $totalColumn2 = Get-NumberOfOptions -ranges $column2
    $totalColumn3 = Get-NumberOfOptions -ranges $column3
    $totalColumn4 = Get-NumberOfOptions -ranges $column4
    $totalColumn5 = Get-NumberOfOptions -ranges $column5
    $totalColumn6 = Get-NumberOfOptions -ranges $column6


    $totalUniqueSequences = $totalColumn1 * $totalColumn2 * $totalColumn3 * $totalColumn4 * $totalColumn5 * $totalColumn6

    return $totalUniqueSequences 
    }




$totalSequences = Get-TotalUniqueSequences

function Show-Banner {
$bunny = @"
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
"@
Clear-Host
Write-Host $bunny -ForegroundColor Yellow;Start-Sleep -Milliseconds 500
}

function Get-Tickets{
param(
[int]$ticket = 1,
[switch]$all = $false,
[switch]$now = $false
)
Show-Banner

if($all){$ticket = $totalSequences}

for ($x = 0; $totalUniqueSequences -lt $ticket; $x++) {

    $sequence = Get-UniqueSequence
    $concatSequence = [string]$sequence."1st number" + ":" + [string]$sequence."2nd number" + ":" + [string]$sequence."3rd number" + ":" + [string]$sequence."4th number" + ":" + [string]$sequence."5th number" + ":" + [string]$sequence."6th number"

    if ($concatSequence -notin $concatList) {
        $list += ,$sequence # Add sequence as a subarray
        $concatList += ,$concatSequence

        #Write-Host "not yet" ##-debug
       #$concatList ##-debug
       $totalUniqueSequences = $concatList.count
       if($now){
       write-host "Generating ticket number:$totalUniqueSequences/$totalSequences" -ForegroundColor Gray ##debug
       }
    }
    elseif($concatSequence -in $concatList){
   #Write-Host "$ConcatSequence already exist, skipping" -ForegroundColor Magenta ##-debug
    #start-sleep -seconds 4  ##-debug
    }
 
}

$totalUniqueSequences = $concatList.count
$ticketNumbers = $list.count
$cost = $ticketNumbers * $ticketPrice
$totalPounds = $cost | Format-Currency -Currency GBP -SymbolAtEnd
[string]$percentageChance= ($ticketNumbers * 100) / $totalSequences

Try{$percentageChance = $percentageChance.Substring(0,6)}
Catch{$percentageChance = $percentageChance.Substring(0.2)}





if(!($all)){Write-Host "----- Tickets -----" -ForegroundColor Yellow ; $list} #Show ticket numbers

Write-Host "---" -ForegroundColor Blue
Write-Host "Total possible sequences based on values provided is: $totalSequences" -ForegroundColor Yellow
Write-Host "Number of unique tickets generating: $ticketNumbers" -ForegroundColor Yellow
Write-Host "---" -ForegroundColor Blue
Write-Host "Cost per ticket: £$ticketprice"  -ForegroundColor Yellow
Write-Host "Total cost to play all possible combinations generated is: $totalPounds" -ForegroundColor Yellow
Write-Host "---" -ForegroundColor Blue
Write-Host "Your percentage of winning the lottery is: $percentageChance%" -ForegroundColor Yellow
Write-Host "---" -ForegroundColor Blue
if($now){$list | Export-Csv -Path $outPath -NoTypeInformation;Write-Host "Final tickets report generated at $outPath" -ForegroundColor Yellow}
else{Write-Host "To generate csv file with all tickets  the numbers run Get-Tickets -now"}
$goodluck = @"
    ···························································
    :    ______                __   __              __     ____ :
    :   / ________  ____  ____/ /  / /  __  _______/ /__  / / / :
    :  / / __/ __ \/ __ \/ __  /  / /  / / / / ___/ //_/ / / /  :
    : / /_/ / /_/ / /_/ / /_/ /  / /__/ /_/ / /__/ ,<_  /_/_/   :
    : \____/\____/\____/\__,_/  /_____\__,_/\___/_/|_/ (_(_)    :
    ···························································
"@
Write-Host $goodluck -ForegroundColor Green
}
    