
## User story: welke diensten hebben we nodig
### Als team willen wij duidelijk hebben welke diensten we nodig hebben


- Azure storage account | (+ blob container voor post-deployment script?) 
- Azure virtual network | vnet voor de VM's (met daarin NSG's)
- Azure Virtual Machines | VM voor de webserver en mgmt server 
- Azure SQL database | als back-end DB voor de webserver
- Azure disk encryption | voor .. het encrypten van disks
- Azure Back-up  of Recovery vault | voor daily back-ups webserver

- SSH connectie naar mgmt server? NSG alleen configuren of doen via Azure Bastion maybe? Uitkomst: RDP naar adminserver en met SSH naar scale set instances vanwege vereisten. 
