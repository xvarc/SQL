-- This is the 'student' version of the databases setup script.
-- Run this as the root user in your MariaDB installation.

create user 'student';
create database elections14;
create database elections15;
create database census;
create database bb;
create database data;
create database uni;
grant select on elections14.* to 'student'@'localhost';
grant select on elections15.* to 'student'@'localhost';
grant select on census.* to 'student'@'localhost';
grant all on bb.* to 'student'@'localhost';
grant all on data.* to 'student'@'localhost';
grant all on uni.* to 'student'@'localhost';

grant shutdown on *.* to 'student'@'localhost';

flush privileges;
