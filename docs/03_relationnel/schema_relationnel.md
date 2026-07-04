
## MLD — schéma relationnel

```
MEDECIN(id_medecin, nom_med, prenom_med, specialite)
PATIENT(id_patient, nom_pers, prenom_pers, dat_nais, poids, taille, ntel, adresse, #id_medecin)
VISITE(id_visite, date_visite, motif, lieu, #id_patient, #id_medecin)
FAMILLE(id_famille, nom_famille)
MEDICAMENT(id_medicament, nom_medicament, description, #id_famille)
ORDONNANCE(id_ordonnance, date_ordonnance, #id_visite)
ANALYSE(id_analyse, date_demande, #id_visite)
ALLERGIE_MEDICAMENT(#id_patient, #id_medicament)
MALADIE(id_maladie, libelle_maladie)
SOUFFRE(#id_patient, #id_maladie, date_diagnostic)
CENTRE_SANTE(id_centre, nom_centre, type_centre, adresse_centre)
SEJOUR(id_sejour, date_debut, date_fin, motif_sejour, #id_patient, #id_centre, #id_maladie)
POSOLOGIE(#id_sejour, #id_medicament, nb_prises, nb_doses_par_prise, freq_journaliere, duree_traitement, date_debut, statut_traitement)
OPERATION(id_operation, nom_operation, description_operation)
SEJOUR_OPERATION(#id_sejour, #id_operation, date_operation)
```


