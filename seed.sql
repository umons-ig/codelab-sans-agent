-- Données d'exemple, chargées à la création de data.db.
INSERT INTO groupes (id, nom, date_debut, date_fin) VALUES (1, 'Vacances à Spa', '2026-07-01', '2026-07-08');
INSERT INTO membres (id, groupe_id, nom) VALUES (1, 1, 'Alice'), (2, 1, 'Bob'), (3, 1, 'Chloé');
INSERT INTO depenses (id, groupe_id, libelle, montant_centimes, date, payeur_id) VALUES (1, 1, 'Courses', 3000, '2026-07-02', 1);
INSERT INTO participants (depense_id, membre_id) VALUES (1, 1), (1, 2), (1, 3);
