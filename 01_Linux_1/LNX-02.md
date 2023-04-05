# LNX-02 Files en directories
Hoe werken directories en files en hoe krijg daar overzicht in?

## Key-terms
- pwd om te laten zien waar je nu bent in de folder structuur
- ls om folders en/of files te listen. Je kan dit nog specificieren met -commands
- mkdir om directory te maken
- touch om een nieuwe file te maken


## Opdracht
- Find out your current working directory.
- Make a listing of all files and directories in your home directory.
- Within your home directory, create a new directory named ‘techgrounds’.
- Within the techgrounds directory, create a file containing some text.
- Move around your directory tree using both absolute and relative paths.


### Gebruikte bronnen
- https://www.freecodecamp.org/news/the-linux-ls-command-how-to-list-files-in-a-directory-with-options/
- https://www.cyberciti.biz/faq/create-a-file-in-linux-using-the-bash-shell-terminal/
- https://www.youtube.com/watch?v=PlV1ls92Qro&t=121s
- https://stackoverflow.com/questions/10134901/why-sudo-cat-gives-a-permission-denied-but-sudo-vim-works-fine
- https://askubuntu.com/questions/1183434/have-root-access-still-permission-denied-upon-using-cat-command
- https://linuxhandbook.com/absolute-vs-relative-path/
- https://opensource.com/article/19/8/navigating-filesystem-relative-paths

### Ervaren problemen
Waarom er geen permissions waren voor Cat command terwijl overal op het internet dat wel als eerste functie wordt aangegeven. Kreeg steeds permission denied. Omzeilt voor nu door als Root in te loggen omdat ik niet te veel wil achter lopen bij meteen de 1e opdracht, maar ik ga daar later naar kijken of dat niet gewoon anders kan met permissions. 

Mijn focus begint echt op te raken dus ik weet niet meer zo goed of ik nu dingen begin te zien die er niet zijn. Probleem bij pathing stukje: ik heb op een of andere manier per ongeluk een map '/' aangemaakt waardoor ik bij cd / steeds in die map terecht kwam. Ik heb dit uiteindelijk opgelost door als 'reset' cd ~sjoerd te gebruiken en van daar uit de cd /absolute en cd ../relative gedaan. 

### Resultaat
![pwd](https://github.com/techgrounds/techgrounds-SjoerdKeijzer/blob/6762dd42a72a69b44e650f2cc631138f2b812790/00_includes/LNX-02_current%20dir_pwd.png)

![list and make TG dir](https://github.com/techgrounds/techgrounds-SjoerdKeijzer/blob/6762dd42a72a69b44e650f2cc631138f2b812790/00_includes/LNX-02-List%20and%20make%20TG%20dir.png)

![createfileaddtext](https://github.com/techgrounds/techgrounds-SjoerdKeijzer/blob/6762dd42a72a69b44e650f2cc631138f2b812790/00_includes/LNX-02-create%20file%20and%20add%20text.png)

![paths](https://github.com/techgrounds/techgrounds-SjoerdKeijzer/blob/6762dd42a72a69b44e650f2cc631138f2b812790/00_includes/LNX-02-absolute_relative_paths.png)
