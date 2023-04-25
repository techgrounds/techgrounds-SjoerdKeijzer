# AZ-09 Shared Responsibilities Model
Alles als een Service. En wat denk je? Ook dat bestaat. Hebben ze wel XaaS van gegeten die Cloud jongens. 

## Key-terms
### **IaaS**: Infastructure as a Service

### **PaaS**: Platform as a Service

### **SaaS**: Software as a Service. Via het internet toegang tot softwareapplicaties, meestal op abonnementsbasis.

Geen keyterms wel leuk om te weten voor het idee wat er nog meer aaS wordt aangeboden: 

- FaaS : Firewall as a Service
- MSaaS: Managed Software as a Service
- DBaaS: Database as a Service. 
- SECaaS: Je raadt het nooit, maar het is inderdaad Security as a Service. Meestal in de vorm van een abbonement.
- XaaS: Everything as a Service. Kort gezegd alles aaS tools in een (1) pakket. 
- FinOps aaS: Samenvoegsel van Finance en DevOps. In het heel kort: hoe krijg je het soms complexe proces van billing in de Cloud op een rijtje en vergeet vooral geen dingen uit te zetten als je het niet nodig hebt, want kost geld. 
- BaaS - Bike as a Service. Dat is vanMoof. 


## Opdracht
- Bestudeer het Azure Shared Responsibility model

### Gebruikte bronnen
- https://www.salesforce.com/nl/learning-centre/tech/saas/
- https://blog.ogd.nl/cloudoplossingen-de-verschillen-tussen-iaas-paas-en-saas#:~:text=PaaS%3A%20hardware%2D%20en%20softwaretools%20die,internet%20of%20een%20derde%20partij.

### Ervaren problemen
Hoe populairder Cloud wordt, hoe meer '... as a Service' er bij komt. Heel interessant, maar wat een rabbithole. 

### Resultaat
We kunnen natuurlijk eindeloos typen, maar ik vind dit een van de meest overzichtelijke plaatjes over hoe het werkt:

![OGD blog](../00_includes/AZ-09_Azure-Cloud-Better1.png)

On Prem: zelf voor alles verantwoordelijk en 0 voordelen van de Cloud.

IaaS: De Infra dat is nu de zorg van Microsoft en jij mag lekker kiezen wat je daarboven doet zolang je de rekeningen van Azure maar betaald.

PaaS: Wil je nog minder zorgen? Daar hebben we Platform as a Service voor. Dan regelt Microsoft de infra, hosting, opslag en onderhoud voor je. Je mag nog net wel zelf bepalen wat je precies qua applicaties wilt draaien.  

SaaS: Software as a service. Waar de vendor dus alles voor je regelt, inclusief de applicatie zodat de gebruiker zich alleen zorgen hoeft te maken over het daadwerkelijk gebruiken van de applicatie.

 Salesforce is denk ik een hele grote bekende hier.

 Wel nog belangrijke side note voor SaaS is het volgende: 

*For all cloud deployment types, you own your data and identities. You are responsible for protecting the security of your data and identities, on-premises resources, and the cloud components you control (which varies by service type).*

Regardless of the type of deployment, the following responsibilities are always retained by you:

- Data
- Endpoints
- Account
- Access management

___
Kortom: Als we Salesforce als voorbeeld gebruiken: Je bent zelf nog steeds verantwoordelijk voor de data; zowel hoe je het beheert en structrueert. Daar kan Microsoft je niet bij helpen. 

Je bent zelf verantwoordelijk voor de Endpoints (dus mobile devices, laptops, desktops, VM's, servers en ook IoT dingen als koelkasten, speakers en thermostaten). 

Zelf verantwoordelijk voor accounts, account en acces management. Kom niet bij Microsoft aankloppen als jij Admin rights hebt toegewezen aan iemand die dat niet nodig had en die nu de configs heeft veranderd. 
