-- VorbereitungenALTER
-- source sql/notepad.sql;

SHOW DATABASES;
USE mydb -A;
SHOW TABLES;
SELECT * FROM mydb.employees;
SELECT * FROM mydb.countries;


SELECT user();

-- user-Tabelle
SHOW DATABASES;
USE mysql;
SHOW TABLES;

DESCRIBE mysql.user;

SELECT 
     user, authentication_string 
     FROM mysql.user;

-- User anlegen 
CREATE USER if NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'admin';
    
-- Plugins anzeigen
SELECT 
      user,
      authentication_string,
      PLUGIN
FROM mysql.user;

-- Berechtigungen zuweisen
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;

-- Reload der Berechtigungen
FLUSH PRIVILEGES;

-- als Root abmelden
EXIT

-- als Admin anmelden (unteter Linux)
mysql -u admin -p


-- User-Rechte anzeigen
SHOW GRANTS FOR 'admin'@'localhost';

-- Anlegen allg. USER
CREATE USER 'max'@'localhost' IDENTIFIED BY 'max';

-- Alle Rechte anzeigen
SHOW PRIVILEGES;

-- Rechte zuweisen
SHOW PRIVILEGES;GRANT
  SHOW DATABASES, SELECT
  ON *.*
  TO 'max'@'localhost';
  
  
SHOW DATABASES;
SELECT * FROM mydb.employees;
SELECT * FROM mydb.countries;

-- Rechte zuweisen
SHOW PRIVILEGES;
GRANT
  DROP
  ON mydb.*
  TO 'max'@'localhost';
  
  -- Rechte entfernen
REVOKE DROP ON mydb.* TO 'max'@'localhost';
  
  -- USER löschenALTER
  DROP USER 'max'@'localhost';