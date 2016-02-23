USE mysql;

UPDATE user SET host='%' WHERE host='localhost';

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';

FLUSH PRIVILEGES;