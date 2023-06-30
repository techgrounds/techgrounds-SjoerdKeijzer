# Week 3 log overzicht

## 19/06 

### Dagverslag (1 zin)
Begin aan vm's gemaakt

### Obstakels
Wat heb je precies nodig? Net gehoord van de PO dat adminserver een windowsserver moest zijn. Research doen naar sku mogelijkheden en vm sizes en what not 

### Oplossingen
Op learn microsoft pages en azure vm's opgezocht welke sku's/sizes ik allemaal tot mijn beschikking heb.


### Learnings
De 'vroege' ontdekking dat we 1 windows en 1 linux server vm als server gaan aanmaken schept wel duidelijkheid en is fijn om gericht onderzoek mee te doen. 
____

## 20/06 

### Dagverslag (1 zin)
VM's gedeployed en ze werken.

### Obstakels
Peering nog beetje mee puzzelen. Omdat ik peering in aparte module maak heb ik nic en vnetnaam outputs nodig van mijn network module. 

### Oplossingen
/

### Learnings
Documentatie doornemen. Kijken wat er bij testdeployments fout gaat. Kijken wat de settings in de portal zijn als het wel succesvol deployed. 
____

## 21/06 

### Dagverslag (1 zin)
Begin aan keyvault

### Obstakels
Het principe snap ik dat je er geheimen, sleutels en certs in kan op slaan maar hoe dit nou precies in zijn werk gaat vind ik nogal vaag. Proper aan de hand van microsoft quickstart template alvast wat door te nemen maar ik vind het maar ingewikkeld. 

### Oplossingen
Peering probleem van gisteren opgelost. Keyvault documentatie en quickstart template stap voor stap doornemen. 

### Learnings
Nog niet super veel.
____

## 22/06 

### Dagverslag (1 zin)
Keyvault doet vervelend. 

### Obstakels
Krijg steeds andere errors met betrekking tot Keyvault. Het moet een unieke naam hebben (ok fair). Als je al een keyvault ook gedeployed hebt en gedelete, komt die in softdeletion en moet je 'em daarna purgen. Stomme is, als je steeds dezelfde resource group gebruikt dan blijft de 'unique string/resource group' ook hetzeflde. Moet ik nog iets voor verzinnen. 

### Oplossingen
Mogelijk een array met andere resourcegroup namen, maar ik heb liever eigenlijk dat de naam van de Keyvault echt uniek is. 

### Learnings
Keyvault meerdere malen her of redeployen daar is die eigenlijk niet voor bedoelt. 
____

## 23/06 

### Dagverslag (1 zin)
Keyvault struggles. 

### Obstakels
Blijf steeds andere errors krijgen. 

### Oplossingen
Stapje voor stapje troubleshooten. Op een gegeven moment ook wel mijn aandacht verlegd naar diskencryption set. Die moet er tenslotte toch in komen, dus ben daar de documentatie over in gedoken.

### Learnings
/