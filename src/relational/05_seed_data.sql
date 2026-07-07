-- Donnees de test relationnelles.

# La vue secrétaire 
CREATE VIEW vue_secretaire AS 
SELECT nom_pers , prenom_pers , ntel , date_visite , lieu 
FROM patient p 
JOIN visite v ON p.id_patient = v.id_patient;

# La vue medecin

CREATE VIEW vue_medecin AS
SELECT nom_pers, prenom_pers, date_visite, motif, lieu, nom_medicament, libelle_maladie
FROM patient p
JOIN visite v ON p.id_patient = v.id_patient
JOIN ordonnance o ON o.id_visite = v.id_visite
JOIN prescription pr ON pr.id_ordonnance = o.id_ordonnance
JOIN medicament m ON m.id_medicament = pr.id_medicament


