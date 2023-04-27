# AZ-08 Firewalls
Ook in de Cloud hebben we nog steeds muren van vuur. 

## Key-terms
- Basic vs Premium Firewall

- Firewall vs Firewall Policy

- Azure Firewall

- Azure Firewall vs NSG
NSG of een Network Security Group en Azure Firewall maken gebruik van regels. Voor een NSG zijn dat Security rules die ook trouwens 0 kunnen zijn. 


## Opdracht
- Zet een webserver aan. Zorg dat de poorten voor zowel SSH als HTTP geopend zijn.
- Maak een NSG in je VNET. Zorg ervoor dat je webserver nog steeds bereikbaar is via HTTP, maar dat SSH geblokkeerd wordt.


### Gebruikte bronnen
- https://learn.microsoft.com/en-us/azure/virtual-network/manage-network-security-group?tabs=network-security-group-portal
- https://learn.microsoft.com/nl-nl/azure/firewall-manager/policy-overview
- https://learn.microsoft.com/en-us/azure/virtual-network/network-security-group-how-it-works


### Ervaren problemen
Geen problemen met de praktische opdracht, dat was zo gedaan omdat we de componenten eigenlijk al eerder in de opleiding hadden gedaan (Firewalls, Apache opzetten). 

### Resultaat
- Zet een webserver aan. Zorg dat de poorten voor zowel SSH als HTTP geopend zijn.

Nieuwe VM gemaakt met SSH en HTTP open. Dat is inmiddels wel gesneden koek. Bij Cloud init ook `apt install nmap -y` gezet zodat we ook meteen ports kunnen checken of ze open staan. 

![Alt text](../00_includes/AZ-08_nieuwe_vm_nieuwe_kansen1.png)

Onze goede vriend Apache doet het ook, dat is toch altijd fijn om te zien. Port 80 en 22 staan inderdaad open. 

- Maak een NSG in je VNET. Zorg ervoor dat je webserver nog steeds bereikbaar is via HTTP, maar dat SSH geblokkeerd wordt.

![Alt text](../00_includes/AZ-08_NSG.png)

Nieuwe NSG aanmaken is ook recht toe recht aan. Er bestaat al een default NSG bij het aanmaken van een VM, enige opletten is dus of je die wilt verhuizen naar een andere resource groep of dat je een apart resource group wilt aanmaken voor de nieuwe NSG en de VM's en bijbehorende dingen in dezelfde resource group wilt zetten. Ik probeerde de originele nsg te verwijderen, maar dat kan niet als er dingen onder draaien :)

![Alt text](../00_includes/AZ-08_geen_SSH.png)

Maar goed, we gaan de SSH dicht gooien. 

![Alt text](../00_includes/AZ-08_no_ssh.png)

Ik kon in eerste instantie nog wel inloggen. Wist niet precies of dat lag aan Azure die wat sloom is met updaten van de NSG rules of dat het op de VM moet landen. Dan maar VM gereboot en voila, task failed succesfully. 

![Alt text](../00_includes/AZ-08-blijft_werken.png)

Apache blijft wel werken. 