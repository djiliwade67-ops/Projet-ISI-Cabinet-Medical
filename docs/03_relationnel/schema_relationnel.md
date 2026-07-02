# Schema relationnel

## A remplir

Exemple de notation attendue :

```text
PATIENT(id_patient PK, nom, prenom, date_naissance, poids, taille, telephone, adresse, id_medecin_traitant FK)
MEDECIN(id_medecin PK, nom, prenom, specialite)
VISITE(id_visite PK, date_visite, motif, lieu, id_patient FK, id_medecin FK)
```

