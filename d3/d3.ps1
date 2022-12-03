$list = Get-Content -Path input

$allBagDupeValue = 0
$allElfDupeValue = 0

foreach($line in $list) 
{
    $fullCharArray = $line.ToCharArray()

    $eachHalf = ($fullCharArray.Length)/2

    $firstHalf = $fullCharArray[0..($eachHalf-1)]
    $secondHalf = $fullCharArray[($eachHalf)..(($fullCharArray.Length)-1)]
    
    $dupeInBag = $firstHalf | Where-Object -FilterScript { $_ -cin $secondHalf }
    $dupeInBag = $dupeInBag | Select-Object -uniq

    if ($dupeInBag -cmatch "[A-Z]")
    {
        $thisBagDupeValue = [byte][char]$dupeInBag-38
    } 
    else 
    {
        $thisBagDupeValue = [byte][char]$dupeInBag-96
    }

    $allBagDupeValue += $thisBagDupeValue

}

"Part 1 score is " + $allBagDupeValue

For ($i=0; $i -lt $list.Length; $i++) {
    if($i % 3 -eq 0)
    {
        $elfOne = $list[$i].ToCharArray()
        $elfTwo = $list[$i+1].ToCharArray()
        $elfThree = $list[$i+2].ToCharArray()

        $dupeInElfA = $elfOne | Where-Object -FilterScript { $_ -cin $elfTwo }
        $dupeInElfB = $elfOne | Where-Object -FilterScript { $_ -cin $elfThree }

        $dupeInThreesome = $dupeInElfA | Where-Object -FilterScript { $_ -cin $dupeInElfB }
        $dupeInThreesome = $dupeInThreesome | Select-Object -uniq
        
        if ($dupeInThreesome -cmatch "[A-Z]")
        {
            $thisElfDupeValue = [byte][char]$dupeInThreesome-38
        } 
        else 
        {
            $thisElfDupeValue = [byte][char]$dupeInThreesome-96
        }
    
        $allElfDupeValue += $thisElfDupeValue
    }
}

"Part 2 score is " + $allElfDupeValue