# AZ-11 Azure Load Balancer (ALB) en Auto Scaling
[Geef een korte beschrijving van het onderwerp]

## Key-terms
### **(Azure) Load Balancer**:

### **Autoscaling**:
Het principe in de Cloud dat je on-demand kan scalen. Dit geld zowel voor upscalen als er meer capaciteit nodig is, als downscalen tijdens dal uren voor gebruik. 

### **VM scale set**:
Met meerdere VM's gebruik je een image (blauwdruk/preset) bij het configureren zodat alle VM's binnen de scale set gelijk zijn. Dit kan eventueel naar wens nog worden aangepast met een reimage optie. In Azure maakt autoscaling gebruik van de tool Azure Monitor om te bepalen of er VM's bij of verwijderd moeten worden. 


## Opdracht
Maak een Virtual Machine Scale Set met de volgende vereisten:
- Ubuntu Server 20.04 LTS - Gen1
- Size: Standard_B1ls
- Allowed inbound ports:
- SSH (22)
- HTTP (80)
- OS Disk type: Standard SSD
- Networking: defaults
- Boot diagnostics zijn niet nodig
- Custom data:

`#!/bin/bash
sudo su
apt update
apt install apache2 -y
ufw allow 'Apache'
systemctl enable apache2
systemctl restart apache2`

- Initial Instance Count: 2
- Scaling Policy: Custom
- Aantal VMs: minimaal 1 en maximaal 4
- Voeg een VM toe bij 75% CPU gebruik
- Verwijder een VM bij 30% CPU gebruik



### Gebruikte bronnen
[Plaats hier de bronnen die je hebt gebruikt.]

### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]