# AZ-10 Virtual Network
[Geef een korte beschrijving van het onderwerp]

## Key-terms

- Point-to-site VPNs
- Site-to-site VPNs
- Azure Expressroute


UDR (User Defined Routing)


## Opdracht
### Opdracht 1:
Maak een Virtual Network met de volgende vereisten:
- Region: West Europe
- Name: Lab-VNet
- IP range: 10.0.0.0/16

- Vereisten voor subnet 1:
    - Name: Subnet-1
    - IP Range: 10.0.0.0/24
Dit subnet mag geen route naar het internet hebben

- Vereisten voor subnet 2:
    - Name: Subnet-2
    - IP Range: 10.0.1.0/24

### Opdracht 2:
- Maak een VM met de volgende vereisten:
Een apache server moet met de volgende custom data geïnstalleerd worden:

`#!/bin/bash
sudo su
apt update
apt install apache2 -y
ufw allow 'Apache'
systemctl enable apache2
systemctl restart apache2` 

- Er is geen SSH access nodig, wel HTTP
- Subnet: Subnet-2
- Public IP: Enabled
- Controleer of je website bereikbaar is



### Gebruikte bronnen
[Plaats hier de bronnen die je hebt gebruikt.]

### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]
