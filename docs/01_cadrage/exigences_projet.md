# Exigences du projet

## Acteurs

- Medecin traitant.
- Medecin remplacant ou collegue.
- Secretaire.
- Administrateur de la base.

## Donnees principales

- Patient : id_patient, nom, prenom, date de naissance, poids, taille, telephone, adresse.
- Medecin : id_medecin, nom, prenom, specialite.
- Visite : id_visite, date, motif, lieu, patient concerne, medecin ayant effectue la visite.
- Ordonnance medicamenteuse : id_ordonnance, date, visite associee.
- Medicament : id_medicament, numero d'identification, nom, categorie ou famille, description.
- Prescription : ordonnance, medicament, nombre de prises, doses par prise, frequence journaliere, duree.
- Analyses : ordonnance d'analyse, type d'analyse, resultat recu, date du resultat, contenu du resultat.
- Allergies : allergies aux medicaments et allergies aux familles de medicaments.
- Maladies : id_maladie, libelle, date de diagnostic pour le patient.
- Sejours : id_sejour, centre de sante, dates, motif, maladie eventuelle.
- Operations : id_operation, nom, description, date de l'operation pendant un sejour.
- Centre de sante : id_centre, nom, type, adresse.

## Regles metier importantes

- Une visite concerne un seul patient.
- Une ordonnance est toujours associee a une visite.
- Une visite peut ne pas avoir d'ordonnance.
- Une ordonnance medicamenteuse contient au moins un medicament.
- Une visite peut avoir lieu au cabinet ou au domicile.
- Les medecins doivent consulter les dossiers des patients de leurs collegues en cas d'absence.
- La confidentialite des donnees medicales doit etre garantie.

## Livrables attendus

- Description generale de la solution.
- Regles de confidentialite et autorisations.
- Solution relationnelle : MCD, dictionnaire, schema relationnel, scripts SQL, triggers.
- Solution objet-relationnelle : modele, schema, scripts SQL, triggers ou methodes.
