# Description generale de la solution

# Dossier médical informatisé — conception de la base de données

Ce dépôt contient l'ensemble des livrables de conception (méthode Merise) pour l'informatisation
du dossier médical d'un cabinet médical regroupant plusieurs praticiens.

## Contexte

Chaque médecin dispose actuellement d'un fichier Excel « PATIENTS » et d'un dossier papier
complémentaire. Cette organisation pose plusieurs problèmes : dossier papier non disponible en
l'absence de la secrétaire, impossibilité pour un médecin remplaçant de mettre à jour le fichier
d'un confrère, résultats d'analyses reçus par des canaux hétérogènes (papier / email). L'objectif
est de concevoir un véritable dossier médical informatisé, accessible facilement par tous les
médecins du cabinet et par la secrétaire.

## Contenu du dépôt

| Fichier | Description |
|---|---|
| `dictionnaire_donnees.md` | Dictionnaire des 45 propriétés élémentaires (code, type, taille, nature) |
| `test_queries.sql` | Script SQL complet : création de la base et des 19 tables (contraintes, clés primaires/étrangères) |

## Situation actuelle

Le cabinet utilise des fichiers Excel par medecin et des dossiers papier. Cette organisation pose des problemes de recherche, de mise a jour, de partage et de confidentialite.

## Solution cible

La solution cible est une base de donnees centralisee permettant de gerer les dossiers medicaux des patients du cabinet.

## Fonctionnement attendu

- La secretaire enregistre les patients, les rendez-vous et les documents recus.
- Le medecin consulte l'historique du patient pendant la visite.
- Le medecin ajoute le motif de visite, les prescriptions, les analyses et les resultats.
- Les medecins du cabinet peuvent consulter les dossiers en cas de remplacement.
- Les droits d'acces limitent les actions selon le role de l'utilisateur.

## Démarche suivie

1. **Dictionnaire de données** — recensement des propriétés élémentaires du domaine.
2. **MCD** (Modèle Conceptuel de Données) — entités, associations et cardinalités.
3. **MLD** (Modèle Logique de Données) — traduction relationnelle du MCD.
4. **Script SQL** — création physique de la base, testée et validée (SQLite).