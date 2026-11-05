# Partage de frais

> **Noter les dépenses d’un séjour entre amis et savoir à tout moment qui doit combien à qui.**

Séance 1 · En binôme · Comme vous le faites d’habitude, avec ou sans IA, ChatGPT compris.

[Démarrer](#démarrer) · [Cahier des charges en PDF](CAHIER_DES_CHARGES.pdf)

## Le contexte

Un groupe d’amis part une semaine en vacances. Chacun paie des choses pour les autres : les courses pour tout le monde, l’essence pour ceux qui sont dans la voiture, une activité pour une partie du groupe. Les tickets s’accumulent, certains ont déjà remboursé une partie, et à la fin plus personne ne sait qui doit combien à qui.

## Les données

| Objet | Ce qu’on enregistre |
|---|---|
| **Groupe** | nom, dates du séjour, membres |
| **Dépense** | libellé, montant, date, payeur, participants |
| **Remboursement** | montant, de qui, à qui |

## Ce que l’application doit faire

- [ ] Créer un groupe et ses membres
- [ ] Ajouter ou supprimer une dépense
- [ ] Afficher le solde de chaque membre
- [ ] Enregistrer un remboursement entre deux membres

## Les règles

- Une dépense a un montant positif et au moins un participant.
- Le payeur et les participants appartiennent au groupe.
- La date d’une dépense est comprise dans le séjour, dates de début et de fin incluses.
- Une dépense est partagée à parts égales entre ses participants. Le centime restant va au premier participant ajouté.
- Les soldes sont exacts au centime près et leur somme vaut toujours 0.
- Un remboursement a un montant positif, entre deux membres différents.

## Pour vérifier

Groupe : Alice, Bob et Chloé. Les lignes s’enchaînent.

| Action | Résultat attendu |
|---|---|
| Alice paie 30 € pour Alice, Bob et Chloé | Alice +20,00 ; Bob −10,00 ; Chloé −10,00 |
| Bob rembourse 10 € à Alice | Alice +10,00 ; Bob 0,00 ; Chloé −10,00 |
| Une dépense datée hors du séjour | Refusée, soldes inchangés |
| Une dépense de 0 € | Refusée, soldes inchangés |
| Sur un nouveau groupe, Alice paie 10 € pour les trois | Alice +6,66 ; Bob −3,33 ; Chloé −3,33 |

## Si vous avez fini

Modifier une dépense, filtrer les dépenses par membre ou par période, exporter en CSV.

## Ce qui est libre

Le framework (Flask, FastAPI ou Streamlit), l’organisation du code et l’interface. La base SQLite est fournie avec des exemples, et vous pouvez la modifier. Python, SQLite et pytest sont imposés.

## À la fin de la séance

- Le but : une application qui fonctionne, avec les fonctionnalités demandées.
- Poussez votre travail sur GitHub.

---

# Démarrer

Python 3.11 ou plus est nécessaire.

## Créer votre dépôt

1. Un membre du binôme ouvre <https://github.com/umons-ig/codelab-sans-agent>, clique sur **Use this template**, puis **Create a new repository**, et choisit **Private**.
2. Dans **Settings**, puis **Collaborators**, il ajoute son partenaire et `Tanguyvans`. Le partenaire accepte l'invitation.
3. Chacun récupère le dépôt sur sa machine, puis ouvre le dossier :

```bash
git clone <adresse-de-votre-dépôt>
```

## Choisir votre dossier

- `code-streamlit` : le plus simple. [Premiers pas](https://docs.streamlit.io/get-started).
- `code-flask` : plus de contrôle. [Démarrage rapide](https://flask.palletsprojects.com/en/stable/quickstart/).

Gardez un dossier et supprimez l'autre. Chacun contient un `app.py` qui lit la base et l'affiche. FastAPI est possible aussi : [premiers pas](https://fastapi.tiangolo.com/tutorial/first-steps/).

## Installer et lancer

macOS ou Linux, dans votre dossier :

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
pytest
```

Windows (PowerShell), dans votre dossier :

```powershell
py -m venv .venv
Set-ExecutionPolicy -Scope Process RemoteSigned
.venv\Scripts\Activate.ps1
pip install -r requirements.txt
pytest
```

Puis lancez l'application :

- Flask : `python app.py`, puis <http://127.0.0.1:5000>
- Streamlit : `streamlit run app.py`

## La base

`base.sql` contient les tables et des exemples. `data.db` se crée au premier lancement. Pour repartir de zéro, ou après un changement de `base.sql`, supprimez `data.db`. [Documentation de `sqlite3`](https://docs.python.org/3/library/sqlite3.html).

## Travailler à deux

Une seule personne a le clavier à la fois. `git push` avant de passer le clavier, `git pull` en le prenant :

```bash
git add -A
git commit -m "ajout de la fonctionnalité"
git push
```

```bash
git pull
```
