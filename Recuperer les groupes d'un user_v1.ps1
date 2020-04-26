 Add-PSSnapin Quest.ActiveRoles.ADManagement
$cp = read-host « Entre le nom d ouverture de session ADM  COMMUN\CP_ADM »
$pw = read-host « Entre ton mot de passe ADM » -AsSecureString
$DC = read-host « Entre le controleur de domaine »
$co = Connect-QADService –service $DC –ConnectionAccount $cp  -ConnectionPassword $pwSelect
$Agent = read-host « Entrer l agent »
$user = Get-QADUser $Agent
$user.memberOf | Get-QADGroup | Select-Object Name,DN | export-csv "D:\Aurele.csv" -encoding "utf8" -Delimiter ";"
