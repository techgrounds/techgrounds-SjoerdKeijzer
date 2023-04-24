# AZ-01 Global Infrastructure
De Cloud begint ergens natuurlijk. 

## Key-terms
### **Regions**:
Azure heeft verschillende regions. Op datacenter van Azure (Microsoft) kan je dan aanhaken en jouw plekje in de Cloud gebruiken. Voor de snelheid van de verbinding(en) is het dan handig dat deze locatie enigzins in de buurt is en niet in Australie. Dat had Microsoft ook al bedacht en daarom hebben ze regions gemaakt op basis van latency en zijn ze verbonden met regionale low-latency netwerken. 

Voorbeeld van een Region is: Europe. Een Availabiliy Zone (AZ) is bijvoorbeeld UK South of West Europe. 

### **Availability Zone**:
We hebben het hier boven al een beetje verklapt maar een Availability Zone ligt in een Region. Binnen Europa zijn dat er heel wat, en zijn meer op Regionaal niveau toegespits om daar netwerk verkeer in goede banen te leiden. 

### **Region Pairs**: 
Het zou kunnen dat door een orkaan, aardbeving of oorlog meerdere Availability Zones getroffen worden, mogelijk zelfs een hele Region. Omdat je Single Point of Failure ten allen tijden wil voorkomen, zijn er Region Pairs. Stel jij zit in Regio Europe. Er is iets gebeurd in een bepaalde AZ wat een overload van traffic veroorzaakt op de rest van de AZ binnen die Region (of de Region plat ligt) dan is dat wat onhandig. Stel dat Americas de region pair is, dan wordt traffic omgeleid naar waarschijnlijk een East Coast datacenter. Ook worden daar back-ups gemaakt (want region pair) dus is jouw data in geval van calamiteit ook nog steeds oproepbaar. 

## Opdracht
- Wat is een Azure Region?
- Wat is een Azure Availability Zone?
- Wat is een Azure Region Pair?
- Waarom zou je een regio boven een andere verkiezen?


### Gebruikte bronnen
- https://learn.microsoft.com/en-us/azure/reliability/availability-zones-overview
- [John Savill on AZ zones](https://www.youtube.com/watch?v=4nDRvZR2EjU)
- https://www.techtarget.com/searchcloudcomputing/tip/Learn-the-cost-implications-of-cloud-regions-and-availability-zones

### Ervaren problemen
Ik heb al een paar keer John Savill meegekeken met mijn vriendin, die heeft AZ-900 en MS-900 voor haar werk moeten halen. De zones is wel bekend verhaal, maar heb het toch maar weer even keertje terug gekeken. John is een topgast. 

### Resultaat
Zie keyterms en ervaren problemen. 
+
- Waarom zou je een regio boven een andere verkiezen?

Sneller internet is meestal beter. Sommige regions hebben meer mogelijkheden dan anderen. De prijs per Availability Zone kan nog wel eens verschillen en als voor jou de Regions dicht bij elkaar zouden zitten, kan je overwegen naar een andere goedkopere Region met bijbehorende Availability Zones te kijken. 