# SEC-03 - Indentity and Access Management (IAM)
Wie is wat en wat is wie en waarom heeft wie toegang tot wat en waarom heeft wat geen toegang tot wie.

## Key-terms
- ### **Authentication (AuthN)**:
Wie ben je? Identificeer je. We willen zeker weten dat jij bent die jij zegt dat je bent. Als we dat helder hebben kunnen we je bepaalde zaken autoriseren al dan niet volgens een user of systemprofiel. 

Authenticatie is in de meest standaard manier gedaan door in te loggen met *username and password* bijvoorbeeld. Dit heet ook wel **Single-Factor Authentication**. 

Je hebt ook nog **Two-factor Authentication**. Dat is username+password en nog iets unieks wat alleen de gebruiker zou moeten weten, als bijvoorbeeld favoriete plek, naam van zijn/haar eerste school. De variant die iets meer gebruikt wordt is dat de user geverifierd wordt door ze een **OTP (one time pin/password)** te sturen via mail of sms waarmee de user in kan loggen. 

- ### **MFA**:
Multi Factor Authentication. Naast dat je gebruikelijk in logt met username/password of OTP, moet je daarnaast nog een andere authenticatie maatregel nemen, bijvoorbeeld nog een aparte PIN invoeren via SMS/e-mail of indentiteit via een aparte authenticator app verifieren. 

### **SSO of Single Sign-On**:
Je logt 1 keer in een systeem in en hoeft daarna niet meer in te loggen op elk los deelsysteem of applicatie (je hoeft je dus niet keer op keer te her authenticeren). Dat is heel handig als je bij een bedrijf werkt waarbij werknemers (en systemen) gebruik moeten maken van heel veel verschillende applicaties. *(Looking at you KLM service desk)*.

- ### **Authorization (AuthZ)**:
Welke autoriteit heb je > wat mag je? Dit gaat om permissions. Deze permissions kunnen in profilen/security groups worden gezet om zo groepen dezelfde sets te kunnen geven. 

- ### **Principe of Least Privilege**:
  Volgens dit principe krijgt elke user(group) of systeem alleen de rechten die absoluut noodzakelijk zijn voor hun functioneren. 

## Opdracht
### Study:
- The difference between authentication and authorization.
- The three factors of authentication and how MFA improves security.
- What the principle of least privilege is and how it improves security.


### Gebruikte bronnen
- https://www.okta.com/identity-101/authentication-vs-authorization/
- https://www.javatpoint.com/authentication-vs-authorization
- https://en.wikipedia.org/wiki/Principle_of_least_privilege


### Ervaren problemen
Was al bekend met OTP, SSO en MFA omdat we dat op mijn vorige werk gebruikte. 

### Resultaat
Zie key-terms, dat is eigenlijk het resultaat geworden. 