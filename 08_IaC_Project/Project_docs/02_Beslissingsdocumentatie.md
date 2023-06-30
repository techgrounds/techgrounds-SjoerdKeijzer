

- VM scale set vs AZ app service? VM scale set want goedkoper in initiele kosten. Wel meer mogelijk om te configuren en dus ook qua onderhoud en downtime minputen, maar goed. 
-> wordt scale set omdat je meer zelf kan configureren

- Incoming data zelfde encryptie als data at rest? PO: Zolang het aan de veiligheidsstandaarden voldoet. 
-> data encryptie met encryptionsets voor disks en daarnaast versleutelde storage account

- **Access control**: With infrastructure-as-code deployments, you have the option of using managed identities or service accounts to automate resource provisioning. This process ensures that cloud resources are modified only by these identities. It also helps prevent incorrect configurations deployed to production. If necessary, you can override this process by using an emergency access account (often called a break glass account) or by using the Azure Active Directory Privileged Identity Management feature.
-> acces control door middel van acces policies en managed id want we konden niet met RBAC werken door AZ AD restricties in de AD constructie van Techgrounds (Contributor role). 