-- Tests des requetes objet-relationnelles.
-- création de la base de données
CREATE DATABASE dossier_medical;
    
USE dossier_medical;

-- création de medecin
CREATE TABLE MEDECIN (
    id_medecin      INT             NOT NULL,
    nom_med         VARCHAR(50)     NOT NULL,
    prenom_med      VARCHAR(50)     NOT NULL,
    specialite      VARCHAR(100),
    CONSTRAINT pk_medecin PRIMARY KEY (id_medecin)
);

-- création de patients
CREATE TABLE PATIENT (
    id_patient      INT             NOT NULL,
    nom_pers        VARCHAR(50)     NOT NULL,
    prenom_pers     VARCHAR(50)     NOT NULL,
    dat_nais        DATE            NOT NULL,
    poids           DECIMAL(5,2),
    taille          DECIMAL(5,2),
    ntel            VARCHAR(20),
    adresse         VARCHAR(200),
    id_medecin      INT             NOT NULL,
    CONSTRAINT pk_patient PRIMARY KEY (id_patient),
    CONSTRAINT fk_patient_medecin FOREIGN KEY (id_medecin)
        REFERENCES MEDECIN(id_medecin)
);

-- création de visite
CREATE TABLE VISITE (
    id_visite       INT             NOT NULL,
    date_visite     DATETIME        NOT NULL,
    motif           VARCHAR(200),
    lieu            VARCHAR(10)     NOT NULL,   -- 'domicile' ou 'cabinet'
    id_patient      INT             NOT NULL,
    id_medecin      INT             NOT NULL,
    CONSTRAINT pk_visite PRIMARY KEY (id_visite),
    CONSTRAINT fk_visite_patient FOREIGN KEY (id_patient)
        REFERENCES PATIENT(id_patient),
    CONSTRAINT fk_visite_medecin FOREIGN KEY (id_medecin)
        REFERENCES MEDECIN(id_medecin),
    CONSTRAINT ck_visite_lieu CHECK (lieu IN ('domicile','cabinet'))
);

-- crcréation de ordonnance
CREATE TABLE ORDONNANCE (
    id_ordonnance   INT             NOT NULL,
    date_ordonnance DATE            NOT NULL,
    id_visite       INT             NOT NULL,
    CONSTRAINT pk_ordonnance PRIMARY KEY (id_ordonnance),
    CONSTRAINT fk_ordonnance_visite FOREIGN KEY (id_visite)
        REFERENCES VISITE(id_visite),
    CONSTRAINT uq_ordonnance_visite UNIQUE (id_visite) -- 1 seule ordonnance med. par visite
);

-- création de famille de médicament
CREATE TABLE FAMILLE (
    id_famille      INT             NOT NULL,
    nom_famille     VARCHAR(100)    NOT NULL,
    CONSTRAINT pk_famille PRIMARY KEY (id_famille)
);

-- création de médicament
CREATE TABLE MEDICAMENT (
    id_medicament   INT             NOT NULL,
    nom_medicament  VARCHAR(100)    NOT NULL,
    description     VARCHAR(500),
    id_famille      INT             NOT NULL,
    CONSTRAINT pk_medicament PRIMARY KEY (id_medicament),
    CONSTRAINT fk_medicament_famille FOREIGN KEY (id_famille)
        REFERENCES FAMILLE(id_famille)
);

-- création de analyse
CREATE TABLE ANALYSE (
    id_analyse  INT             NOT NULL,
    date_demande    DATE            NOT NULL,
    id_visite       INT           NOT NULL,
    CONSTRAINT pk_analyse PRIMARY KEY (id_analyse),
    CONSTRAINT fk_analyse_visite FOREIGN KEY (id_visite)
        REFERENCES VISITE(id_visite),
    CONSTRAINT uq_ord_analyse_visite UNIQUE (id_visite)
);

-- création de allergie
CREATE TABLE ALLERGIE (
    id_patient      INT     NOT NULL,
    id_medicament   INT     NOT NULL,
    CONSTRAINT pk_allergie PRIMARY KEY (id_patient, id_medicament),
    CONSTRAINT fk_allergie_patient FOREIGN KEY (id_patient) REFERENCES PATIENT(id_patient),
    CONSTRAINT fk_allergie_medicament FOREIGN KEY (id_medicament) REFERENCES MEDICAMENT(id_medicament)
);

-- création de maladie
CREATE TABLE MALADIE (
    id_maladie      INT             NOT NULL,
    libelle_maladie VARCHAR(150)    NOT NULL,
    CONSTRAINT pk_maladie PRIMARY KEY (id_maladie)
);

-- création de souffre
CREATE TABLE SOUFFRE (
    id_patient      INT     NOT NULL,
    id_maladie      INT     NOT NULL,
    date_diagnostic DATE,
    CONSTRAINT pk_souffre PRIMARY KEY (id_patient, id_maladie),
    CONSTRAINT fk_souffre_patient FOREIGN KEY (id_patient) REFERENCES PATIENT(id_patient),
    CONSTRAINT fk_souffre_maladie FOREIGN KEY (id_maladie) REFERENCES MALADIE(id_maladie)
); 

-- Création de centre de santé
CREATE TABLE CENTRE_SANTE (
    id_centre       INT             NOT NULL,
    nom_centre      VARCHAR(100)    NOT NULL,
    type_centre     VARCHAR(50),        -- 'hopital', 'clinique', ...
    adresse_centre  VARCHAR(200),
    CONSTRAINT pk_centre_sante PRIMARY KEY (id_centre)
);

-- création de séjour
CREATE TABLE SEJOUR (
    id_sejour       INT             NOT NULL,
    date_debut      DATE            NOT NULL,
    date_fin        DATE,
    motif_sejour    VARCHAR(200),
    id_patient      INT             NOT NULL,
    id_centre       INT             NOT NULL,
	id_maladie      INT,                        -- diagnostic principal, optionnel (0,1)
    CONSTRAINT pk_sejour PRIMARY KEY (id_sejour),
    CONSTRAINT fk_sejour_patient FOREIGN KEY (id_patient) REFERENCES PATIENT(id_patient),
    CONSTRAINT fk_sejour_centre FOREIGN KEY (id_centre) REFERENCES CENTRE_SANTE(id_centre),
    CONSTRAINT fk_sejour_maladie FOREIGN KEY (id_maladie) REFERENCES MALADIE(id_maladie),
    CONSTRAINT ck_sejour_dates CHECK (date_fin IS NULL OR date_fin >= date_debut)
);

-- création de posologie
CREATE TABLE POSOLOGIE (
    id_medicament       INT             NOT NULL,
    nb_prises           INT             NOT NULL,
    nb_doses_par_prise  INT             NOT NULL,
    freq_journaliere    INT             NOT NULL,
    duree_traitement    INT             NOT NULL,   -- en jours
    date_debut          DATE            NOT NULL,
    statut_traitement   VARCHAR(20)     NOT NULL DEFAULT 'en cours',
    CONSTRAINT pk_traitement PRIMARY KEY (id_sejour, id_medicament),
    CONSTRAINT fk_traitement_medicament FOREIGN KEY (id_medicament) REFERENCES MEDICAMENT(id_medicament),
    CONSTRAINT ck_traitement_statut CHECK (statut_traitement IN ('en cours','termine'))
);

--  création de opération
CREATE TABLE OPERATION (
    id_operation        INT             NOT NULL,
    nom_operation       VARCHAR(150)    NOT NULL,
    description_operation VARCHAR(500),
    CONSTRAINT pk_operation PRIMARY KEY (id_operation)
);

-- création de comporte(séjour opération)
CREATE TABLE SEJOUR_OPERATION (
    id_sejour       INT     NOT NULL,
    id_operation    INT     NOT NULL,
    date_operation  DATE    NOT NULL,
    CONSTRAINT pk_sejour_operation PRIMARY KEY (id_sejour, id_operation),
    CONSTRAINT fk_sejour_op_sejour FOREIGN KEY (id_sejour) REFERENCES SEJOUR(id_sejour),
    CONSTRAINT fk_sejour_op_operation FOREIGN KEY (id_operation) REFERENCES OPERATION(id_operation)
);
 