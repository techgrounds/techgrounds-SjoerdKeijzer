
### Wat wordt de IaC approach?

Declarative (functional): The declarative approach uses the “desired state” concept to define the system requirements. In this approach, you only need to define the target configuration you want for your infrastructure, and the system will apply the necessary changes to reach that state. 

Omdat we al met Biceps gaan werken wat declarative is, laten we het zo veel mogelijk op deze manier proberen te houden. 


## User story: eisen van applicatie
### Als team willen wij duidelijk hebben wat de eisen zijn van de applicatie

Er staan al wat eisen in dit document genoemd, maar deze lijst is mogelijk incompleet of onduidelijk. Het is belangrijk om alle onduidelijkheden uitgezocht te hebben voordat je groot werk gaat verzetten.

De lijst: 

- AZ subscription (welke? is default ok?)
- AZ storage account (type? )
- AZ resource group
- AZ vnet + subnets
    - De volgende IP ranges worden gebruikt: 10.10.10.0/24 & 10.20.20.0/24 (is dit handig?)
    - /!\ Alle subnets moeten beschermd worden door een firewall op subnet niveau (is dit handig?)
- Network security groups (NSG)
- vnet peering
- AZ key vault
- AZ AAD en IAM (nog te implementeren)
- webserver (linux?)
    - SSH of RDP verbindingen met de webserver mogen alleen tot stand komen vanuit de admin server
    - De webserver moet op een geautomatiseerde manier geïnstalleerd worden (post deployment script)
    - De webserver moet dagelijks gebackupt worden. De backups moeten 7 dagen behouden worden. (hoe wordt back-up geschreven, waar moet die opgeslagen worden en op welke manier -> LRS, ZRS etc)
- management server (OS? niet bekend nog)
    - De admin/management server moet bereikbaar zijn met een publiek IP.
    - De admin/management server moet alleen bereikbaar zijn van vertrouwde locaties (office/admin’s thuis) (AZ AAD / conditional access)

- autoscale config als via vmss of anders AZ app service
- DB type voor opslag van ((End User) en/of klant)gegevens - SQL?

Wat te doen met:
- AZ Recovery Service Vault
- /!\ (?) uberhaupt firewall voor inbound verkeer 
- /!\ iets voor post deployment script (kan dit gewoon in een blob container bijvoorbeeld?)
