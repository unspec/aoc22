$list = Get-Content -Path input

$totallyInsideOtherElf = 0
$someOverlapping = 0
$noOverlapping = 0

foreach($line in $list) 
{
    $elfAssigns = $line.Split(",")
    $elf1 = $elfAssigns[0].Split("-")
    $elf2 = $elfAssigns[1].Split("-")

    [int]$elf1Start = $elf1[0]
    [int]$elf2Start = $elf2[0]
    [int]$elf1End = $elf1[1]
    [int]$elf2End = $elf2[1]

    if ($elf1Start -ge $elf2Start -and $elf1End -le $elf2End) #elf1 in elf2
    {
        $totallyInsideOtherElf++
    }

    elseif ($elf1Start -le $elf2Start -and $elf1End -ge $elf2End) #elf2 in elf1
    {
        $totallyInsideOtherElf++   
    }

    elseif ($elf1End -ge $elf2Start -and $elf1Start -le $elf2End) 
    {
        $someOverlapping++
        #"elf1End " + $elf1End + " ge elf2Start " + $elf2Start
    }

    elseif ($elf2End -ge $elf1Start -and $elf2Start -le $elf1End)
    {
        $someOverlapping++  
        #"elf2End ge elf1Start "  
    }

    else 
    {
        $noOverlapping++
    }

}

$anyOverlapping = $totallyInsideOtherElf + $someOverlapping

"totallyInsideOtherElf: " + $totallyInsideOtherElf + " noOverlapping: " + $noOverlapping + " someOverlapping: " + $someOverlapping  + " anyOverlapping: " + $anyOverlapping