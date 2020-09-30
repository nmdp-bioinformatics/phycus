FLUSH PRIVILEGES;

# CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';

CREATE USER 'dbaphpmyadmin'@'%' IDENTIFIED BY '1a88a1';

CREATE USER 'hfcus_user'@'%' IDENTIFIED BY 'hfcus_user1';


GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'dbaphpmyadmin'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'hfcus_user'@'%' WITH GRANT OPTION;


ALTER USER root IDENTIFIED WITH mysql_native_password BY 'root';
ALTER USER dbaphpmyadmin IDENTIFIED WITH mysql_native_password BY '1a88a1';
ALTER USER hfcus_user IDENTIFIED WITH mysql_native_password BY 'hfcus_user1';



FLUSH PRIVILEGES;

COMMIT;