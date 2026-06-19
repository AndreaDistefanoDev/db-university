# Database Schema

- Modellizzare la struttura di un database per memorizzare tutti i dati riguardanti una  università:

- Sono presenti diversi `Dipartimenti` (es.: Lettere e Filosofia, Matematica, Ingegneria ecc.);
- Ogni `Dipartimento` offre più `Corsi di Laurea` (es.: Civiltà e Letterature Classiche, Informatica, Ingegneria Elettronica ecc..)
- Ogni `Corso di Laurea` prevede diversi `Corsi` (es.: Letteratura Latina, Sistemi Operativi 1, Analisi Matematica 2 ecc.);
- Ogni `Corso` può essere tenuto da diversi `Insegnanti`;
- Ogni `Corso `prevede più `appelli d'Esame`;
- Ogni `Studente` è iscritto ad un solo `Corso di Laurea`;
- Ogni `Studente` può iscriversi a più `appelli di Esame`;
- Per ogni `appello d'Esame` a cui lo `Studente` ha partecipato, è necessario memorizzare il voto ottenuto, anche se non sufficiente.



## Database name: 
- university_db


## Tables:
- departments
- degree_courses
- courses
- teachers
- exams
- students



## Table departments
- id                       INT,PK,UNIQUE,AUTO INCREMENT,NOT NULL
- name                     VARCHAR(100), NOT NULL
- email                    VARCHAR(255), NULL
- phone                    VARCHAR(20), NULL
- web_site                 VARCHAR(255), NULL

## Table degree_courses
- id                       INT,PK,UNIQUE,AUTO INCREMENT,NOT NULL
- department_id            INT,FK,NOT NULL
- name                     VARCHAR(150), NOT NULL
- level                    VARCHAR(20), NOT NULL

## Table courses
- id                       INT,PK,UNIQUE,AUTO INCREMENT,NOT NULL
- degree_courses_id        INT,FK,NOT NULL
- name                     VARCHAR(150),NOT NULL
- description              TEXT, NULL
- period                   VARCHAR(20),NOT NULL
- year                     TINYINT,NOT NULL
- cfu                      TINYINT,NOT NULL

## Table teachers
- id                       INT,PK,UNIQUE,AUTO INCREMENT,NOT NULL
- first_name               VARCHAR(50),NOT NULL
- last_name                VARCHAR(50),NOT NULL
- date_of_birth            DATE,NOTNULL
- phone                    VACHAR(20),NOT NULL
- email                    VARCHAR(255), NOT NULL

## Table students 
- id                       INT,PK,UNIQUE,AUTO INCREMENT,NOT NULL
- degree_courses_id        INT,FK,NOT NULL
- first_name               VARCHAR(50),NOT NULL
- last_name                VARCHAR(50),NOT NULL
- date_of_birth            DATE,NOT NULL
- registration_number      VARCHAR(20),NOT NULL
- phone                    VACHAR(20),NOT NULL
- email                    VARCHAR(255), NOT NULL
- registration_date        DATA,NOT NULL

## Table Exams
- id                       INT,PK,UNIQUE,AUTO INCREMENT,NOT NULL
- course_id                INT,FK,NOT NULL
- data                     DATA, NOT NULL
- hour                     TIME, NOT NULL
- room                     VARCHAR(50),NULL

# Table course_teacher
- course_id                INT,FK,NOT NULL
- teacher_id               INT,FK NOT NULL

# Table student_exam
- student_id               INT,FK,NOT NULL
- exam_id                  INT,FK,NOT NULL
- vote                     TINYINT,NOT NULL
- date_exam                DATE,NOT NULL








