# AZ-03 Advantages of the Cloud
Mogelijkheden tot in de wolken en beyond.

## Key-terms

De 6 voordelen van Cloud computing:
- ### **1. High Availability**: 
In principe draait het altijd. Jouw applicatie/database/etc. blijft draaien zonder interruptie.  Zelfs als er een onderliggend probleem is bij een Azure datacenter dan zal er een weg worden gevonden dat de applicatie naadloos kan blijven draaien. Daar hoef jij je als gebruiker geen zorgen over te maken. Er is wel een sidenote: de precieze verwachtingen worden meestal vastgesteld in een **SLA** (service level agreement). 

- In de SLA worden afgesproken gedaan over Recovery Time Objective (RTO - hoe snel moet het weer runnen als het uitvalt) en Recovery Point Objectives (RPO - als er een recovery plaats moet vinden hou oud mag de data dan zijn). Er kunnen ook afspraken worden gemaakt over bijvoorbeeld uptime garantie van 99.99%, maar daar betaal je dan ook voor. 

- ### **2. Scalability**:
Je hoeft er niet veel over na te denken dan bij 'on-prem' waar bijvoorbeeld stroomkosten, fysieke ruimte voor jouw serverkast en logistiek een rol zouden kunnen spelen.  Je hebt twee soorten scalability:
- **Vertical**: meer of minder CPU, memory, storage. Aka Sterkere units om de oude mee te vervangen. In plaats van een klein bescheiden rack, vervang je die met een full-stack rack zo groot als de grootste koelkast die je kan vinden. 
- **Horizontal**: Je zet meer machines mij de huidige pool die je hebt. Ik zet naast mijn huidige koelkast, nog een (gelijkwaardige) koelkast. 

Via de Cloud is schaalbaarheid geen probleem. 

- ### **3. Elasticity**:
    - Snel wijzigen op basis van vraag aanbod? Bouwt voort op de makkelijke schaalbaarheid van hierboven. Elasticity principe wordt in veel Cloud service providers ook wel **auto-scaling** genoemd. Je kan in een oog opslag capaciteit vergroten of verlagen naar wens. 

- ### **4. Agility**:
    - Letterlijk lenigheid. Wil je over 10 minuten iets draaien? Go. Ik had een DB in een VM, nu wil ik een managed DB. Klik klik. Done. Bij een 'on-premise' situatie kan je niet zomaar in drie kliks veranderen, want dat betekent dat je hardware/software en soms zelf architectuur moet omgooien. Kortom: Cloud is heel erg agile. 

- ### **5. Geo-distribution**:
    - Nog zo'n voordeel van de Cloud. Opeens razend populair in Japan? Openen we een server of website in Region Japan, dat komt de latency van jouw lokale fans alleen maar ten goede. 

- ### **6. Disaster recovery**:
    - Hotel? Trivago! Calamiteit? Cloud! Beetje flauw natuurlijk, maar je zit niet meteen met de gebakken peren als er een calamiteit is. Bij een 'on-prem' situatie ben je wel de sjaak als jouw servers in de fik vliegen. Mocht je nog wel een back-up hebben dan nog is de RPO niet die van de Cloud. 
    
    Cloud providers hebben zelf ook complexe Disaster Recovery plans om te zorgen dat jouw service/dienst blijft draaien volgens SLA. Dankzij de Availability Zones en Region Pairs moet de wereld wel echt vergaan om te zorgen dat de back-ups van de back-ups niet werken. 

## Consumption model

Hier gaan we weer terug naar wat basis Economie les. Ik zie mijn leerkracht van de middelbare school weer een balans tekenen op het krijtbord. Here we go. 

- ### **CapEx**: Capital Expenditure
    - Fysieke gebouwen
    - Apparatuur en randapparatuur (desktops, laptops, servers, monitoren, keyboards etc.)
    - Kantoormeubilair
    - Patenten en licenties
    - Grond (als in land, niet de stormram in Lord of the Rings)
    - Software
    - Voertuigen (auto's)

Ook wel bekend als vaste activa. Dit zijn dingen die (als het goed is) een levenduur van minimaal een jaar hebben en vaak long-term investments zijn. Ook upgrades van bijvoorbeeld Software worden onder dit model als CapEx weggeschreven. 
Deze zaken worden in de accounting voor meerdere jaren op de balans gezet en afgeschreven (na berekening van eventuele waardedaling). 

- ### **OpEx**: Operational Expenditure
    - Verzekering(en)
    - Advertentie en marketing uitgaven
    - Overhead kosten
    - Kantoor benodigheden (papier, pen, paperclips etc.)
    - Voertuig kosten (onderhoud, brandstof)
    - Salarissen
    - Reiskosten
    - Eigendombelasting
    - Onderhoud en reperatiekosten
    - Wettelijke toeslagen
    - Licentie toeslagen
    - Nutsvoorzieningen (Energie, Gas, water etc).

You get the drill. Eenmalige uitgaven of lopende kosten die een bedrijf te maken heeft die voortvloeien uit de dagelijkse bedrijfsvoering (aka operatie). 

## Opdracht
Bestudeer:
- De 6 advantages of the cloud
- Het consumption-based model


### Gebruikte bronnen
- [John Savill over benefits of the Cloud](https://www.youtube.com/watch?v=VaMdHKJQ15c)
- https://networklessons.com/cisco/evolving-technologies/cloud-performance-scalability-and-high-availability
- https://us.sios.com/blog/availability-slas-ft-ha-and-dr-where-to-start/
- https://www.integrify.com/capex-vs-opex/
- https://learn.microsoft.com/en-us/azure/well-architected/cost/design-price


### Ervaren problemen
Niet echt, de meeste van deze termen kom je wel eerder tegen als je iets over Cloud hebt opgezocht. Zowel Microsoft als Amazon promoten natuurlijk verder de grote voordelen van Cloud gebruik. Enige nieuwe termen voor mij was het CapEx/OpEx gedeelte. 

### Resultaat
Zie keyterms. 

Nog uitbreiding op hoe het dan zit met het consumption model in de Cloud:

Daar kan je nu natuurlijk van voorstellen dat afhankelijk van hoe je de service(s) afneemt (zie opdracht, 9 het responsibility model), bepaalde kosten vooral voor Microsoft zijn en niet voor jou. 

Wat in essentie betekent dat zowel CapEx (geen eigen datacenter of serverhok meer nodig) als OpEx (minder personeel, meer VM's/containers en goed toepasbare scalability en auto-scaling) kosten voor jou als bedrijf drastisch worden verlaagd omdat dit voor de rekening van Azure komt. 

En dan hebben we het nog niet eens gehad over het belangrijkste deel:

### **Consumption-based price: You are charged for only what you use aka pay-as-you-go rate.**

en 

### **Fixed price - You provision resources and are charged for those instances whether you use them or not.**


Kortom: als je nog on-prem zit kap daar zo snel mogelijk mee en ga tenminste een hybrid cloud oplossing zoeken voor jouw bedrijfsvoering. Scheelt de nodige centjes op zowel operationeel als kapitaal gebied. 