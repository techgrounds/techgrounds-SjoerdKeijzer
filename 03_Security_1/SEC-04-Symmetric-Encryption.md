# SEC-04 Symmetric Encryption
Een symmetrische manier van encryptie. What could possibly go wrong?

## Key-terms
- Symmetric Encryption: Je gaat van bericht > encryptie key > encrypted message > send message > ontvanger gebruikt encryptie key > leest bericht. 
In dit geval gebruikt je dezelfde key voor het encrypten zelf, en het decrypten /openmaken van het bericht als ontvanger.

- Caesar cipher: Een eenvoudige encryptie methode. Je neemt het reguliere alphabet en kiest vervolgens een bepaalde waarde (zeg 3) waarmee je het opschuift. 

Een bericht met Caesar Cipher met een shift van 3 zou kunnen zijn:

Kdoor glw lv Sdwulfn > Hallo dit is Patrick

- Steganography: Bericht verbergen in 'plain sight', maar zo gecamoufleerd dat je wel moet weten waar je het moet zoeken. 


## Opdracht
- Find one more historic cipher besides the Caesar cipher.
- Find two digital ciphers that are being used today.
- Send a symmetrically encrypted message to one of your peers via the public Slack channel. They should be able to decrypt the message using a key you share with them. Try to think of a way to share this encryption key without revealing it to everyone. You are not allowed to use any private messages or other communication channels besides the public Slack channel. Analyse the shortcomings of symmetric encryption for sending messages.


### Gebruikte bronnen
- https://en.wikipedia.org/wiki/Cipher_suite
- https://www.cryptomathic.com/news-events/blog/symmetric-key-encryption-why-where-and-how-its-used-in-banking
- https://www.techslang.com/definition/what-is-symmetric-encryption/
- https://interestingengineering.com/innovation/11-cryptographic-methods-that-marked-history-from-the-caesar-cipher-to-enigma-code-and-beyond
- https://www.techtarget.com/searchsecurity/definition/cipher#:~:text=Modern%20ciphers%20enable%20private%20communication,to%20maintain%20security%20and%20privacy.
- https://link.springer.com/chapter/10.1007/978-3-030-73492-3_9
- https://www.cryptomathic.com/news-events/blog/symmetric-key-encryption-why-where-and-how-its-used-in-banking
- https://en.wikipedia.org/wiki/Blowfish_(cipher)



### Ervaren problemen
Waarom symmetrische encryptie niet in de pure vorm meer wordt gebruikt werd me al vrij snel duidelijk. Het is vrij makkelijk te decrypten omdat je de key ook in de message deelt. 

Wat meer uitdagend was om zelf te verzinnen op welke manier je jouw bericht wilt versturen in Slack en hoe je dat precies met welke cipher voor elkaar krijgt. Daar was ik wel even mee bezig. 

### Resultaat
- Find one more historic cipher besides the Caesar cipher.

Steganography en de Pigpen Cypher vond ik de leukste. Vooral Steganography omdat het eigenlijk heel simpel is, maar zeker in ancient times gewoon heel uitgekookt was. In de digitale wereld werkt Steganography voor geen meter en iets als de Pigpen en Caesar Cypher zijn zo bekend dat die in elke decryption database wel staan. 

- Find two digital ciphers that are being used today.
    - AES (Advanced Encryption Standard) - gebruikt 128 bit blocks. 
    - Blowfish cipher - gebruikt 64 block bits. In essentie hakt deze methode de plaintedt in de helft, begint encryptie en hakt daarna alles tot blocks en husselt die vervolgens door elkaar. (1 round). Hoe vaker je schud (x round zoveel), hoe veiliger het wordt. Blowfish is tegenwoordig depriciated, maar het algoritme word nog wel op voortgebouwd in nieuwe itineraties symmetric encryption. Je zou kunnen zeggen dat daarmee de Blowfish cipher nu ook nog gebruikt wordt. 


- Send a symmetrically encrypted message to one of your peers via the public Slack channel. They should be able to decrypt the message using a key you share with them. Try to think of a way to share this encryption key without revealing it to everyone. You are not allowed to use any private messages or other communication channels besides the public Slack channel. Analyse the shortcomings of symmetric encryption for sending messages.

![Caspersky](../00_includes/SEC-04_caspersky.png) 

We nemen een Caspersky, met een AES encrypted bericht. Ik heb Stenography gebruikt om in de alternative description van het plaatje `128b CasperSkyKeyCry6` te zetten, wat het aantal bits is en de key waarmee je het bericht zou moeten kunnen ontcijferen. 

Waarom is dit nou niet zo veilig? Omdat je de key waarmee je het ook kan ontcijferen, in je bericht zet. Kortom, iedereen die de juiste techniek kent, kan dit zo meelezen. Casper dus ook. 
