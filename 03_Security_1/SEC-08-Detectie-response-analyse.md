# SEC-08 Detectie, response en analyse
[Geef een korte beschrijving van het onderwerp]

## Key-terms
### **IDS**: 
Intrusion Detection System. Een IDS bestaat uit sensoren in een netwerk of op systemen die de activiteit in de gaten houden in combinatie met een console. Op de console kan je aflezen wat er gebeurt en gaan de alarmen af als er verdachte activiteit is. Het kan dus niet zelfstandig ingrijpen. 

IDS plaatst je meestal naast een switch/router, dus niet direct inline verbinding met andere netwerkapparaten. Zo voorkom je dat verkeer vertraagd wordt en de IDS kan zijn functie nog steeds uitstekend uitvoeren. 

### **IPS**:
Intrusion Prevention System. Een IPS houdt net als een IDS de activiteit op een computersysteem of netwerk in de gaten. Het analyseert alle gebeurtenissen op signalen van mogelijke inbraak. Maar in tegenstelling tot een IDS, kan een IPS ook zelf actie ondernemen. Wanneer vooraf ingestelde regels worden overtreden, stopt het IPS risicovolle acties. Bijvoorbeeld door het verkeer vanaf een bepaald IP-adres te blokkeren.

Hoewel meestal als veiliger aangeduid moet een IPS inline (dus bijvoorbeeld tussen firewall en router) geplaatst worden en zal die het verkeer een tikkeltje vertragen. Ook kan het zijn dat de IPS verkeer onderschept wat volgens hem/haar een bedreiging is, ook als dat wellicht niet zo is. 

### **Hack Response Strategies**:
Er zijn natuurlijk verschillende manieren, maar het is wel handig de volgende zaken te hebben: 

1. **Incident Response (IR)** plan. Voorbereiding is het halve werk. Het is slim om een IR op te stellen zodat je in elk geval al procedures hebt hoe je met een aanval of hack om moet gaan. In een uitgewerkt IR staan procedures voor detectie, analyse van patronen, het melden van opmerkelijkheden en eventuele mogelijke zwakke plekken voor exploits en herstelplan mocht het mis gaan. Praktische dingen kunnen bijvoorbeeld zijn hoe hoog de Prio is en als het een P1 is welke cybersecurity officer of IT'er opgetrommeld moet worden. Of bij een (groot) data lek dat het aan bepaalde autoriteiten moet worden gemeld. 

2. **Back-ups** zijn ook onmisbaar. Niet alleen in een 'regulier' incident geval als er een power outage is, maar ook als er cyberaanval is. Er moet een plan van herstel klaar liggen om alles weer zo snel mogelijk aan de praat te krijgen. 

3. Nu we het toch over IR en back-ups hebben, het **Disaster Recovery Plan (DRP)**, kan een onderdeel zijn van een IR procedure. In de DRP staat gedetaileerd omschreven hoe kritieke onderdelen zo snel mogelijk weer kunnen worden herstelt en bijvoorbeeld welke alternatieve communicatie systemen kunnen worden gebruikt. Vaak is er ook een soort Contingency/Emergency chain of command waar gerapporteerd aan moet worden.  

Niet alleen in het geval van een cyber aanval maar ook eventuele natuurrampen of outage van een centraal datacenter. Allemaal rekening mee houden. 

4. Nu we een plan hebben hoe we dingen al redelijk snel kunnen herstellen, kunnen we aan de voorkant aan meer maatregelen denken. **Reguliere security audits en vulnerability assesments** helpen om potentiele zwakke punten in kaart te brengen en dit op te lossen voordat het mogelijke exploits kunnen worden die kwaadwillenden kunnen gebruiken om binnen te dringen. 

5. **Train je werknemers**. Het helpt als niet elke bijna-pensionado op een phising e-mail van een Nigeriaans prins klikt. Wat wel werkt: als jouw werknemers security threats als phishing en rare activiteiten kunnen a) herkennen en b) weten waar ze het moeten rapporteren.

6. **Incident Response Team (IRT)**. Als je een grote organisatie bent dan kan dit heel nuttig zijn. Het IRT coordineerd en is eindverantwoordelijk. het team zal op basis van IR en eventueel DRP actie ondernemen en coordineren. En natuurlijk communiceren met alle relevante stakeholders (inclusief autoriteiten). 
Het kan zijn dat een Persvoorlichter/PR-manager onderdeel is van het IRT en zijn/haar taak is om dan de communicatie naar media en externe partners/klanten te managen. 
Voor hele grote Incidents/Disruptions bij mijn vorige werkgever was er zelf een speciaal afgeschermde *'Warroom'* vanwaar het IRT in een veilige situatie de crisis kan beteugelen en snel kan schakelen. 

7. Gebruik **Multi-factor authentication (MFA)**. Zoals we uit eerdere opdrachten hebben geleerd in deze module: meerdere veiligheids lagen zijn altijd beter. 

8. Inkoppertje natuurlijk maar toch niet vergeten te noemen; **encrypt gevoelige informatie**. Zo maak je het kwaadwillende al een stuk lastiger om zomaar met admin admin login credentials binnen te komen. 

9. Maak gebruik van **acces controls en least privilege policies**. Mocht de directeur of een service desk medewerker gehackt worden dan ligt niet meteen het hele netwerk plat. Zorg dat iedereen alleen rechten heeft die strikt noodzakelijk voor wat de functie nodig heeft. 

10. **Gebruik IDS en IPS** om netwerk verkeer te monitoren en rare patronen te ontdekken. 

11. Mocht er toch een Incident zijn, vergeet dan niet om een **post-incident review** te doen. Dit om te evalueren hoe iemand binnen kon komen en dit in de toekomst te voorkomen. En om wellicht de effectiviteit en snelheid van response te verbeteren. 


### **System hardening**: 
Letterlijk vertaalt 'syteem verharding'. Eigenlijk betekent het dat je goed voorbereid moet zijn en het zo moeilijk mogelijk moet maken om binnen te komen. Dit kan je doen door te zorgen dat jouw **systemen altijd up-to-date zijn**, zodat er geen oude beveiligings exploits gebruikt kunnen worden (shout out naar alle bedrijven die nog Win XP draaien of Windows Server 2003 gebruiken). 

Maar ook door bijvoorbeeld; 
- **Netwerk hardening**: (goede firewalls rules te gebruiken; block ongebruikte of onnodig openstaande netwerk ports; verwijder onnodige protocollen en services; gebruik access lijsten; encrypt netwerk verkeer)
- **Audit**: je systemen zodat je een idee hebt waar zwakke plekken zijn.
- **Server hardening**: Zorgt dat superuser en admin rights kloppen en dat rechten en toegang in lijn zijn met principle of least priviledge; geen onnodige software op de server; zorg dat alle company hosted servers in een veilig datacenter/plek staan. Voor Cloud specifiek; zorg dat je weet welke porten in gebruik zijn zodat data niet lekt of er ongewenste backdoor ingangen zijn. 
- **Endpoint hardening**: Verwijder local admin op alle Windows/macOS endpoints; zorg ervoor dat geen workstation, laptop of IoT standaard wachtwoorden hebben; verwijder onnodige software; block onnodige communicatie

## **TL;DR versie**: 
verwijder/disable onnodige software/ongebruikte ports om te voorkomen dat dit een potentiele ingang kan zijn; monitor verkeer, versleutel verkeer, zorg dat rechten (permissions) volgens least priviledge zijn; update alles naar laatste standaard; gebruik MFA; klik niet op dubieuze links of e-mails; bij twijfel forward naar ITsec team; bij incident forward naar Incident Response Team (IRT).

### **Types of disaster recovery options**:

### **RPO**:

### **RTO**:

## Opdracht
- A Company makes daily backups of their database. The database is automatically recovered when a failure happens using the most recent available backup. The recovery happens on a different physical machine than the original database, and the entire process takes about 15 minutes. What is the RPO of the database?
- An automatic failover to a backup web server has been configured for a website. Because the backup has to be powered on first and has to pull the newest version of the website from GitHub, the process takes about 8 minutes. What is the RTO of the website?


### Gebruikte bronnen
- https://www.interparts.nl/beveiliging/security-appliance/
- https://www.juniper.net/nl/nl/research-topics/what-is-ids-ips.html
- https://www.techtarget.com/searchsecurity/definition/incident-response
- https://www.msp360.com/resources/blog/how-to-respond-to-cyberattacks/#:~:text=Containment%2C%20eradication%2C%20and%20recovery%20%E2%80%93,having%20a%20plan%20for%20recovery
- https://www.beyondtrust.com/resources/glossary/systems-hardening





### Ervaren problemen
Was veel theorie, dus daar wel even doorheen moeten fietsen. Opdracht zelf was niet al te ingewikkeld. 

### Resultaat
[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]