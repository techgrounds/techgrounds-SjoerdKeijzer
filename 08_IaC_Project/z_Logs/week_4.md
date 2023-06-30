# Week 3 log overzicht

## 26/06 

### Dagverslag (1 zin)
Keyvault ongein deel 30000

### Obstakels
Blijf redeployment errors houden. 

### Oplossingen
Ik ga denk ik een timestamp met mijn keyvault naam meegeven zodat die altijd een unieke naam heeft. Ik kan omdat ik kennelijk 1x purge protection aan heb laten staan geen enkele andere oude keyvault in softretention meer purgen. 

Timestamp meegeven met naam en nu werkt het als een zonnetje. 

### Learnings
Modern problems require modern solutions.jpeg
____

## 27/06 

### Dagverslag (1 zin)
Probeer RBAC acces

### Obstakels
Ik zag in mijn keyvault research, dat accespolicies eigenlijk legacy zijn en RBAC authorisatie de best practice is. Laten we dat dan maar proberen te implementeren. Dat betekent wel dat ik me moet inlezen hoe dat zit. 

### Oplossingen
Niet heel verrassend maar RBAC auth aan en acces policies uit dan snapt de redeployment van de keyvault het niet. Ik moet mezelf op een of andere manier natuurlijk toegang verschaffen. 

### Learnings
Omdat ik keyvault troubleshooten even zat was, geprobeerd om met RDP in te loggen op mijn adminserver. Dat werkt, dus dat is toch een mooi resultaat. 
____

## 28/06 


### Dagverslag (1 zin)
RBAC is helemaal niet mogelijk. 

### Obstakels
Om RBAC toe te passen op de keyvault moet ik role assignments maken, maar dat kan helemaal niet. In onze techgrounds AZ AD hebben de deelnemers de rechten van 'Contributor' en die mag geen RBAC role assignements maken. Einde verhaal dus, RBAC kunnen we vergeten. Weer terug naar acces policies.

### Oplossingen
terug naar acces policies

### Learnings
Ondanks dat het vervelend troubleshooten was, wel blij dat duidelijk naar voren was wat het probleem was (rechten) en dus meteen duidelijk was dat ik met acces policies verder moest. 
____

## 29/06 

### Dagverslag (1 zin)
Keyvault settled. 

### Obstakels
Na ongeveer een week bezig te zijn met fatsoenlijk configureren van de keyvault is het nu gelukt. Nu volgende stap is disk encryption. Heb het half werkend. Set aanmaken is niet zo moeilijk, maar moet nu de params goed instellen bij de juiste plekken bij OSdisk op mijn webserver en adminserver module. 

### Oplossingen
Uiteindelijk vrij simpel maar goed, dan moet je het wel weten. OSDISK> encryptie set en dan de id van de diskencryptionset.

### Learnings
Er komt licht aan het einde van de tunnel. 
____

## 30/06 

### Dagverslag (1 zin)
 

### Obstakels


### Oplossingen


### Learnings
