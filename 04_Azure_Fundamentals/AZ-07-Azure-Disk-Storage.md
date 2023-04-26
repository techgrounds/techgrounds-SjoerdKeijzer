# AZ-07 Azure Disk Storage
All the disks!

## Key-terms
**OS-disk**: Ook wel system disk genoemd, waar het systeem oftewel Operating System (OS) op staat.

**Data disk**: Meestal een externe harde schijf of USB drive. Data disk zijn over het algemeen ook groter dan OS-disks en worden daarom ook gebruikt om user data als documenten,foto's, muziek en videos op te slaan. Ze zijn wel wat langzamer dan system disks omdat ze gebruikt worden voor user data en niet systeem bestanden. 

Voordelen om dus zowel OS-disk als data disk te hebben dat je systeem bestanden op 1 disk staat die snel kan handelen en alle user bestanden staan op de data disk die groter is, maar iets langzamer (maar dat is niet erg). 

**Managed vs Unmanaged disks**:



**(Incremental) Snapshot**:

**Type disks**:


## Opdracht
- Start 2 Linux VMs. Zorgt dat je voor beide toegang hebt via SSH.
- Maak een Azure Managed Disk aan en koppel deze aan beide VMs tegelijk.
- Creëer op je eerste machine een bestand en plaats deze op de Shared Disk.
- Kijk op de tweede machine of je het bestand kan lezen.
- Maak een snapshot van de schijf en probeer hier een nieuwe Disk mee te maken
- Mount deze nieuwe Disk en bekijk het bestand. 



### Gebruikte bronnen
- https://docs.microsoft.com/en-us/azure/virtual-machines/disks-types
- https://www.alibabacloud.com/tech-news/data-disk/cd-what-is-the-difference-between-a-system-disk-and-a-data-disk#:~:text=System%20disks%20and%20data%20disks%20are%20two%20types%20of%20disks,on%20the%20main%20hard%20drive.
- https://learn.microsoft.com/en-us/answers/questions/3619/what-is-the-difference-between-managed-disk-and-un
- https://learn.microsoft.com/en-us/azure/virtual-machines/linux/attach-disk-portal?tabs=ubuntu
- https://learn.microsoft.com/en-us/azure/virtual-machines/disks-shared



### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
2 Linux VM's gemaakt. VirtualMaarten en VirtualJaap. 

![Alt text](../00_includes/AZ-07_virtualMaarten.png)

![Alt text](../00_includes/AZ-07_virtual_jaap.png)

