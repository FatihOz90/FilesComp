$TXT_A = Get-Content "a.txt"
$TXT_B = Get-Content "b.txt"
$TXT_C = ".\c.txt"

$Lookup = @{"==" = "Esit"}

Compare-Object -ReferenceObject $TXT_A -DifferenceObject $TXT_B -IncludeEqual                                  |
   Select @{Name="String";Expression={$_.InputObject}},@{Name="Durum";Expression={$Lookup[$_.SideIndicator]}}  |
   Where-Object {$_.Durum -eq "Esit"}                                                                          |
   Format-Table String | Out-File $TXT_C
