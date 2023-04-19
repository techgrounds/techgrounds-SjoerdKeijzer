# SEc-07 Public Key Instrastructure and Certificates
[Geef een korte beschrijving van het onderwerp]

## Key-terms
### **PKI**: 
Public Key Infrastructure. PKI gebruikt cryptografische public keys, die gepaired zijn aan een digitaal certificaat, welke het apparaat of gebruiker authenticeert. 

### **Digital Certificate**:
Digital certificates zijn uitgegeven door een trusted source, een **certificate authority (CA)** en op die manier zijn ze een soort digitaal paspoort; de zender kan geverifieerd worden. 

### **Registration authority (RA)**:
De RA verifieert de identiteit van de user of apparaat die het digitaal certificaat opvraagt. Dit kan een derde partij zijn, maar ook de CA kan optreden als de RA. 

### **X 509**:
is een standaardformaat voor certificaten met openbare sleutel, digitale documenten die cryptografische sleutelparen veilig koppelen aan identiteiten zoals websites, individuen of organisaties.

Ongeacht de beoogde toepassing(en), elk X.509-certificaat bevat een; publieke sleutel, digitale handtekeningen 
 en informatie over zowel de identiteit die aan het certificaat is gekoppeld even als de afgifte ervan certificeringsinstantie (CA).

De publieke sleutel maakt deel uit van een sleutelpaar dat ook een privé sleutel omvat. De privésleutel wordt veilig bewaard en de openbare sleutel is opgenomen in het certificaat. Dit staat de eigenaar van de privésleutel toe om documenten digitaal te ondertekenen; deze handtekeningen kunnen worden geverifieerd door iedereen met de bijbehorende openbare sleutel.
Hiermee kunnen derden berichten verzenden die zijn versleuteld met de openbare sleutel en die alleen de eigenaar van de persoonlijke sleutel kan ontsleutelen.

Een digitale handtekening is een gecodeerde hash (digest met vaste lengte) van een document dat is gecodeerd met een privésleutel. Wanneer een X.509-certificaat is ondertekend door een publiekelijk vertrouwde CA, zoals SSL.com, kan het certificaat door een derde partij worden gebruikt om de identiteit van de entiteit die het presenteert te verifiëren.

Elk X.509-certificaat bevat velden die de onderwerpen, afgevende CA, en andere vereiste informatie zoals het certificaat versie en  geldigheidsduur. Bovendien bevatten v3-certificaten een set van extensies die eigenschappen definiëren zoals acceptabel sleutelgebruik en aanvullende identiteiten om een ​​sleutelpaar aan te binden.

### **SSL**:
Secure Sockets Layer. Er wordt een beveiligde laag geplaatst tussen een server en een internet browser/andere server waardoor de gegevens beveiligd worden.

SSL certificaten maken gebruik van het https-protocol van de browser (via poort 443) wat de beveiligde verbinding tot stand brengt. Daardoor is (een gedeelte van) de website ook alleen via https:// te bereiken op het internet.


### **TLS**:


## Opdracht
- Create a self-signed certificate on your VM.
- Analyze some certification paths of known websites (ex. techgrounds.nl / google.com / ing.nl).
- Find the list of trusted certificate roots on your system (bonus points if you also find it in your VM).


### Gebruikte bronnen
- https://en.wikipedia.org/wiki/Public_key_infrastructure
- https://www.okta.com/identity-101/public-key-infrastructure/
- https://www.freecodecamp.org/news/openssl-command-cheatsheet-b441be1e8c4a/#b723
- https://www.ssl.com/nl/veelgestelde-vragen/wat-is-een-x-509-certificaat/
- https://www.domeinwinkel.nl/blog/2016/03/30/wat-is-een-ssl-certificaat/


### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
- Create a self-signed certificate on your VM.


- Analyze some certification paths of known websites (ex. techgrounds.nl / google.com / ing.nl).

![TG](../00_includes/SEC-06_cert_techgrounds.png)


![ING](../00_includes/SEC-06_cert_ING.png)

![Google](../00_includes/SEC06_cert_google.png)



- Find the list of trusted certificate roots on your system (bonus points if you also find it in your VM).