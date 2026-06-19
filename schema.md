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
- exam_appeals
- students
- votes


## Table departments
- id            INT,PRIMARY KEY,UNIQUE,AUTO INCREMENT,NOT NULL
- name          VARCHAR(100), NOT NULL
- email         VARCHAR(255), NULL








