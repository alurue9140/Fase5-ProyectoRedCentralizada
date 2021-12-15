#El archivo estaba en "C:\Windows\System32\winevt\Logs\Security.evtx" pero lo tuve que sacar por permisos"
$rutaFicheroEventos = "C:\Security.evtx"
$rutaFicheroZip = "C:\Logs\Security.zip"

Compress-Archive -LiteralPath $rutaFicheroEventos -DestinationPath $rutaFicheroZip

$accountFrom = "alurue9140@gmail.com"
$accountTo = "juancarlos.requena@ieselcaminas.org"

$MailMessage = @{
  To = $accountTo
  From = $accountFrom
  Subject = "DC Server Report Domain alcoy - Events Security"
  Body = "<p>Se adjunta el fichero zip con los eventos de Seguridad con fecha:<strong> $(Get-Date -Format g)</strong></p>”
  Smtpserver = "smtp.gmail.com"
  Port = 587
  UseSsl = $true
  BodyAsHtml = $true
  Encoding = “UTF8”
  Attachment = $rutaFicheroZip
}

try 
{
  $password = "********" 
  $secureStringPwd = ConvertTo-SecureString $password -AsPlainText -Force
  $credential = new-object -typename System.Management.Automation.PSCredential -argumentlist $accountSource,$secureStringPwd
  Send-MailMessage @MailMessage -Credential $credential
  Write-Output "Mensaje enviado correctamente"
}  
catch
{
  Write-Error -Message "Error al enviar correo electrónico"
}
