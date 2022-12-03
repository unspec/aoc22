$list = Get-Content -Path input

$score = 0

[hashtable]$hash = [ordered]@{
    AX = 4;#1+3
    AY = 8;#2+6
    AZ = 3;#3+0
    BX = 1;#1+0
    BY = 5;#2+3
    BZ = 9;#3+6
    CX = 7;#1+6
    CY = 2;#2+0
    CZ = 6#3+3
}

foreach($line in $list) 
{

    $line = $line -replace '\s',''
    $thisRound = 0
    $thisRound = $hash."$line"
    $score += $thisRound
}

"Part 1 score is " + $score

$score = 0

[hashtable]$hash2 = [ordered]@{
    AX = 3;#0+C
    AY = 4;#3+A
    AZ = 8;#6+B
    BX = 1;#0+A
    BY = 5;#3+B
    BZ = 9;#6+C
    CX = 2;#0+B
    CY = 6;#3+C
    CZ = 7#6+A
}

foreach($line in $list) 
{

    $line = $line -replace '\s',''
    $thisRound = 0
    $thisRound = $hash2."$line"
    $score += $thisRound
}

"Part 2 score is " + $score