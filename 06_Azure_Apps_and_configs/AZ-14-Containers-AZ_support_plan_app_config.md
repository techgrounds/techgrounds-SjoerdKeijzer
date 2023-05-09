# AZ-14 Week 6 Theorie | Containers, AZ support plans, AZ advisor, AZ App config, AZ Activity Log
[Geef een korte beschrijving van het onderwerp]

## Key-terms

### **Container**: 
Wat nou als we een applicatie gewoon in een aparte omgeving zetten en alle dependancies goed regelen? Hoeven we niet een hele VM voor op te tuigen en te onderhouden. Handiiiiiig. 

 A container is a sandboxed process on your machine that is isolated from all other processes on the host machine. 
 
 Multiple containers can run on the same machine and share the OS kernel with other containers, each running as isolated processes in user space. Containers take up less space than VMs (container images are typically tens of MBs in size), can handle more applications and require fewer VMs and Operating systems.
 
  To summarize, a container:

- Is a runnable instance of an image. You can create, start, stop, move, or delete a container using the DockerAPI or CLI.
- Can be run on local machines, virtual machines or deployed to the cloud.
Is portable (can be run on any OS).
- Is isolated from other containers and runs its own software, binaries, and configurations.

### **Azure Support Plans**

<insert plaatje hier>



### **Azure Advisor**
Advisor is een handige tool om op een low-key manier dingen te verbeteren. Advisor scanned op mogelijk verbeteringen, mocht dat efficiency of cost management zijn. Met een eenvoudig dashboard kan je in een paar kliks de recommendations toepassen, uitstellen of negeren. Je hoeft ook niet door te klikken op de individuele componenten. 

### **Azure App Configuration**
Azure App Configuration provides a service to **centrally manage application settings and feature flags**. Modern programs, especially programs running in a cloud, generally have many components that are distributed in nature. Spreading configuration settings across these components can lead to hard-to-troubleshoot errors during an application deployment. **Use App Configuration to store all the settings for your application and secure their accesses** in one place.


### **Azure Activity Log**
The Azure Monitor activity log is a platform log in Azure that provides insight into subscription-level events. The activity log includes information like when a resource is modified or a virtual machine is started. You can view the activity log in the Azure portal or retrieve entries with PowerShell and the Azure CLI.

You can access the activity log from most menus in the Azure portal. The menu that you open it from determines its initial filter. If you open it from the Monitor menu, the only filter is on the subscription. If you open it from a resource's menu, the filter is set to that resource. You can always change the filter to view all other entries. 


## Opdracht
Vragen voor theoretisch onderzoek:
Waar is X voor?
Hoe past X / vervangt X in een on-premises setting?
Hoe kan ik X combineren met andere diensten?
Wat is het verschil tussen X en andere gelijksoortige diensten?

- Containers					
- Azure Support Plans				
- Azure Advisor					
- Azure App Configuration			
- Azure Activity Log

### Gebruikte bronnen
- https://www.docker.com/resources/what-container/
- https://docs.docker.com/get-started/#:~:text=Simply%20put%2C%20a%20container%20is,approachable%20and%20easy%20to%20use.
- https://azure.microsoft.com/en-us/products/advisor
- https://learn.microsoft.com/en-us/azure/azure-app-configuration/overview
- https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/activity-log?tabs=powershell
- https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/activity-log-schema#categories


### Ervaren problemen
Grootste uitdaging was om niet in de container rabbit hole te vallen. Heel interessant, maar er valt ook heel veel over te leren. Dat heb ik nog niet allemaal nodig bij mijn AZ-900 though. 

### Resultaat
Zie key terms. 