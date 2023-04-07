# LNX-07 Bash scripting
[Geef een korte beschrijving van het onderwerp]

## Key-terms

### PATH
Lijst van paths zodat linux kan zoeken en daarvoor hoeven we niet hele lange absolute paths steeds in te kloppen om scripts of exe's te laten werken. 

### Scripts
Exec explainer.cfg. Ja ja, hadden we dat bijna geautomatiseerd. Scripts zijn stukjes code die van buitenaf een *start* sein krijgen om hun code te runnen. Ook dat startsein kan worden geautomatiseerd.  

### Bash
Jason had ook nog een broertje die computer nerd was. Bash staat voor *B*ourne-*a*gain *sh*ell. Bash scripting is een manier om te automatiseren met scripts.

### shell
Letterlijk een schil, vaak een soort user interface. Kan een text based interface zijn, maar ook een command-line interface (CLI). Het heet vooral een shell omdat het als een schil over de kernel ligt. Dat betekent dat het niet alleen van toepassing is op de CLI maar ook op een (eventuele) graphical user interface (GUI). 

apt - Advanced packaging tool. Wordt vaak gebruikt bij command om installeren en updaten (en verwijderen) van services. 

### Statements
Behalve dat je waanzinnig kan filosoferen met statements zijn ze handig in computing. If, then, else kan eigenlijk iedereen wel raden en je hebt ook nog elif (else if) en fi. Dit zodat je bepaalde condities op je code/script kan toepassen. 

## Opdracht 1
- Create a directory called ‘scripts’. Place all the scripts you make in this directory.
- Add the scripts directory to the PATH variable.
- Create a script that appends a line of text to a text file whenever it is executed.
- Create a script that installs the httpd package, activates httpd, and enables httpd. Finally, your script should print the status of httpd in the terminal.

## Opdracht 2
- Create a script that generates a random number between 1 and 10, stores it in a variable, and then appends the number to a text file.

#### Conditions:
You can choose to only run parts of your script if a certain condition is met. For example, only read a file if the file exists, or only write to a log if the health check returns an error. This can be done using conditions.

A check for a condition can be done using ‘if’, ‘elif’, and/or ‘else’.

## Opdracht 3
- Create a script that generates a random number between 1 and 10, stores it in a variable, and then appends the number to a text file only if the number is bigger than 5. If the number is 5 or smaller, it should append a line of text to that same text file instead.


### Gebruikte bronnen
- https://opensource.com/resources/what-bash
- https://subscription.packtpub.com/book/cloud-and-networking/9781788995597/1/ch01lvl1sec12/what-is-bash
- https://devhints.io/bash
- https://www.pcwdld.com/bash-cheat-sheet
- https://github.com/RehanSaeed/Bash-Cheat-Sheet
- https://www.digitalocean.com/community/tutorials/how-to-view-and-update-the-linux-path-environment-variable
- https://opensource.com/article/17/6/set-path-linux
- https://linuxhint.com/30_bash_script_examples/
- https://askubuntu.com/questions/715219/ssh-connection-closed-right-after-login-exit-status-1
- https://www.cyberciti.biz/faq/linux-install-and-start-apache-httpd/
- https://www.layerstack.com/resources/tutorials/Installing-Apache-server-on-Linux-Cloud-Servers



### Ervaren problemen
Toen ik probeerde mijn $PATH fixed te maken, heb ik iets gedaan wat onhandig was. Ik heb een instructie verkeerd gelezen en toen  

`source ~/.bash_profile` gedaan in .bash_profile. Nu ik het zo terug lees met een nacht slaap, weet ik niet waarom dit toen zo'n goed idee leek. 

Anyway ik dacht, het is gelukt laten we testen of PATH nu ook /home/scripts/ heeft opgeslagen. Powershell gesloten en opnieuw opgestart. 

Daar begonnen echter de problemen. 

Door mijn bash_profile te slopen op bovenstaande manier, wist de container ook niet zo goed meer wat die moest doen. Als ik met SSH probeerde in te loggen gaf die als error 'Connection to [servername] closed'. Vervolgens heb ik in debug mode `ssh -vvvv sjoerd@18.157.179.30` proberen te vinden wat het was. Vooral de onderste helft van het report maakte dat duidelijk.

![Alt text](../00_includes/LNX-07-connection_closed.png)

Exit status -1 is niet zo goed. Container kaduuk. Casper om hulp gevraagd en die heeft mijn bash_profile gereset. Nu kan ik er weer in. 

Als je dit ooit terug leest Casper, nogmaals muchos gracias want ik kon mezelf wel voor mijn kop slaan. 

Omdat mijn bash profile leeg was, zijn ook user colours gereset. Dat is wat uitdagend met lezen van bijvoorbeeld rights. Ik heb heel lang gezocht hoe ik dit kon oplossen. Casper had heel behulpzaam geopeerd om nieuwe user aan te maken en de bash_profile daar van te kopieren. Echter bleek die bash_profile ook leeg. Nog geprobeerd uit /etc/skel maar daar stond ook geen bash_profile.

Ik heb uiteindelijk in ~/.profile gevonden dat ik force_colour_prompt=YES kon doen. Daarna source command om te updaten en voila:

![Er is weer kleur](../00_includes/LNX-07_source.png)


### Resultaat

## Opdracht 1
Ik heb vorige keer zo erg met permissions lopen rotzooien dat ik kennelijk mezelf uit /home had gelocked. Ik kon namelijk eerst geen mkdir scripts doen, wat toch wat onhandig is. 

![scripts dir](../00_includes/LNX-07-scripts%20dir.png)

Volgende is om de scripts map aan PATH variable toe te voegen. 

![ehco ehco](../00_includes/LNX-07_PATH+scripts.png)

Het is duidelijk dat de vermoeidheid toe begint te slaan, maar het is gelukt. 

Met `export PATH=/home/scripts:$PATH` zorg ik dat mijn /home/scripts folder nu vooraan komt te staan als ik dit met `echo $PATH` check. 

Verder had ik nog nooit een script gemaakt dus nu werd het echt interessant. 

Het is ook handig om het PATH permanent op te slaan. Daar begon ik tegen wat dingen aan te lopen zie hieronder bij 'Ervaren Problemen' voor uitgebreide omschrijving. 

Nu het script om text te appenden. Om Bash te laten weten dat je van deze script taal gebruik wilt maken, begin je met `#!/bin/bash`

![blauw](../00_includes/LNX-07_append_script.png)
Dit is het idee

![append test](../00_includes/LNX-07-append%20script%20works.png)

Typfouten worden ooit mijn ondergang, maar ja het werkt uiteindelijk wel. 

Next up: httpd oftewel apache ophalen

httpd.sh gemaakt:

![httpd script](../00_includes/LNX-07-apache_script.png)

![apache deployed](../00_includes/LNX-07-apache_deployed.png)

Apache gedeployed dus geinstalleerd, geenabled en status op gevraagd. Bij een van de bronnen stond ook nog een commando wat de werkende port voor apache2 op vraagt, maar ik zag later pas dat je daar voor `sudo apt install net-tools` moest doen om de `netstat -tulpn | grep :80` commando werkend te krijgen.

## Opdracht 2

