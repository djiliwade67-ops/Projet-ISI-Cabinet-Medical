-- 1. Afficher tous les médecins
SELECT *
FROM MEDECIN;



-- 2. Afficher tous les patients par ordre alphabétique
SELECT nom_pers, prenom_pers, adresse
FROM PATIENT
ORDER BY nom_pers;



-- 3. Afficher les patients suivis par le médecin n°1
SELECT nom_pers, prenom_pers
FROM PATIENT
WHERE id_medecin = 1;



-- 4. Afficher toutes les visites avec le nom du patient
SELECT V.id_visite,
       V.date_visite,
       V.motif,
       P.nom_pers,
       P.prenom_pers
FROM VISITE V
JOIN PATIENT P
ON V.id_patient = P.id_patient;



-- 5. Afficher les médecins et leurs patients
SELECT M.nom_med,
       M.prenom_med,
       P.nom_pers,
       P.prenom_pers
FROM MEDECIN M
JOIN PATIENT P
ON M.id_medecin = P.id_medecin;


-- 6. Afficher les médicaments prescrits pour chaque ordonnance
SELECT O.id_ordonnance,
       M.nom_medicament,
       P.nb_prises,
       P.freq_journaliere,
       P.duree_traitement
FROM PRESCRIPTION P
JOIN MEDICAMENT M
ON P.id_medicament = M.id_medicament
JOIN ORDONNANCE O
ON P.id_ordonnance = O.id_ordonnance;



-- 7. Afficher les patients souffrant d'une maladie
SELECT P.nom_pers,
       P.prenom_pers,
       M.libelle_maladie
FROM SOUFFRE S
JOIN PATIENT P
ON S.id_patient = P.id_patient
JOIN MALADIE M
ON S.id_maladie = M.id_maladie;


-- 8. Afficher les patients ayant une allergie à un médicament
SELECT P.nom_pers,
       P.prenom_pers,
       M.nom_medicament
FROM ALLERGIE_MEDICAMENT A
JOIN PATIENT P
ON A.id_patient = P.id_patient
JOIN MEDICAMENT M
ON A.id_medicament = M.id_medicament;


-- 9. Afficher les séjours avec le nom du centre de santé
SELECT P.nom_pers,
       C.nom_centre,
       S.date_debut,
       S.date_fin
FROM SEJOUR S
JOIN PATIENT P
ON S.id_patient = P.id_patient
JOIN CENTRE_SANTE C
ON S.id_centre = C.id_centre;



-- 10. Afficher les opérations subies par les patients
SELECT P.nom_pers,
       O.nom_operation,
       SO.date_operation
FROM SEJOUR_OPERATION SO
JOIN SEJOUR S
ON SO.id_sejour = S.id_sejour
JOIN PATIENT P
ON S.id_patient = P.id_patient
JOIN OPERATION O
ON SO.id_operation = O.id_operation;



-- 11. Nombre total de patients
SELECT COUNT(*) AS nombre_patients
FROM PATIENT;



-- 12. Nombre de patients par médecin
SELECT M.nom_med,
       COUNT(P.id_patient) AS nombre_patients
FROM MEDECIN M
LEFT JOIN PATIENT P
ON M.id_medecin = P.id_medecin
GROUP BY M.id_medecin, M.nom_med;


-- 13. Nombre de visites par patient
SELECT P.nom_pers,
       COUNT(V.id_visite) AS nombre_visites
FROM PATIENT P
JOIN VISITE V
ON P.id_patient = V.id_patient
GROUP BY P.id_patient, P.nom_pers;



-- 14. Patients ayant effectué plus d'une visite
SELECT P.nom_pers,
       COUNT(V.id_visite) AS nb_visites
FROM PATIENT P
JOIN VISITE V
ON P.id_patient = V.id_patient
GROUP BY P.id_patient, P.nom_pers
HAVING COUNT(V.id_visite) > 1;



-- 15. Afficher les analyses demandées et leurs résultats
SELECT OA.id_ord_analyse,
       T.libelle_analyse,
       D.resultat_recu,
       D.valeur_resultat
FROM DEMANDE_ANALYSE D
JOIN TYPE_ANALYSE T
ON D.id_type_analyse = T.id_type_analyse
JOIN ORDONNANCE_ANALYSE OA
ON D.id_ord_analyse = OA.id_ord_analyse;



