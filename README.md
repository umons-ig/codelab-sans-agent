# Partage de frais

Code de démarrage du projet CodeLab. Le sujet complet est dans le cahier des charges.

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

## Liberté de conception

L'organisation du code, le schéma de la base et l'interface sont libres.
Vous pouvez réorganiser ces fichiers ou utiliser Streamlit à la place de Flask.
