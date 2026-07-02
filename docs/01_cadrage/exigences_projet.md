# Exigences du projet

## Acteurs

- Medecin traitant.
- Medecin remplacant ou collegue.
- Secretaire.
- Administrateur de la base.

## Donnees principales

- Patient : nom, prenom, date de naissance, poids, taille, telephone, adresse.
- Medecin : informations du praticien du cabinet.
- Visite : date, motif, lieu, patient concerne, medecin.
- Ordonnance medicamenteuse : liee a une visite, avec un ou plusieurs medicaments.
- Medicament : numero d'identification, nom, categorie, description.
- Posologie : prises, doses par prise, frequence journaliere, duree.
- Analyses : demande d'examens complementaires et reception des resultats.
- Allergies : medicaments ou familles de medicaments.
- Maladies : maladies connues du patient.
- Sejours : passages dans un hopital ou une clinique.
- Operations : interventions subies par le patient.

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

