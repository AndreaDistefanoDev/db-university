-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`id`,`students`.`name`,`students`.`surname`
FROM `students`
JOIN `degrees` ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = 'Economia';

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT `degrees`.`id`,`degrees`.`name`
FROM `degrees`
JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`
WHERE `degrees`.`level` = 'Magistrale' AND `departments`.`name` = 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `courses`.`id`,`courses`.`name`
FROM `courses`
JOIN `teachers` ON `courses`.`teacher_id` = `teachers`.`id`
WHERE `teachers`.`id` = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cuisono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT `students`.`id`,`students`.`name`,`students`.`surname`,`degrees`.`name` AS 'Corso di Laurea',`departments`.`name` AS 'Dipartimento'
FROM `students`
JOIN `degrees` ON `students`.`degree_id` = `degrees`.`id`
JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`
ORDER BY `students`.`surname`, `students`.`name`;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS 'Corso di Laurea', `courses`.`name` AS 'Corso', `teachers`.`name` AS 'Insegnante'
FROM `degrees`
JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id`
JOIN `teachers` ON `courses`.`teacher_id` = `teachers`.`id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT `teachers`.`id`,`teachers`.`name`,`teachers`.`surname`
FROM `teachers`
JOIN `departments` ON `teachers`.`department_id` = `departments`.`id`
WHERE `departments`.`id` = 54;

-- 7.BONUS: Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo. Successivamente, filtrare i tentativi con voto minimo 18.
SELECT `students`.`id`,`students`.`name`,`students`.`surname`, `exams`.`name` AS 'Esame', COUNT(`exam_attempts`.`id`) AS 'Numero di Tentativi', MAX(`exam_attempts`.`grade`) AS 'Voto Massimo'
FROM `students`
JOIN `exam_attempts` ON `students`.`id` = `exam_attempts`.`student_id`
JOIN `exams` ON `exam_attempts`.`exam_id` = `exams`.`id`
GROUP BY `students`.`id`, `exams`.`id`
HAVING MAX(`exam_attempts`.`grade`) >= 18;