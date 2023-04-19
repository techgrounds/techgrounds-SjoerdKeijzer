# SEC-05 Assymetric Encryption
Jij krijgt een key, ik krijg een key. Ze zijn allebei anders maar toch kunnen we zo wel op een veilige manier met elkaar communiceren. Dat is key tenslotte.

## Key-terms

- Public Key: Sleutel die je kan delen in openbaar.

- Private Key: Sleutel die voor jezelf is. 

Waarom zijn deze twee belangrijk?

Met Asymmetric encryption stuur je jouw public key naar diegene waar mee je communicatie wilt. Deze kan de public key gebruiken om berichten mee te encrypten. Vervolgens wordt het bericht naar jou gestuurd. Jij gebruikt jouw private key (die aan de public key is gekoppeld) om de assymetrische encryptie op deze manier te decrypten. Je ontvangt nu het bericht na een 2 keer gelaagde encryptie en eigenlijk ook een tweestaps authenticatie. 

## Opdracht
- Generate a key pair.
- Send an asymmetrically encrypted message to one of your peers via the public Slack channel. They should be able to decrypt the message using a key. The recipient should be able to read the message, but it should remain a secret to everyone else. You are not allowed to use any private messages or other communication channels besides the public Slack channel. Analyse the difference between this method and symmetric encryption.


### Gebruikte bronnen
- https://travistidwell.com/jsencrypt/demo/
- https://www.devglan.com/online-tools/rsa-encryption-decryption
- https://www.javainuse.com/rsagenerator


### Ervaren problemen
Ik begreep eerst niet helemaal goed welke key je waarvoor gebruikt. Bij wijze als test heb ik toen met mijn public key iets geencrypt en de wijde wereld ingestuurd. Ik dacht dat dan alsnog de private key kon gebruiken om zelf de message te lezen, maar dat hoeft niet perse. Wijze les: je moet dus public key delen, en berichten maken met de public key die je kan uitlezen met de gepairde private key die alleen jij moet hebben. 

### Resultaat
Na het eerst verkeerd te hebben gedaan, heb ik nu door hoe je de keys moet gebruiken, waarom je de key pairs moet hebben (public voor encrypting, private voor decrypting) en dus dat dit al duizend keer beter is dan symmmetrische encrypting. Met name de private key die alleen jijzelf in bezit zou moeten hebben, zorgt voor een tweede beveiligingslaag die zeer secuur is. 