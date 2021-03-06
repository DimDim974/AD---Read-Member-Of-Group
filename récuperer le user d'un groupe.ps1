Add-PSSnapin Quest.ActiveRoles.ADManagement 
$cp = read-host « Entre le nom d ouverture de session ADM  COMMUN\CP_ADM »
$pw = read-host « Entre ton mot de passe ADM » -AsSecureString
$domaine = read-host « Entrez le nom de domaine »
$co = Connect-QADService –service $domaine –ConnectionAccount $cp  –ConnectionPassword $pw
$Chemin = read-host Entrez l emplacement du fichier
$Groupe = Import-Csv $Chemin -Delimiter ";"
$Sortie = read-host Entrez l emplacement du fichier log
$export = read-host Entrez l emplacement du fichier extrait

New-Item -ItemType directory -Name extrait -Path $export

$count = 0

ForEach ($Item in $Groupe)

{
$count++
$exportFull = $export+'\extrait\'+$Item.Name+'.csv'
get-QADGroup $Item.Name -SizeLimit 0 | Get-QADGroupMember | Select-Object DisplayName,Name,LogonName | export-csv $exportFull -encoding "utf8" -Delimiter ";"
Write-Host $Item.Name":"$count 
$OutFile += $Item.Name+";"+$count+"`n"
}

$SortieFull = $Sortie+'_OutFile.csv'
$OutFile | Out-File $SortieFull

