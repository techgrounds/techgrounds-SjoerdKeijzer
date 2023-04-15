# NTW-06 Subnetting
Netwerk in je netwerk? Het is net werk. 

## Key-terms
- **Subnet**:
Een subnetwork, kortweg subnet, is in essentie een netwerk binnen een netwerk. 

- **Octet**: De cijfers die tussen de puntjes van `xxx.xxx.x.x` staan. Ander voorbeeld is: `192.168.1.2` De verschillende octeten hier zijn `192`, `168`, `1` en `2`. Een IPv4 adres bestaat dus uit 4 octeten. 

- **Subnet Mask (ook prefix genoemd)**:
De subnet mask van bijvoorbeeld jezelf kan je ontdekken door `ipconfig` in cmd prompy te typen voor Windows, of `ifconfig` voor MasOS/LNX. 

In de meeste gevallen is het voor jou en mij iets wat lijkt op `255.255.255.0`. Sommige bedrijven hebben een subnet mask van `255.255.0.0` of zelf `255.0.0.0`. 

Wat zegt dat precies? Dat zegt eigenlijk hoeveel IP addressen (en dus devices) je je binnen jet netwerk kan gebruiken. Kleine hack: als we `192.168.2.0` als netwerk adres nemen met een subnetmask van `255.255.255.0` dan vertellen die eerste drie octeten van 255 eigenlijk dat de eerste drie octets van mijn netwerk IP nooit mogen veranderen. 

Dus: wat ik zelf beschikbaar heb zit alleen in het laatste stukje, in dit geval de `.0`. Het eerste stuk noemen ze dan het netwerk byt en het tweede stuk de host bit. En omdat `192.168.2.0` mijn netwerk adres en `192.168.2.1` is eigenlijk gereserveerd voor jouw router die met het de buitenwereld (WAN) moet spreken. `.192.168.2.255` is weer gereserveerd als broadcast address. Als je dat weet houden we dus 253 IP addressen over om te gebruiken. 

- **LAN**:
Local Area Network.
Een groep van devices op een fysieke locatie, vaak iets als een kantoor, thuis situatie etc. Ze staan aan elkaar geschakeld zodat ze ook gedeelde mappen/schijven kunnen hebben zodat niet op elke lokale machine een aparte kopie van dezelfde file (ppt, doc, etc) staat.  

- **CIDR notatie**:
Staat voor Classless Inter-Domain Routing en is een schema om IP addressen toe te wijzen. Het oude systeem had nog speciale Classes, maar toen CIDR om het hoekje kwam kijken is het een stuk efficienter geworden. 


## Opdracht
- Maak een netwerkarchitectuur die voldoet aan de volgende eisen:
    - 1 private subnet dat alleen van binnen het LAN bereikbaar is. Dit subnet moet minimaal 15 hosts kunnen plaatsen.
    - 1 private subnet dat internet toegang heeft via een NAT gateway. Dit subnet moet minimaal 30 hosts kunnen plaatsen (de 30 hosts is exclusief de NAT gateway).
    - 1 public subnet met een internet gateway. Dit subnet moet minimaal 5 hosts kunnen plaatsen (de 5 hosts is exclusief de internet gateway).
- Plaats de architectuur die je hebt gemaakt inclusief een korte uitleg in de Github repository die je met de learning coach hebt gedeeld.


### Gebruikte bronnen
- https://www.makeuseof.com/what-is-a-subnet-calculate/
- https://www.ipxo.com/blog/what-is-cidr/
- https://www.testpreptraining.com/blog/what-is-the-difference-between-public-and-private-subnet-in-aws/
- https://www.oreilly.com/library/view/designing-aws-environments/9781789535549/fa751615-4bb5-4d85-b1a7-00808ec69533.xhtml
- https://www.cisco.com/c/en/us/products/switches/what-is-a-lan-local-area-network.html
- https://serverfault.com/questions/556363/what-is-the-difference-between-a-public-and-private-subnet-in-a-amazon-vpc
- https://www.keycdn.com/support/what-is-cidr


### Ervaren problemen
Nog nooit iets met subnets te maken gehad dus dit was wel weer een aardige sprong in het diepe. Ik heb meerdere video's moeten kijken wat bijvoorbeeld bedoelt wordt met het network/host stukje, daar waren sommige video's ook niet altijd even duidelijk over. 



### Resultaat
[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]