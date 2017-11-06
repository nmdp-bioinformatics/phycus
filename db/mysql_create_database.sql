create database hfcusdb;
create user 'hfcus_user'@'%' identified by 'hfcus_user1';
grant all on hfcusdb.* to 'hfcus_user'@'%';

# Dump the schema
# mysqldump -u root -p --no-data hfcusdb > mysql_create_tables.sql