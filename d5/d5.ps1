$list = Get-Content -Path input

$stacksTemp = @()

foreach($line in $list) 
{

    if ($line.StartsWith("["))
    {
        $lineArray = $line -split '(.{4})' -ne '' 

        $stacksTemp += $lineArray
    
    }

    elseif ($line.StartsWith(" 1"))
    {
#do nothing for now
    }

    elseif ($line.StartsWith("move"))
    {
        $line = $line -replace 'from',''
        $line = $line -replace 'move',''
        $line = $line -replace 'to',''

        $lineArray = $line -split '\s' -ne '' 


$lineArray
    }



    #$line = $line -replace '\s',''
    #$thisline = @()
    #$line
}

$stacksTemp


#$fullCharArray = $line.ToCharArray()
#$line = $line -replace '\s',''
#$elf2 = $elfAssigns[1].Split("-")
