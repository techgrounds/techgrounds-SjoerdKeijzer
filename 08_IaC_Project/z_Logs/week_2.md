# Week 2 log overzicht

## 12/06 

### Dagverslag (1 zin)
Wel iets gedeployed maar niks in az portal

### Obstakels
Ik wil ipv de sandbox portal, iets in de TG portal deployen. Ik zie in de AZ cli wel dat ik een resource group heb gedeployed, maar zie niks terug in mijn TG portal. Via de cli de resource group ook maar gedelete. Troubleshooten en opnieuw beginnen. 

### Oplossingen
Niet echt behalve zorgvuldig analyseren. Het zit em denk ik ergens in de subs en account settings. Als ik dit eenmaal heb gefixed dan weet ik dat het deployen vanzelf goed gaat. 

### Learnings
Voor nu dit even parkeren en verder met bicep leren zodat ik incremental later dingen toe kan voegen. Morgen maar opnieuw proberen om iets in de TG portal te krijgen. 
____________

## 13/06


### Dagverslag (1 zin)
Prutsen met Bicep continues

### Obstakels
Ik had mezelf uit mijn Az portal gesloten door eerst mijn wachtwoord te vergeten en daarna op 'forget password' te klikken ipv 'reset password'. Met tussenkomst van Casper uiteindelijk temp ww gekregen om zo weer nieuwe aan te maken. Heb het deployen maar even gelaten voor wat het is. 

### Oplossingen
In plaats van me weer op de troubleshoot muur te storten ben ik wat dieper Bicep in gedoken en alvast geprobeerd om alvast wat netwerk parameters in mijn test.bicep te schrijven. 

### Learnings
Op andere dingen voortgang gemaakt ipv vast te loop op het ene issue.  
_____________

## 14/06


### Dagverslag (1 zin)
Eindelijk gelukt.

### Obstakels
Na het legen van mijn cache in mijn browser heb ik toch de deployment kunnen zien, dus alles was gewoon goed voorheen. 
Ander obstakel was dat bij het proberen te deployen van een storage account ik steeds een targetScope error kreeg. 

### Oplossingen
Oplossing van die targetScope error was door de storage account te deployen in een andere module die wordt aangeroepen vanaf de main.bicep en in de storage.bicep targetScope='resourceGroup' van te maken.
Het kan soms zo simpel zijn.

### Learnings
Zie bovenstaand. 
___

## 15/06


### Dagverslag (1 zin)
Verdere deployments gedaan

### Obstakels
vnets gemaakt, main.bicep test gedeployed. Storage account en vnets prima gemaakt, alleen subnet waren onderdeel van de vnets en zag geen nsg's staan. 

Vervolgens geprobeerd om nsg's toe te voegen, maar daar kreeg ik dan weer allerlei errors van. Vervolgens eigenlijk heel de dag getroubleshoot hoe dit goed te passen

### Oplossingen
Krijg wel steeds andere deployment errors, dus wat dat betreft zit er schot in

### Learnings
Blijven troubleshooten maar het wel timeboxen. 
____

## 16/06


### Dagverslag (1 zin)


### Obstakels


### Oplossingen


### Learnings

____