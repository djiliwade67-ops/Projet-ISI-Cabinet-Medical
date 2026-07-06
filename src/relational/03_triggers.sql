# Allergie médicament
DELIMITER $$

CREATE TRIGGER verif_allergie_medicament
BEFORE INSERT ON PRESCRIPTION
FOR EACH ROW
BEGIN
    DECLARE allergie_existe INT;

    SELECT COUNT(*) INTO allergie_existe
    FROM ALLERGIE_MEDICAMENT am
    JOIN ORDONNANCE o ON o.id_ordonnance = NEW.id_ordonnance
    JOIN VISITE v ON v.id_visite = o.id_visite
    WHERE am.id_patient = v.id_patient
    AND am.id_medicament = NEW.id_medicament;

    IF allergie_existe > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ALERTE : Ce patient est allergique à ce médicament !';
    END IF;
END $$

DELIMITER ;

# Allergie famille

DELIMITER $$

CREATE TRIGGER verif_allergie_famille
BEFORE INSERT ON PRESCRIPTION
FOR EACH ROW
BEGIN
    DECLARE allergie_famille_existe INT;

    SELECT COUNT(*) INTO allergie_famille_existe
    FROM ALLERGIE_FAMILLE af
    JOIN MEDICAMENT m ON m.id_famille = af.id_famille
    JOIN ORDONNANCE o ON o.id_ordonnance = NEW.id_ordonnance
    JOIN VISITE v ON v.id_visite = o.id_visite
    WHERE af.id_patient = v.id_patient
    AND m.id_medicament = NEW.id_medicament;

    IF allergie_famille_existe > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ALERTE : Ce patient est allergique à la famille de ce médicament !';
    END IF;
END $$

DELIMITER ;

# Date de visite dans le futur

DELIMITER $$

CREATE TRIGGER verif_date_visite
BEFORE INSERT ON VISITE
FOR EACH ROW
BEGIN
    IF NEW.date_visite > NOW() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La date de visite ne peut pas être dans le futur';
    END IF;
END $$

DELIMITER ;