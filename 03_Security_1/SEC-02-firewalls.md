# SEC-02 Firewalls
Zoek je iets om jouw IT veilig te houden van malware en insluipers die er niet horen? Groot hek met vuur doet dat wel goed. 

## Key-terms
### **Firewall algemeen**: 
Een apparaat dat inkomend en uitkomend netwerkverkeer bewaakt en bepaalt welk verkeer wordt toegestaan op basis van een gedefineerde set regels.

### **Stateless / Statefull**:
**Statefull**: 'traditionele' firewall. Bepaalt aan de hand van status, poort en protocol of verkeer door mag. Een statefull analyseert verkeer complete stroom van data. Verkeer dat bijvoorbeeld niet de verplichte handshake kunnen voltooien worden geblockt. Minpunt van statefull is, omdat ze intensief monitoren, dat ze prooi kunnen valleen aan DDoS aanvallen.
**Stateless**: Deze analyseert een deel van packets, niet algeheel verkeer, en kan daardoor geen analyse maken van grotere stromen. Als de deel packet aan de gestelde veiligheidsregels voldoet, mag die door. De hele packet wordt niet gechecked. Om Stateless goed werkend te krijgen heb je dus wel een uitgebreide configuratie nodig. Voordeel is dan wel weer dat Stateless veel verkeer makkelijk aan kan. 

**NGFW**:
Next Gen Firewall Wall. De Chinese Muur is hier niks bij. 

### **Hardware / software**:

## Opdracht
- Installeer een webserver op je VM.
- Bekijk de standaardpagina die met de webserver geïnstalleerd is.
- Stel de firewall zo in dat je webverkeer blokkeert, maar wel ssh-verkeer toelaat.
- Controleer of de firewall zijn werk doet.


### Gebruikte bronnen
- https://www.cisco.com/c/nl_nl/products/security/firewalls/what-is-a-firewall.html
- https://www.cdw.com/content/cdw/en/articles/security/stateful-versus-stateless-firewalls.html#:~:text=Stateful%20firewalls%20are%20capable%20of,preset%20rules%20to%20filter%20traffic.
- https://www.n-able.com/blog/stateful-vs-stateless-firewall-differences


### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]