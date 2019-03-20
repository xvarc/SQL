-- This is the 'root' version of the databases setup script.
-- Run this as the root user in your MariaDB installation.

create user 'root';
create database elections14;
create database elections15;
create database census;
create database bb;
create database data;
create database uni;
grant select on elections14.* to 'root'@'localhost';
grant select on elections15.* to 'root'@'localhost';
grant select on census.* to 'root'@'localhost';
grant all on bb.* to 'root'@'localhost';
grant all on data.* to 'root'@'localhost';
grant all on uni.* to 'root'@'localhost';

grant shutdown on *.* to 'root'@'localhost';

flush privileges;
