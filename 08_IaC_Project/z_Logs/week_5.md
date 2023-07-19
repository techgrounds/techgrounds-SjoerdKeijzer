# Week 5 log overzicht

## 03/07 

### Dagverslag (1 zin)
Nieuwe requirements van V1.1

### Obstakels
Uitvinden van wat we moeten doen

### Oplossingen
Oplossingen zoeken voor de requirements

### Learnings
/

____

## 04/07

### Dagverslag (1 zin)
V1.1 voorwaarts mars

### Obstakels
Uitpluizen van de requirements

### Oplossingen
Als groep hadden we snel door dat voor veel van de vereisten we een application gateway konden gebruiken en dat we een VMSS met autoscaling konden gebruiken. Daar konden we dan al research op doen en alvast wat opzetjes maken.

### Learnings
Ik vond eigenlijk dat we dit als groep super snel oppakte, dus kudos aan ons. 
____

## 05/07


### Dagverslag (1 zin)
Gateway is wel een **** ding 

### Obstakels
Application gateway heeft zo veel configuratie mogelijkheden dat ik er bijna duizelig van wordt. Het is goed uitzoeken welke settings ik nou precies nodig heb. Troubleshooten van sommige errors is daardoor ook wat lastig. 

### Oplossingen
Besloten me eerst te richten op VMSS omdat ik die al ken van een eerdere opdracht. Met beetje geluk kan VMSS in aparte module doen en gateway in de andere, dat lijkt me heel tof als ik dat voor elkaar krijg. 

### Learnings
Tijd gaat ons leren of het wellicht toch niet gewoon makkelijk is om VMSS + gateway in een module te zetten.
____

## 06/07

### Dagverslag (1 zin)
Another day on the (gate)way.

### Obstakels
Ik heb mijn VMSS settings volgens mij goed staan, maar blijf deployment errors krijgen, bijvoorbeeld dat ik nog een outbound connectie mis.  

### Oplossingen
Ik zou een NAT gateway voor mijn VMSS kunnen inzetten en mijn Application Gateway als loadbalancer gebruiken. Maar ik heb nu al moeite met AGW configureren. Hoe moet dat dan met een NAT gateway? 

In de Azure portal de AGW nagemaakt. Die is wel afhankelijk van een backpool (VMSS) om te succesvol te kunnen draaien. Mischien voor de handigheid toch maar VMSS bij de gateway in 1 module zetten.  

### Learnings
Het kan waarschijnlijk wel de moeilijke weg, maar dat kan ik op dit moment niet overzien. Ik ga voor vmss + AGW in 1 module. Zit ik ook niet te veel te klooien met dependencies. 
____

## 07/07 

### Dagverslag (1 zin)
Meer van hetzelfde

### Obstakels
Krijg wel steeds andere errors, dus er zit wel schot in, maar dat het nooit op lijkt te houden is soms wel frustrerend. 

### Oplossingen
Denk dat ik de VMSS settings nu wel goed heb staan, moet alleen de gateway pools en configs goed configureren dat ik wat verder kom. 

### Learnings
Elk stapje is er eentje. 