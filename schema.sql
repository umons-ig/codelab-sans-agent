-- Schéma de la base : Partage de frais. Vous pouvez le modifier.
-- Les montants sont en centimes : 3000 = 30,00 €.
CREATE TABLE IF NOT EXISTS groupes (
    id INTEGER PRIMARY KEY,
    nom TEXT NOT NULL,
    date_debut TEXT NOT NULL,
    date_fin TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS membres (
    id INTEGER PRIMARY KEY,
    groupe_id INTEGER NOT NULL REFERENCES groupes(id) ON DELETE CASCADE,
    nom TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS depenses (
    id INTEGER PRIMARY KEY,
    groupe_id INTEGER NOT NULL REFERENCES groupes(id) ON DELETE CASCADE,
    libelle TEXT NOT NULL,
    montant_centimes INTEGER NOT NULL,
    date TEXT NOT NULL,
    payeur_id INTEGER NOT NULL REFERENCES membres(id)
);
CREATE TABLE IF NOT EXISTS participants (
    depense_id INTEGER NOT NULL REFERENCES depenses(id) ON DELETE CASCADE,
    membre_id INTEGER NOT NULL REFERENCES membres(id),
    PRIMARY KEY (depense_id, membre_id)
);
CREATE TABLE IF NOT EXISTS remboursements (
    id INTEGER PRIMARY KEY,
    groupe_id INTEGER NOT NULL REFERENCES groupes(id) ON DELETE CASCADE,
    de_id INTEGER NOT NULL REFERENCES membres(id),
    a_id INTEGER NOT NULL REFERENCES membres(id),
    montant_centimes INTEGER NOT NULL
);
