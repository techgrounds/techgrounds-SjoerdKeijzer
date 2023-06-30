
### Deployment setup

1. check subscription - als je al in goede sub bent ga verder, anders maak er een aan

2. log in met de goede az subscription. Check via:`az account list`. Mocht je heel veel sandboxes hebben is het wellicht om voor verwarring te voorkomen en `az account clear` te doen en daarna `az login`. Als er bij account list 1 account naar boven komt die klopt volstaat simpelweg `az login`. 

3. Nu we goed zijn ingelogd kunnen we in principe de bicep files deployen. Syntax hiervoor is: 
`az deployment sub create --name 'deploymentname' -f yourfilehere.bicep --location location`
en als we dat wat meer invullen gaan we echt deployen met:
`az deployment sub create --name 'appdeployment' -f ./main.bicep -l westeurope` 

4. profit



### Wat wil ik dat de biceps file doet

1. resource group aanmaken

2. netwerk infra aanmaken 

3. servers provisionen

4. database provisionen

5. ???

6. profit