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
- Poussez votre travail sur GitHub avant les questions.
- Trois questions individuelles, sur papier et machines fermées. Chacun doit comprendre tout le code.

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

## Installer

macOS ou Linux :

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

Windows (PowerShell) :

```powershell
py -m venv .venv
Set-ExecutionPolicy -Scope Process RemoteSigned
.venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

## Vérifier que tout fonctionne

```bash
pytest
python app.py
```

Ouvrez ensuite <http://127.0.0.1:5000>. Dans le terminal, Ctrl+C arrête l’application.

## La base de données

La base est fournie : tables dans `schema.sql`, exemples dans `seed.sql`. Elle est créée dans `data.db` au premier lancement de l'application. Un groupe, trois membres et une dépense de 30 € : les soldes attendus sont Alice +20,00 ; Bob −10,00 ; Chloé −10,00. Les tests utilisent une base vide.

Vous pouvez modifier le schéma. Après un changement, ou pour repartir de zéro, supprimez `data.db`.

Trois commandes pour commencer :

```python
from db import get_connection, init_db

init_db()
with get_connection() as conn:
    # Lire
    lignes = conn.execute("SELECT nom FROM membres WHERE groupe_id = ?", (1,)).fetchall()
    print([dict(ligne) for ligne in lignes])

    # Ajouter : toujours des ? pour les valeurs
    conn.execute("INSERT INTO membres (groupe_id, nom) VALUES (?, ?)", (1, "David"))

    # Joindre : les dépenses avec le nom du payeur
    lignes = conn.execute("SELECT d.libelle, d.montant_centimes, m.nom FROM depenses d JOIN membres m ON d.payeur_id = m.id").fetchall()
    print([dict(ligne) for ligne in lignes])
```

## Flask, FastAPI ou Streamlit

Le code de démarrage utilise Flask. Prenez ce que vous voulez.

**Flask** : rien de plus à installer. [Démarrage rapide](https://flask.palletsprojects.com/en/stable/quickstart/).

**FastAPI** : [premiers pas](https://fastapi.tiangolo.com/tutorial/first-steps/).

```bash
pip install "fastapi[standard]"
```

Remplacez le contenu de `app.py` par :

```python
from fastapi import FastAPI

from db import get_connection, init_db

init_db()
app = FastAPI()


@app.get("/")
def accueil():
    return {"message": "Mon application"}
```

Puis lancez :

```bash
fastapi dev app.py
```

**Streamlit** : le plus simple pour une interface. [Premiers pas](https://docs.streamlit.io/get-started) · [Documentation](https://docs.streamlit.io).

```bash
pip install streamlit
```

Remplacez le contenu de `app.py` par :

```python
import streamlit as st

from db import get_connection, init_db

init_db()
st.title("Mon application")
```

Puis lancez :

```bash
streamlit run app.py
```

Si vous quittez Flask, ajoutez votre framework à `requirements.txt`, supprimez `tests/test_demarrage.py`, qui teste la page Flask, ainsi que `templates/` si vous ne l’utilisez plus, et testez vos règles dans vos propres fichiers de `tests/`.

SQLite : [documentation du module `sqlite3`](https://docs.python.org/3/library/sqlite3.html).

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
