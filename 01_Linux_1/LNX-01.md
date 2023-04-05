# LNX-01
Inloggen op VM via SSH

## Key-terms
### SSH = een secure shell of Secure Socket Shell en is een cryptografisch netwerk protocol om veilig te kunnen verbinden met een (onbeveiligd) ander netwerk.

### Powershell
De console applicatie en scripting taal van Microsoft waarmee je veel dingen kan doen. Het wordt voornamelijk gebruikt als automatisatie tool. 

### Keys
Letterlijk vertaald een sleutel. Je moet natuurlijk een sleutel hebben om ergens binnen te komen. Om niet elke keer een password te gebruiken kan je authenticatie met keys gebruiken. 
Er zijn ook nog public en private keys. Kort door de bocht geldt daar voor dat door middel van cryptografie een slimme methode is ontwikkeld zodat je bijvoorbeeld met public keys berichten geencrypt kan versturen naar andere users. Met de private key kan je het bericht deencrypten. 

## Opdracht
- Maak via SSH connectie met jouw VM.
- Als je connectie hebt gemaakt, type command whoami om dit te verifieren.

## Wat heb ik gedaan

Gezocht op wat ik nodig had. Uiteindelijk terecht gekomen op Microsoft website en die had goede dingen. Open SSH client stond al op mijn laptop, Open SSH server nog niet, die moest ik installeren en via services.msc activeren. 

Vervolgens PowerShell opstarten en invoeren van:

`ssh -i nest-sj-keijzer.pem sjoerd@18.157.179.30 -p 52210`

-i om key te inserten, en we moesten in dit geval ook de poort specificeren en dat doe je met -p poortnummer

### Gebruikte bronnen
Het server IP, username en key stonden allemaal op de Techgrounds Drive.
https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui
https://help.skytap.com/connect-to-a-linux-vm-with-ssh.html
https://www.preveil.com/blog/public-and-private-key/

### Ervaren problemen
Geen problemen, ik had eigenlijk verwacht dat dit lastiger zou zijn. Op de kwalificatie opdracht met Putty en VM in Azure heb ik een stuk meer lopen zweten. 

### Resultaat

Screenshot van whoami
![](https://github.com/techgrounds/techgrounds-SjoerdKeijzer/blob/main/00_includes/screen%20LNX-01_whoami.png)
