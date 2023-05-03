# AZ-12 Well Architected Framework
Alles begint bij het begin. Vooral een goed uitgedacht begin. 

## Key-terms
De hele opdracht draait hierom en het is een aardige berg theorie. 

Gelukkig hebben we voor de theorie een bruggetje: **CROPS**. De rest volgt in het Engels want dat is wat makkelijker examen stof oefenen en begrijpen. 

___

## **Cost optimization**:
With what we learned so far this seems pretty straight forward. Keep in mind the following though:

- **Develop a cost model**
- **Create budgets and alerts**
- Use a **[savings plan](https://learn.microsoft.com/en-us/azure/cost-management-billing/savings-plan/) for high dynamic workloads**.
- For **predicitable workloads** you can opt to use [Azure reservations](https://learn.microsoft.com/en-us/azure/cost-management-billing/reservations/save-compute-costs-reservations).
- **Have a scale-in and scale-out policy**. Increasing customer base shouldn't require more investment in infrastructure. Conversely, if demand drops, scale-down unused resources. 
- In general, **review the underutilized resources**. Resize or shutdown appropriately. 
- For discount prices, you can use Azure Reservations or Azure [Hybrid Benefit](https://azure.microsoft.com/en-us/pricing/hybrid-benefit/).
- **Reevaluate design choices**.Analyze the cost reports and forecast the capacity needs. You might need to change some design choices. Some sub choices may involve:
    - **Choose the right storage tier**. Consider using hot, cool, and archive tiers for storage account data. Storage accounts can provide automated tiering and lifecycle management.
    - **Choose the right data store**. Instead of using one data store service, use a mix of data store depending on the type of data you need to store for each workload. 
    - **Choose Spot VMs for low priority workloads**. Spot VMs are ideal for workloads that can be interrupted, such as highly parallel batch processing jobs.
    - **Optimize data transfer**. Only deploy to multiple regions if your service levels require it for either availability or geo-distribution. Data going out of Azure data centers can add cost because pricing is based on billing zones.
    - Reduce load on servers. **Use Azure Content Delivery Network (CDN) and caching service** to reduce load on front-end servers. Caching is suitable for servers that are continually rendering dynamic content that doesn't change frequently.
    - **Use managed services.** Measure the cost of maintaining infrastructure and replace it with Azure platform as a service **(PaaS**) or software as a service **(SaaS)** services.

___
## **Reliability**:
In my own words I would say: in order to make sure that you yourself can maintain a high SLA performance, you need to think about the resiliency of the architecture framework. 

Through regions, region pairs and availability zones and cross region support you already can build in a lot of reliability for your systems, to make sure your RPO or RTO is very little to none.

Make sure to think about single points of failure. If you have a single firewall between multiple servers an a load balancer(s), that might be a bottleneck. 

If we translate that roughtly into bulletpoints:
- **Design for Business/Application requirements**. For example, a mission-critical application with a 99.999% service level agreement (SLA) requires a higher level of reliability than another application with an SLA of 95%.In addition, cost implications are inevitable when introducing greater reliability and high availability. This trade-off should be carefully considered.
- **Design for failure**. By anticipating failures, from individual components (switches, racks, cables) to entire Azure regions, you can develop a solution in a resilient way to increase reliability.
- **Observe application health**. By monitoring the operation of an application relative to a healthy state, you can detect and predict reliability issues. So in non-corpo speak: if your application is getting clogged up or slow, monitor and analyse the culprits and take action. And preferably see the trend happening and take action *before* the application actually is getting clogged up. 
- **Drive automation**. 
Humans make errors, it's ment to happen sooner than later. One of the leading causes of application downtime is human error due to the deployment of insufficiently tested software or through misconfiguration.
To minimize this, it's vital to strive for automation in all aspects of a cloud solution. Assuming your scripts or configs are not riddled with errors by humans, automation improves:
    - Reliability
    - Automated testing
    - Deployment
    - Management

- **Design for self-healing**. Restoration healing skill for computers? Are we wizards now, Harry? Sort of. Self-healing describes the ability of a system to deal with failures automatically. Handling failures happens through pre-defined remediation protocols. These protocols connect to failure modes within the solution. 
In other words: have an automated alternative for a certain failure, so business can continue as usual. Don't have a possible single point of failure because that is asking for trouble sooner or later. 

- **Design for scale-out (horizontal scaling)**:
Through scale units, a system can handle expected and unexpected traffic increases, essential to overall reliability.
Scale units further reduce the effects of a single resource failure.

___

## **Operational excellence**:






- ## **Performance efficiency**:

- ## **Security**:
As a Cloud Engineer you will need to take several security principles into account. This means make use of;

- Make use of IAM (Identity and Access Management) through Multi-Factor Authentication (MFA) and ARBAC (Azure Role Based Acces Control).  
    - Make use of principle of least privilege. 

   





## Opdracht
Bestudeer: 
- Well-Architected Framework van Azure
- Hoe je elke pilaar kan implementeren met cloud-diensten


### Gebruikte bronnen
- [John Savill over Well Architected Framework basics](https://www.youtube.com/watch?v=lQlHWacM1N0)
- https://learn.microsoft.com/en-us/azure/well-architected/
- https://learn.microsoft.com/en-us/azure/well-architected/#cost-optimization


### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
Ik denk dat de termen al redelijk voor zich spreken, maar het is fijn om wat video's er over te kijken om het beter te snappen in het grotere geheel. Ik blijf het zeggen maar John Savill is echt een topgozer voor het uitleggen van Azure dingen. 