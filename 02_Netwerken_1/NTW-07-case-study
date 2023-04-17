# NTW07-case study
Bouw je eigen webshop toko. Doen we. 

## Key-terms
- DMZ (demilitarized zone). Ik wist oprecht niet dat dit ook in de IT werd gebruikt. Een DMZ in militaire zin is een soort niemandsland, een bufferzone. Grens tussen de twee Korea's in een voorbeeld. In de IT moet je het ook zien als een bufferzone. 


## Opdracht
The office contains the following devices:
- A web server where our webshop is hosted
- A database with login credentials for users on the webshop
- 5 workstations for the office workers
- A printer
- An AD server
- A file server containing internal documents

As a network administrator you get to choose which networking devices get used.

- Design a network architecture for the above use case.
- Explain your design decisions


### Gebruikte bronnen
- https://www.barracuda.com/support/glossary/dmz-network
- https://intellipaat.com/blog/what-is-dmz-network/


### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
Ik had meteen al zoiets dat het handig zou zijn om bepaalde zaken te clusteren. Front-end vs back-end en de werkplekken voor medewerkers.

Laten we daarmee beginnen:

- Frontend: Webserver

- Back-end: DB with login credentials + AD server + file server for internal documents

- Office LAN: 5 workstations + printer

Nou zou ik in schatten dat met 5 workstations dit geen hele grote webshop is met gigantisch veel traffic. Mocht dat wel zijn, kan je ook nog overwegen om meer dan 1 hostingmachine voor de webshop te maken met een load balancer ervoor in de DMZ. Laat ik voor nu uitgaan dat het een wat kleinere webshop is. 