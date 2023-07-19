## Wat doet deze IaC?
Deze Infrastructure as Code deployt een application in een (1) resourcegroup. De resource group wordt meteen bij het deployen aangemaakt. Dat zelfde geldt voor de locatie. In deze documentatie lopen we er stap voor stap doorheen.

## Vereisten / Prerequisites
Voor deze deployment maken we gebruik van de [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli). Zorg ervoor dat je de laatste versie hiervan hebt. 

## Deployment setup
1. Check subscription - als je al in goede Azure subscription bent ga verder, anders maak er eentje aan. 

2. Mocht je meerdere subscriptions of Azure/Microsoft accounts hebben: Log in met de goede az subscription. Check via: 

`az account list` 

Mocht je heel veel sandboxes hebben is het wellicht handig om voor verwarring te voorkomen en 

`az account clear` te doen en daarna `az login`. 

Als er bij `az account list` 1 account naar boven komt die klopt volstaat simpelweg

 `az login`. 

3. Nu we goed zijn ingelogd kunnen we in principe de bicep files deployen.

Let wel op dat je in de goede map staat waar je de main.bicep file kan aanroepen. 
Om te navigeren naar de goede map gebruik `cd mapnaam` en als je niet zeker weet of de main.bicep file hier instaat kan je kijken met `ls` om de inhoud te listen in de console. 

## Deployment
Deployment start met de volgende lijn code: 

`az deployment sub create --name 'appdeployment' -f ./main.bicep -l uksouth`

Dit zorgt ervoor dat de application in de Azure Regio Uksouth wordt gedeployt. Wil je naar andere locatie deployen? Zoek naar wens via 

`az account list-locations --output table`. 

4. De code gaat nu lopen. Je krijgt nog een prompt in de console voor het wachtwoord van het SSL certificaat. Vul hier `1234` in.

5. Code gaat verder en de daadwerkelijke deployment wordt nu gestart. 
