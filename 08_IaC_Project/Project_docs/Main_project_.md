
# IaS Project met Python en Azure Biceps

## Case samenvatting: 
### *Bedrijf will van on-prem naar cloud omgeving. Help ze hierbij door de deployment te automatiseren via templates. Voor specificaties zie requirements en user stories.* 
_____________

## Wat zijn de verwachtingen in dit project?
- Met weinig begeleiding nieuwe kennis opdoen en toepassen
- Op een abstract niveau het project begrijpen
- Zelfstandig problemen op kunnen lossen
- Een discussie kunnen aangaan over de technische elementen
- Verbeteringen kunnen suggereren op code- en projectniveau

## Requirements
- Alle VM disks moeten encrypted zijn.
- De webserver moet dagelijks gebackupt worden. De backups moeten 7 dagen behouden worden.
- De webserver moet op een geautomatiseerde manier geïnstalleerd worden.
- De admin/management server moet bereikbaar zijn met een publiek IP.
- De admin/management server moet alleen bereikbaar zijn van vertrouwde locaties (office/admin’s thuis)
- De volgende IP ranges worden gebruikt: 10.10.10.0/24 & 10.20.20.0/24
- Alle subnets moeten beschermd worden door een firewall op subnet niveau.
- SSH of RDP verbindingen met de webserver mogen alleen tot stand komen vanuit de admin server.
- Wees niet bang om verbeteringen in de architectuur voor te stellen of te implementeren, maar maak wel harde keuzes, zodat je de deadline kan halen.


In de uitwerking van de Bicep-app zorg ervoor dat je **klein begint en dat je incrementeel features toevoegt**. Zorg ervoor dat je altijd een commit / branch heb waar je op terug kan vallen met een werkende versie van je applicatie. Je kan met Git Tag commits labels geven die makkelijk in GitHub terug te vinden zijn. Mocht je code compleet zijn met de bovengenoemde eisen, dan kan je de tag ‘v1.0’ gebruiken.
_____________________________

## Time management
### Deliverables:
De volgende deliverables worden verwacht in je GitHub repository aan het eind van dit project:
- Een werkende CDK / Bicep app van het MVP
- Ontwerp Documentatie
- Beslissing Documentatie
- Tijd logs
- Eindpresentatie

**Werkende applicatie van het MVP**

De werkende applicatie moet een build en een deployment succesvol afronden. Een versie van je MVP moet eenvoudig te identificeren zijn. Dit kan met een tag, of een release. Daarnaast moet je repository documentatie bevatten over hoe je de applicatie gebruikt. Hierin geef je aan hoe je de applicatie aanroept, de argumenten die nodig zijn, en welke rechten deze nodig heeft in AWS of Azure om te deployen.

**Ontwerp Documentatie**

Je zal de bestaande architectuur gebruiken. Er zijn nog wel details die verder uitgewerkt dienen te worden. In dit document zal je de gaten opvullen en uiteindelijk de praktische en technische informatie vermelden in GitHub. Dit document zal informatie bevatten over je gekozen (N)SG regels. Maar ook een visualisatie van wat, en in welke volgorde, je applicatie deployt in de cloud.
In v1.1 zal je hier ook je eigen diagrammen plaatsen voor de aanpassingen en de verbeteringen onderbouwen.

**Beslissing Documentatie**

Tijdens het implementeren van het ontwerp zal je beslissingen maken over o.a. diensten die je gaat gebruiken. In dit document zal je je overwegingen uitschrijven en je besluiten onderbouwen. Dit document zal ook al je assumpties en verbeteringen bevatten. Dit dient als basis voor je ontwerp documentatie.

**Tijd logs**

Dit is bestand waar je in gestructureerd je dagen bijhoudt. Je geeft aan in 1 enkele zin waar je aan gewerkt hebt die dag. Puntsgewijs zal je de obstakels aangeven die je hebt ervaren en de oplossingen die je hebt gevonden.
