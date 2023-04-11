# OSI en TCP stack
Netwerk protocollen/stacks en waarom we met name deze twee gebruiken.

## Key-terms

### **TCP**
TCP staat voor Transmission Control Protocol en wordt gebruikt om data tussen verschillende netwerken te verschepen.  Het hakt  de informatie in pakketjes voordat hij deze naar de eindbestemming verscheept. Vergeleken met andere netwerk protocollen (hoi UDP), is TCP bijzonder betrouwbaar. 

### **OSI**
Open System Interconnection (OSI) is een concept methode gebaseerd op netwerk communicatie type. 

### **socket(s)**
Zowel het vertrekpunt als landingpunt tussen twee verbindingen. 

### **SSL aka Secure Sockets Layer en TLS**
Protocollen die helpen bij beschermen van privacy binnen een netwerk. SSL is de oude en TLS de nieuwe versie. TCP/IP client en server toepassing gebruiken het SSL/TLS protocol zodat ze berichten/data kunnen versturen die versleuteld worden, de intergriteit van de packets worden gechecked en een verificatie check wordt gedaan. 

## Opdracht
Study:
- The OSI model and its uses.
- The TCP/IP model and its uses.


## Gebruikte bronnen
- [NetworkChuck - What is TCP/IP and OSI](https://www.youtube.com/watch?v=CRdL1PcherM)
- https://www.hostinger.com/tutorials/tcp-protocol
- https://www.fortinet.com/resources/cyberglossary/tcp-ip
- https://www.geeksforgeeks.org/socket-in-computer-network/
- https://www.ibm.com/docs/nl/i/7.2?topic=concepts-secure-sockets-layer-transport-layer-security
- https://www.geeksforgeeks.org/secure-socket-layer-ssl/



## Ervaren problemen
Ik wist al van het bestaan van OSI/TCP, maar ik moest me nog wel inlezen wat de protocollen nou precies doen. Dat roept dan natuurlijk ook meer vragen op, bijvoorbeeld wat de functie nou precies is van sockets.

## Resultaat
TCP/IP gebruikt 5 layers en staat bekend als bijzonder betrouwbaar.

OSI bestaat uit 7 lagen waarvan er de nodige over een komen met de TCP stack. OSI wordt vooral gebruikt om problemen te troubleshooten want er blijft ook nog wel eens een programma hangen in layer 5 (Session layer). 

![networkchuck](../00_includes/NTW-01_osi%20stack_vs_tcp_stack.png) 

Ik vond deze video van NetworkChuck het heel goed illustreren. 
Grappig dingetje dat kennelijk Network Engineers de application layer altijd layer 7 noemen, maakt niet uit welke stack je gebruikt. 