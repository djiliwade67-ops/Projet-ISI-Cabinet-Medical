# Dictionnaire de donnees relationnel— Dossier médical informatisé

## Dictionnaire de données

Nature : **E** = Élémentaire, **C** = Calculée, **ID** = Identifiant

| Code | Désignation | Type | Taille | Nature | Table(s) d'origine | Observations / contraintes |
|---|---|---|---|---|---|---|
| id_medecin | Identifiant du médecin | Numérique | - | ID | MEDECIN | Clé primaire ; clé étrangère dans PATIENT, VISITE |
| nom_med | Nom du médecin | Alphabétique | 50 | E | MEDECIN | Obligatoire |
| prenom_med | Prénom du médecin | Alphabétique | 50 | E | MEDECIN | Obligatoire |
| specialite | Spécialité du médecin | Alphabétique | 100 | E | MEDECIN | Facultatif |
| id_patient | Identifiant du patient | Numérique | - | ID | PATIENT | Clé primaire ; clé étrangère dans VISITE, SOUFFRE, SEJOUR, ALLERGIE_* |
| nom_pers | Nom du patient | Alphabétique | 50 | E | PATIENT | Obligatoire |
| prenom_pers | Prénom du patient | Alphabétique | 50 | E | PATIENT | Obligatoire |
| dat_nais | Date de naissance | Date | - | E | PATIENT | Obligatoire |
| poids | Poids du patient | Numérique | 5,2 | E | PATIENT | En kg |
| taille | Taille du patient | Numérique | 5,2 | E | PATIENT | En cm ou m selon convention retenue |
| ntel | Numéro de téléphone | Alphanumérique | 20 | E | PATIENT | - |
| adresse | Adresse du patient | Alphanumérique | 200 | E | PATIENT | - |
| id_visite | Identifiant de la visite | Numérique | - | ID | VISITE | Clé primaire ; clé étrangère dans ORDONNANCE, ORDONNANCE_ANALYSE |
| date_visite | Date et heure de la visite | Date/heure | - | E | VISITE | Obligatoire |
| motif | Motif de la visite | Alphanumérique | 200 | E | VISITE | Facultatif |
| lieu | Lieu de la visite | Alphabétique | 10 | E | VISITE | Domaine : {domicile, cabinet} |
| id_famille | Identifiant de la famille de médicaments | Numérique | - | ID | FAMILLE | Clé primaire ; clé étrangère dans MEDICAMENT, ALLERGIE_FAMILLE |
| nom_famille | Nom de la famille de médicaments | Alphabétique | 100 | E | FAMILLE | Obligatoire, unique |
| id_medicament | Identifiant du médicament | Numérique | - | ID | MEDICAMENT | Clé primaire ; clé étrangère dans PRESCRIPTION, ALLERGIE_MEDICAMENT, TRAITEMENT |
| nom_medicament | Nom du médicament | Alphabétique | 100 | E | MEDICAMENT | Obligatoire |
| description | Description du médicament | Alphanumérique | 500 | E | MEDICAMENT | Facultatif |
| id_ordonnance | Identifiant de l'ordonnance de médicaments | Numérique | - | ID | ORDONNANCE | Clé primaire ; clé étrangère dans PRESCRIPTION |
| date_ordonnance | Date de l'ordonnance | Date | - | E | ORDONNANCE | Obligatoire, = date_visite |
| nb_prises | Nombre de prises | Numérique | - | E | PRESCRIPTION, TRAITEMENT | Posologie |
| nb_doses_par_prise | Nombre de doses par prise | Numérique | - | E | PRESCRIPTION, TRAITEMENT | Posologie |
| freq_journaliere | Fréquence journalière | Numérique | - | E | PRESCRIPTION, TRAITEMENT | Posologie, en nombre de fois/jour |
| duree_traitement | Durée du traitement | Numérique | - | E | PRESCRIPTION, TRAITEMENT | Posologie, en jours |
| id_type_analyse | Identifiant du type d'analyse | Numérique | - | ID | TYPE_ANALYSE | Clé primaire ; clé étrangère dans DEMANDE_ANALYSE |
| libelle_analyse | Libellé du type d'analyse | Alphabétique | 100 | E | TYPE_ANALYSE | Obligatoire |
| id_ord_analyse | Identifiant de l'ordonnance d'analyses | Numérique | - | ID | ORDONNANCE_ANALYSE | Clé primaire ; clé étrangère dans DEMANDE_ANALYSE |
| date_demande | Date de la demande d'analyses | Date | - | E | ORDONNANCE_ANALYSE | Obligatoire |
| resultat_recu | Indicateur de réception du résultat | Booléen | - | E | DEMANDE_ANALYSE | Valeur par défaut : faux |
| date_resultat | Date de réception du résultat | Date | - | E | DEMANDE_ANALYSE | Facultatif, renseigné à réception |
| valeur_resultat | Valeur ou contenu du résultat | Alphanumérique | 500 | E | DEMANDE_ANALYSE | Facultatif |
| id_maladie | Identifiant de la maladie | Numérique | - | ID | MALADIE | Clé primaire ; clé étrangère dans SOUFFRE, SEJOUR |
| libelle_maladie | Libellé de la maladie | Alphabétique | 150 | E | MALADIE | Obligatoire, unique |
| date_diagnostic | Date du diagnostic | Date | - | E | SOUFFRE | Facultatif |
| id_centre | Identifiant du centre de santé | Numérique | - | ID | CENTRE_SANTE | Clé primaire ; clé étrangère dans SEJOUR |
| nom_centre | Nom du centre de santé | Alphabétique | 100 | E | CENTRE_SANTE | Obligatoire |
| type_centre | Type de centre de santé | Alphabétique | 50 | E | CENTRE_SANTE | Domaine : {hôpital, clinique, ...} |
| adresse_centre | Adresse du centre de santé | Alphanumérique | 200 | E | CENTRE_SANTE | Facultatif |
| id_sejour | Identifiant du séjour | Numérique | - | ID | SEJOUR | Clé primaire ; clé étrangère dans TRAITEMENT, SEJOUR_OPERATION |
| date_debut | Date de début (séjour ou traitement) | Date | - | E | SEJOUR, TRAITEMENT | Obligatoire |
| date_fin | Date de fin du séjour | Date | - | E | SEJOUR | Facultatif ; ≥ date_debut si renseignée |
| motif_sejour | Motif du séjour | Alphanumérique | 200 | E | SEJOUR | Facultatif |
| statut_traitement | Statut du traitement en cours | Alphabétique | 20 | E | TRAITEMENT | Domaine : {en cours, termine} |
| id_operation | Identifiant de l'opération chirurgicale | Numérique | - | ID | OPERATION | Clé primaire ; clé étrangère dans SEJOUR_OPERATION |
| nom_operation | Nom de l'opération | Alphabétique | 150 | E | OPERATION | Obligatoire |
| description_operation | Description de l'opération | Alphanumérique | 500 | E | OPERATION | Facultatif |
| date_operation | Date de réalisation de l'opération | Date | - | E | SEJOUR_OPERATION | Obligatoire |

**Total : 45 propriétés élémentaires distinctes**, dont 12 identifiants 

## Remarques
- Aucune donnée calculée n'a été identifiée dans cet énoncé (l'âge du patient, par exemple, pourrait être calculé à partir de `dat_nais` plutôt que stocké).
- Les couples (nb_prises, nb_doses_par_prise, freq_journaliere, duree_traitement) apparaissent deux fois (PRESCRIPTION et TRAITEMENT) car ce sont deux contextes distincts de posologie (ordonnance ponctuelle du cabinet vs. traitement en cours pendant un séjour) — ce ne sont pas des redondances au sens de la normalisation, ce sont des occurrences différentes de la même propriété générique « posologie ».


## Script SQL

Le fichier `src/relational/01_create_tables.sql` :

1. crée la base `dossier_medical` si elle n'existe pas ;
2. crée les 19 tables relationnelles dans l'ordre respectant les dépendances de clés étrangères ;
3. déclare les contraintes d'intégrité principales : clés primaires, clés étrangères, `CHECK`, `UNIQUE`.

Exécution prévue avec MySQL / MariaDB :

```bash
mysql -u root -p < src/relational/01_create_tables.sql
```



