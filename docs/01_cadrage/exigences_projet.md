# Exigences du projet

## Acteurs

- Medecin traitant.
- Medecin remplacant ou collegue.
- Secretaire.
- Administrateur de la base.

## Donnees principales

- Patient :  id_patient, nom, prenom, date de naissance, poids, taille, telephone, adresse.
- Medecin :  id_mc, date_visite, prescrip , analyses, result.
- Visite :  id_vs, date, prescription, analyse ,resultat.
- Ordonnance  id_ord, medicamenteuse, date_ord .
- Medicament :  id_mdm, numero d'identification, nom, categorie, description.
- Posologie :  id_psg, prises, doses par prise, frequence journaliere, duree.
- Analyses :  id_an, nom d analyse, type d analyse, resultats.
- Allergies : id_al, nom allergies, consequences .
- Maladies :  id_mld, nom de la maladie, contraintes, traitement.
- Sejours :  id_sjr, duree.
- Operations :  id_opr, nom de l operation, consequence, .
- Centre de Santer :id_cs lieu;

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

