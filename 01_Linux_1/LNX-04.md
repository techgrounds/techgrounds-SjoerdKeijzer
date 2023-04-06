# LNX-04 nieuwe user & permissions
Aan maken van nieuwe user en deze de juiste rechten geven en aan juiste groep(s) toewijzen.

## Key-terms
sudo 

useradd
passwd
usermod

/etc/

## Opdracht
- Create a new user in your VM. 
- The new user should be part of an admin group.
- The new user should have a password.
- The new user should be able to use ‘sudo’
- Locate the files that store users, passwords, and groups. See if you can find your newly created user’s data in there.


### Gebruikte bronnen
- https://linuxize.com/post/how-to-create-users-in-linux-using-the-useradd-command/?utm_content=cmp-true
- https://www.howtogeek.com/50787/add-a-user-to-a-group-or-second-group-on-linux/
- https://www.redhat.com/sysadmin/linux-groups

### Ervaren problemen
Er zijn natuurlijk verschillende wegen naar Rome om een user aan te maken. -aG schijnt ook te kunnen bijvoorbeeld, maar omdat PowerShell verder niet moeilijk deed over -a -G die ik van een van de bronnen heb, heb ik het bij -a -G gelaten. Het was nog wel even zoeken waar precies de groupen in de mappen structuur stonden, maar gelukkig vrij snel achter gekomen dat dit in /etc/ was. De rest ging vrij soepel. 

Ben hier heel blij mee want na de afgelopen dagen had ik echt het gevoel dat ik er niks van kon. 

### Resultaat
![new user]()