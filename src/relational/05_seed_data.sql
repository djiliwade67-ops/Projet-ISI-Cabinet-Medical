


-- 1. MEDECIN
INSERT INTO MEDECIN (id_medecin, nom_med, prenom_med, specialite) VALUES
(1, 'Ndiaye', 'Amadou', 'Médecine générale'),
(2, 'Ba', 'Fatou', 'Cardiologie'),
(3, 'Sow', 'Ibrahima', 'Pédiatrie'),
(4, 'Diop', 'Awa', 'Dermatologie'),
(5, 'Sarr', 'Ousmane', 'Neurologie');


-- 2. FAMILLE
INSERT INTO FAMILLE (id_famille, nom_famille) VALUES
(1, 'Antibiotique'),
(2, 'Antalgique'),
(3, 'Anti-inflammatoire'),
(4, 'Antiviral'),
(5, 'Antihypertenseur'),
(6, 'Antidiabétique');


-- 3. TYPE_ANALYSE
INSERT INTO TYPE_ANALYSE (id_type_analyse, libelle_analyse) VALUES
(1, 'Prise de sang'),
(2, 'Analyse d''urine'),
(3, 'Radiographie'),
(4, 'Scanner'),
(5, 'IRM'),
(6, 'Échographie'),
(7, 'ECG'),
(8, 'Test COVID-19');


-- 4. MALADIE
INSERT INTO MALADIE (id_maladie, libelle_maladie) VALUES
(1, 'Diabète'),
(2, 'Hypertension'),
(3, 'Asthme'),
(4, 'Migraine'),
(5, 'Insuffisance cardiaque'),
(6, 'Paludisme'),
(7, 'Tuberculose'),
(8, 'Anémie');


-- 5. CENTRE_SANTE
INSERT INTO CENTRE_SANTE (id_centre, nom_centre, type_centre, adresse_centre) VALUES
(1, 'Hôpital Principal de Dakar', 'Hôpital', 'Dakar Plateau'),
(2, 'Clinique Pasteur', 'Clinique', 'Dakar'),
(3, 'Hôpital Régional de Thiès', 'Hôpital', 'Thiès'),
(4, 'Clinique de la Paix', 'Clinique', 'Mbour'),
(5, 'Centre Hospitalier de Kaolack', 'Hôpital', 'Kaolack');


-- 6. OPERATION
INSERT INTO OPERATION (id_operation, nom_operation, description_operation) VALUES
(1, 'Appendicectomie', 'Ablation de l’appendice'),
(2, 'Pontage coronarien', 'Chirurgie cardiaque'),
(3, 'Césarienne', 'Accouchement par voie chirurgicale'),
(4, 'Ablation de kyste', 'Retrait d''un kyste'),
(5, 'Neurochirurgie', 'Intervention sur le cerveau'),
(6, 'Arthroscopie', 'Intervention sur une articulation');


-- 7. PATIENT
INSERT INTO PATIENT
(id_patient, nom_pers, prenom_pers, dat_nais, poids, taille, ntel, adresse, id_medecin)
VALUES
(1, 'Fall', 'Moussa', '2002-05-10', 70.5, 1.75, '770000001', 'Dakar', 1),
(2, 'Diop', 'Aminata', '2000-11-22', 60.0, 1.65, '770000002', 'Pikine', 2),
(3, 'Sarr', 'Omar', '1998-03-15', 80.0, 1.82, '770000003', 'Rufisque', 1),
(4, 'Ndiaye', 'Fatou', '2010-09-01', 45.0, 1.55, '770000004', 'Guédiawaye', 3),
(5, 'Ba', 'Ibrahima', '1985-12-20', 90.0, 1.78, '770000005', 'Thiès', 2),
(6, 'Seck', 'Khadija', '1995-07-07', 65.0, 1.70, '770000006', 'Dakar', 4),
(7, 'Gueye', 'Adama', '1990-02-14', 72.0, 1.72, '770000007', 'Mbour', 1),
(8, 'Kane', 'Mariama', '2003-08-19', 55.0, 1.60, '770000008', 'Saint-Louis', 5),
(9, 'Sy', 'Cheikh', '1978-06-30', 85.0, 1.77, '770000009', 'Thiès', 2),
(10, 'Diallo', 'Aissatou', '2001-12-11', 58.0, 1.66, '770000010', 'Kaolack', 3);


-- 8. MEDICAMENT 
INSERT INTO MEDICAMENT (id_medicament, nom_medicament, description, id_famille)
VALUES
(1, 'Paracétamol', 'Antalgique(anti douleur) et antipyrétique(anti-fievre)', 2),
(2, 'Amoxicilline', 'Antibiotique à large spectre', 1),
(3, 'Ibuprofène', 'Anti-inflammatoire non stéroïdien', 3),
(4, 'Aspirine', 'Antalgique et antiagrégant', 2),
(5, 'Ceftriaxone', 'Antibiotique injectable', 1),
(6, 'Diclofénac', 'Anti-inflammatoire', 3),
(7, 'Azithromycine', 'Antibiotique macrolide', 1),
(8, 'Doliprane', 'Antalgique', 2),
(9, 'Naproxène', 'Anti-inflammatoire', 3),
(10, 'Aciclovir', 'Antiviral contre les infections herpétiques', 4),
(11, 'Augmentin', 'Association Amoxicilline + Acide clavulanique', 1),
(12, 'Tramadol', 'Antalgique opioïde', 2),
(13, 'Prednisone', 'Corticoïde anti-inflammatoire', 3),
(14, 'Métronidazole', 'Antibiotique et antiparasitaire', 1),
(15, 'Voltaren', 'Diclofénac en marque commerciale', 3),
(16, 'Paracod', 'Antalgique', 2),
(17, 'Efferalgan', 'Paracétamol en marque commerciale', 2),
(18, 'Clamoxyl', 'Amoxicilline en marque commerciale', 1),
(19, 'Kétoprofène', 'Anti-inflammatoire', 3),
(20, 'Amlodipine', 'Traitement de l''hypertension artérielle', 5);


-- 9. VISITE
INSERT INTO VISITE (id_visite, date_visite, motif, lieu, id_patient, id_medecin) 
VALUES
(1, '2026-07-01 10:00:00', 'consultation', 'cabinet', 1, 1),
(2, '2026-07-02 15:00:00', 'douleur poitrine', 'domicile', 2, 2),
(3, '2026-07-03 09:30:00', 'controle', 'cabinet', 3, 1),
(4, '2026-07-03 11:00:00', 'fièvre', 'cabinet', 4, 3),
(5, '2026-07-04 14:00:00', 'dermatologie', 'cabinet', 6, 4),
(6, '2026-07-04 16:00:00', 'fatigue', 'domicile', 5, 2),
(7, '2026-07-05 08:00:00', 'consultation', 'cabinet', 7, 1),
(8, '2026-07-05 10:30:00', 'suivi', 'cabinet', 8, 5),
(9, '2026-07-06 09:00:00', 'maux de tête', 'cabinet', 9, 2),
(10, '2026-07-06 11:00:00', 'controle enfant', 'cabinet', 10, 3),
(11, '2026-07-07 14:00:00', 'urgence', 'domicile', 1, 1),
(12, '2026-07-07 16:00:00', 'consultation', 'cabinet', 2, 2),
(13, '2026-07-08 09:00:00', 'controle', 'cabinet', 3, 1),
(14, '2026-07-08 10:30:00', 'consultation', 'cabinet', 4, 3),
(15, '2026-07-08 12:00:00', 'dermatite', 'cabinet', 6, 4);


-- 10. ORDONNANCE
INSERT INTO ORDONNANCE (id_ordonnance, date_ordonnance, id_visite)
VALUES
(1, '2026-07-01', 1),
(2, '2026-07-02', 2),
(3, '2026-07-03', 4),
(4, '2026-07-04', 5),
(5, '2026-07-05', 6),
(6, '2026-07-06', 9),
(7, '2026-07-07', 11),
(8, '2026-07-08', 12);


-- 11.ORDONNANCE_ANALYSE
INSERT INTO ORDONNANCE_ANALYSE (id_ord_analyse, date_demande, id_visite)
VALUES
(1, '2026-07-02', 2),
(2, '2026-07-03', 4),
(3, '2026-07-04', 6),
(4, '2026-07-05', 8),
(5, '2026-07-06', 9);


-- 12. PRESCRIPTION
INSERT INTO PRESCRIPTION
(id_ordonnance, id_medicament, nb_prises, nb_doses_par_prise, freq_journaliere, duree_traitement)
VALUES
(1, 2, 1, 1, 3, 7),
(1, 8, 2, 1, 2, 5),

(2, 1, 2, 1, 3, 5),
(2, 4, 1, 2, 2, 7),

(3, 3, 1, 1, 3, 10),
(3, 6, 2, 1, 2, 5),

(4, 5, 1, 2, 3, 6),
(4, 7, 1, 1, 2, 7),

(5, 9, 2, 1, 3, 5),

(6, 12, 2, 1, 3, 5),
(6, 13, 1, 1, 2, 6),

(7, 14, 1, 2, 3, 7),

(8, 1, 2, 1, 3, 5),
(8, 3, 1, 1, 2, 7);


-- 13.DEMANDE_ANALYSE
INSERT INTO DEMANDE_ANALYSE (id_ord_analyse, id_type_analyse, resultat_recu, date_resultat, valeur_resultat)
VALUES
(1, 1, TRUE, '2026-07-03', 'Hémoglobine normale'),
(1, 2, TRUE, '2026-07-03', 'Aucune anomalie'),

(2, 3, TRUE, '2026-07-04', 'Fracture absente'),

(3, 7, FALSE, NULL, NULL),

(4, 6, TRUE, '2026-07-06', 'Échographie normale'),

(5, 5, FALSE, NULL, NULL);


 -- 14. ALLERGIE_MEDICAMENT
 INSERT INTO ALLERGIE_MEDICAMENT (id_patient, id_medicament)
VALUES
(1, 2),
(2, 1),
(3, 5),
(4, 8),
(5, 20);


-- 15.ALLERGIE_FAMILLE
INSERT INTO ALLERGIE_FAMILLE (id_patient, id_famille)
VALUES
(6, 1),
(7, 3),
(8, 2),
(9, 5),
(10, 4);


 -- 16. SOUFFRE
INSERT INTO SOUFFRE (id_patient, id_maladie, date_diagnostic)
VALUES
(1, 1, '2025-01-10'),
(2, 2, '2025-03-15'),
(3, 3, '2024-06-20'),
(5, 1, '2025-11-05'),
(6, 4, '2025-02-18'),
(8, 8, '2025-05-30'),
(9, 2, '2024-10-12');


 -- 17. SEJOUR
INSERT INTO SEJOUR (id_sejour, date_debut, date_fin, motif_sejour, id_patient, id_centre, id_maladie)
VALUES
(1, '2026-01-10', '2026-01-15', 'Appendicite', 1, 1, NULL),
(2, '2026-02-01', NULL, 'Observation cardiaque', 2, 2, 5),
(3, '2026-03-10', '2026-03-20', 'Paludisme grave', 3, 3, 6),
(4, '2026-04-05', '2026-04-10', 'Contrôle du diabète', 5, 1, 1),
(5, '2026-05-01', NULL, 'Migraine sévère', 6, 2, 4);


 -- 18.TRAITEMENT
INSERT INTO TRAITEMENT(id_sejour, id_medicament, nb_prises, nb_doses_par_prise, freq_journaliere,
duree_traitement, date_debut, statut_traitement)
VALUES
(1, 4, 2, 1, 3, 5, '2026-01-10', 'termine'),
(2, 20, 1, 1, 1, 30, '2026-02-01', 'en cours'),
(3, 14, 2, 1, 2, 10, '2026-03-10', 'termine'),
(4, 20, 1, 1, 1, 15, '2026-04-05', 'termine'),
(5, 1, 2, 1, 3, 7, '2026-05-01', 'en cours');
 

 -- 19. SEJOUR_OPERATION
INSERT INTO SEJOUR_OPERATION (id_sejour, id_operation, date_operation)
VALUES
(1, 1, '2026-01-11'),
(2, 2, '2026-02-05'),
(3, 4, '2026-03-15'),
(4, 6, '2026-04-07'),
(5, 5, '2026-05-03');
