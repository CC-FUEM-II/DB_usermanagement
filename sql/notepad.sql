-- VorbereitungenALTER
-- source sql/notepad.sql;

SHOW DATABASES;
USE mydb -A;
SHOW TABLES;
SELECT * FROM mydb.employees;
SELECT * FROM mydb.countries;

-- Wer sind wir in MySQL?  
SELECT user();
-- @root:

-- user-Tabelle
SHOW DATABASES;
USE mysql;
SHOW TABLES;
DESCRIBE mysql.user;

SELECT 
	user, 
	authentication_string 
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

-- Reload (update) der Berechtigungen
FLUSH PRIVILEGES;

-- als Root abmelden
EXIT

-- Unter LINUX als admin in MySQL anmelden / @admin
mysql -u admin -p


-- User-Rechte von admin anzeigen -- @admin: welche Rechte habe ich?
SHOW GRANTS FOR 'admin'@'localhost';

-- Anlegen allg. USER USER max mit PW = max
CREATE USER 'max'@'localhost' IDENTIFIED BY 'max';

-- Alle Rechte anzeigen
SHOW PRIVILEGES;

-- Rechte anzeigen
SHOW PRIVILEGES;

 -- @admin: Rechte hinzufügen
GRANT
  SHOW DATABASES, SELECT
  ON *.*
  TO 'max'@'localhost';
  
-- login als max
-- @max: OK  
SHOW DATABASES;
SELECT * FROM mydb.employees;
SELECT * FROM mydb.countries;

-- @max: keine Berechtigung zum Löschen
DROP TABLE mydb.employees; 

-- Rechte zuweisen (Lösche)
SHOW PRIVILEGES;
GRANT
  DROP
  ON mydb.*
  TO 'max'@'localhost';

-- @max: OK
DROP TABLE mydb.employees; 

-- @admin: Löschberechtigung in mydb für user max wieder entziehen
REVOKE
	DROP
	ON mydb.*
	FROM 'max'@'localhost';
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'max'@'localhost';

-- @max: keine Berechtigung mehr 
DROP TABLE mydb.countries; 

-- @admin: User max löschen
DROP USER 'max'@'localhost';
  
  -- Rechte entfernen
REVOKE DROP ON mydb.* TO 'max'@'localhost';
  
  -- USER löschenALTER
  DROP USER 'max'@'localhost';
