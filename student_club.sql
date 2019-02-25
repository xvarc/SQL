// how do i do skill level?
i have a few problems to solves. firstly, is my order correct.
secondly, when do i do a foreign key. do i do it when the answer to a field can be found in a different diagram?
or do  i do it simply when two are related.
also should a entity like committee member also inclue name as well as position? ask this in labs.

DROP TABLE IF EXISTS Additional_skill;
DROP TABLE IF EXISTS Skill_level;
DROP TABLE IF EXISTS Committee_members;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Member;

CREATE TABLE Member (
    email VARCHAR(100) PRIMARY KEY NOT NULL UNIQUE,
    student_number INTEGER UNIQUE,
    hb_skill INTEGER,
    name     VARCHAR(100) NOT NULL
);

CREATE TABLE Event (
    event_date     VARCHAR(100) PRIMARY KEY,
    name     VARCHAR(100) NOT NULL,
    location VARCHAR(100)  NOT NULL UNIQUE,
    description   VARCHAR(1000)  NULL,
    organiser VARCHAR(100) NOT NULL,
    FOREIGN KEY (organiser) REFERENCES Member(email)
);

CREATE TABLE Committee_members (
    position VARCHAR(100)  PRIMARY KEY NOT NULL UNIQUE,
    email VARCHAR(100)  NOT NULL UNIQUE,
    FOREIGN KEY (position) REFERENCES Member(email)
);

CREATE TABLE Additional_skill (
    skill_name    VARCHAR(100) PRIMARY KEY,
    FOREIGN KEY (skill_name) REFERENCES Lecturer(id)
);

CREATE TABLE Skill_level (
    grade  INTEGER      PRIMARY KEY NOT NULL,
    FOREIGN KEY (grade) REFERENCES Member(email),
    FOREIGN KEY (grade) REFERENCES Additional_skill(skill_name),
);
