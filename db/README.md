## Create Database
To create the database manually.
```sql
create database hfcusdb;
create user 'hfcus_user'@'%' identified by 'hfcus_user1';
grant all on hfcusdb.* to 'hfcus_user'@'%';
```
 
## Dump the schema
To generate the `mysql_create_tables.sql` from a clean database.
Only dump the schema.
```bash
 mysqldump -u root -p --no-data hfcusdb > mysql_create_tables.sql
```
