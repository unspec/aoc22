$list = Get-Content -Path input

$elfArray = @()
$currentElf = 0
$totalCarriedTop3

foreach($line in $list) 
{
    if ($line -eq "")
    {
        $elfarray += $currentelf
        $currentelf = 0
    }
    else 
    {
        $currentelf += $line
    }

}

$maxElf = $elfarray | Measure-Object -Maximum
$maxElfValue = $maxElf.Maximum
[int]$maxElfValueInt = $maxElfValue
$elfIndex = $elfarray.IndexOf($maxElfValueInt)

$elfnumber = $elfIndex + 1

"Elf with most calories is elf " + $elfnumber + " with " + $maxElfValueInt + " calories."

#Part 2
$totalCarriedTop3 += $maxElfValueInt

#Remove the first and recal
$elfarray[$elfIndex] = 0

$maxElf = $elfarray | Measure-Object -Maximum
$maxElfValue = $maxElf.Maximum
[int]$maxElfValueInt = $maxElfValue
$elfIndex = $elfarray.IndexOf($maxElfValueInt)

$totalCarriedTop3 += $maxElfValueInt

#Remove the second and recal
$elfarray[$elfIndex] = 0

$maxElf = $elfarray | Measure-Object -Maximum
$maxElfValue = $maxElf.Maximum
[int]$maxElfValueInt = $maxElfValue
$elfIndex = $elfarray.IndexOf($maxElfValueInt)

$totalCarriedTop3 += $maxElfValueInt

"Total carried by top 3 is hopefully " + $totalCarriedTop3