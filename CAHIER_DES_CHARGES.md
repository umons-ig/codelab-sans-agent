# Projet 1 : Partage de frais

Séance 1 : vous travaillez comme vous le faites d’habitude, avec ou sans IA.

## Contexte

Un groupe d’amis part une semaine en vacances. Pendant le séjour, chacun paie des choses pour les autres : les courses pour tout le monde, l’essence pour ceux qui sont dans la voiture, une activité pour une partie du groupe. Les tickets s’accumulent, certains ont déjà remboursé une partie, et à la fin plus personne ne sait qui doit combien à qui. Le groupe veut une application pour noter les dépenses au fil de l’eau et faire les comptes à tout moment.

## Ce que l'application doit faire

### Données

- Groupe : nom, dates du séjour, membres.
- Dépense : libellé, montant, date, payeur, participants.

### Fonctionnalités

- Créer un groupe et ses membres.
- Ajouter ou supprimer une dépense.
- Afficher le solde de chaque membre.
- Enregistrer un remboursement entre deux membres.

### Règles

- Une dépense a un montant positif et au moins un participant.
- Le payeur et les participants appartiennent au groupe.
- La date d’une dépense est comprise dans le séjour, dates de début et de fin incluses.
- Une dépense est partagée à parts égales entre ses participants. Le centime restant va au premier participant ajouté.
- Les soldes sont exacts au centime près et leur somme vaut toujours 0.
- Un remboursement a un montant positif, entre deux membres différents.

## Exemples de vérification

Groupe : Alice, Bob et Chloé. Les lignes s’enchaînent.

| Action | Résultat attendu |
|---|---|
| Alice paie 30 € pour Alice, Bob et Chloé | Alice +20,00 ; Bob −10,00 ; Chloé −10,00 |
| Bob rembourse 10 € à Alice | Alice +10,00 ; Bob 0,00 ; Chloé −10,00 |
| Une dépense datée hors du séjour | Refusée, soldes inchangés |
| Une dépense de 0 € | Refusée, soldes inchangés |
| Sur un nouveau groupe, Alice paie 10 € pour les trois | Alice +6,66 ; Bob −3,33 ; Chloé −3,33 |

## Technologies

Python, Flask ou Streamlit, SQLite, pytest. L’organisation du code, le schéma de la base et l’interface sont libres.

## Si vous avez fini

Modifier une dépense, filtrer les dépenses par membre ou par période, exporter en csv.

## À rendre

- Le dépôt GitHub du binôme, avec son historique Git, poussé avant les questions.
- Un README qui indique comment lancer l’application.

## Épreuve

En fin de séance, trois questions individuelles sur votre application, sur papier et machines fermées. Chacun doit comprendre tout le code.
