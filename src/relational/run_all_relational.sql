-- Script d'execution complet de la solution relationnelle.
-- A executer depuis la racine du projet avec MySQL / MariaDB.
SET FOREIGN_KEY_CHECKS = 0;

SELECT '--- CREATION DES TABLES ---' AS 'Etape';
SOURCE 01_create_tables.sql;

SELECT '--- APPLICATION DES CONTRAINTES ---' AS 'Etape';
SOURCE 02_constraints.sql;

SELECT '--- CREATION DES TRIGGERS ---' AS 'Etape';
SOURCE 03_triggers.sql;

SELECT '--- CONFIGURATION DES VUES ET DE LA SECURITE ---' AS 'Etape';
SOURCE 04_security_views.sql;

SELECT '--- INJECTION DES DONNEES DE TEST ---' AS 'Etape';
SOURCE 05_seed_data.sql;

SELECT '--- VERIFICATION ET REQUETES DE VALIDATION ---' AS 'Etape';
SOURCE 06_queries_validation.sql;

SET FOREIGN_KEY_CHECKS = 1;

SELECT '=============================================' AS '';
SELECT '  BASE DE DONNEES MISE A JOUR AVEC SUCCES ! ' AS 'Statut';
SELECT '=============================================' AS '';