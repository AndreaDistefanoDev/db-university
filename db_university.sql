
-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT `id`,`name`,`surname`,`date_of_birth`
FROM `students`
WHERE YEAR(`date_of_birth`)=1990;

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT `id`,`name`,`cfu`
FROM `courses`
WHERE `cfu`>10
ORDER BY `cfu` ASC;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `id`,`name`,`surname`,`date_of_birth`
FROM `students`
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) > 30;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di Llaurea (286)
SELECT `id`,`name`,`period`,`year`
FROM `courses`
WHERE `period` LIKE 'I semestre' AND `year` = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT *
FROM `exams`
WHERE `hour` > '14:00:00' AND `date`= '2020-06-20';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT`id`,`name`,`level`
FROM `degrees`
WHERE `level` ='magistrale';

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(id) AS `total_departments`
FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(id) AS `total_teachers`
FROM `teachers`
WHERE `phone` IS NULL;

-- Query con Grup by --

-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(id) AS `total_subscribes`,YEAR (`enrolment_date`) AS `year_sub`
FROM `students`
GROUP BY YEAR(`enrolment_date`)
ORDER BY `year_sub`;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(id) AS `total_teachers`, `office_address`
FROM  `teachers`
GROUP BY `office_address`
ORDER BY `total_teachers` DESC;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(`vote`) AS `media_voto`,`exam_id`
FROM `exam_student`
GROUP BY `exam_id`
ORDER BY `media_voto` DESC;

-- 4.Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(id) AS `total_degrees`, `department_id`
FROM `degrees`
GROUP BY `department_id`
ORDER BY `total_degrees` DESC;
