# OSI en TCP stack
Netwerk protocollen/stacks en waarom we met name deze twee gebruiken.

## Key-terms

### **TCP**
TCP staat voor Transmission Control Protocol en wordt gebruikt om data tussen verschillende netwerken te verschepen.  Het hakt  de informatie in pakketjes voordat hij deze naar de eindbestemming verscheept. Vergeleken met andere netwerk protocollen, is TCP bijzonder betrouwbaar. 

### **OSI**
Open System Interconnection (OSI) is een concept methode gebaseerd op netwerk communicatie type. 

### **socket(s)**
later meer

### **SSL aka Secure Sockets Layer**
later meer

## Opdracht
Study:
- The OSI model and its uses.
- The TCP/IP model and its uses.


## Gebruikte bronnen
- [NetworkChuck - What is TCP/IP and OSI](https://www.youtube.com/watch?v=CRdL1PcherM)
- https://www.hostinger.com/tutorials/tcp-protocol
- https://www.fortinet.com/resources/cyberglossary/tcp-ip


## Ervaren problemen
Ik wist al van het bestaan van OSI/TCP, maar ik moest me nog wel inlezen wat de protocollen nou precies doen. Dat roept dan natuurlijk ook meer vragen op, bijvoorbeeld wat de functie nou precies is van sockets.

## Resultaat
TCP/IP gebruikt 4 layers en staat bekend als bijzonder betrouwbaar.

Dat betrouwbaar komt voort uit het feit dat TCP data inpakt als  pakketjes aka packets en deze door elke layer stuurt om de eindbestemming te bereiken. Omdat het in packets wordt gestuurd kan er een omweg worden genomen door bepaalde packets als er ergens een path druk of vol is. 

Het IP deel gebruikt een zogenoemde 'three-way handshake- methode wanneer de connectie wordt gemaakt, om te zorgen dat het verschillende sockets in beide richtingen kan versturen. 

Zowel het apparaat (device) als server moet wel synchroniseren en de packets toestaan voordat de TCP sockets verder kunnen. 

TCP/IP is heel belangrijk aangezien bijvoorbeeld HTTP en HTTPS van TCP protocol gebruik maken. 

OSI bestaat uit 7 lagen waarvan er de nodige over een komen met de TCP stack. 

![networkchuck](../00_includes/NTW-01_osi%20stack_vs_tcp_stack.png) 

Ik vond deze video van NetworkChuck het heel goed illustreren. 
Grappig dingetje dat kennelijk Network Engineers de application layer altijd layer 7 noemen, maakt niet uit welke stack je gebruikt. 