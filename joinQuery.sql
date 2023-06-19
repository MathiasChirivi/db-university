--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.* , `degrees`.`name`
FROM `students`
JOIN `degrees` ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia" ;

--2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT `degrees`.`name` AS `nome_corso`, `degrees`.`level`, `departments`.`name` AS `nome_dipartiemnto`  
FROM `departments` 
JOIN `degrees` ON `departments`.`id` = `degrees`.`department_id` 
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze' AND `degrees`.`level` = 'magistrale';

--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `courses`.*, `course_teacher`.`teacher_id` 
FROM `courses` 
JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id`
WHERE `course_teacher`.`teacher_id` = '44';

--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`surname` AS "Cognome", `students`.`name` AS "Nome", `degrees`.`name` AS "Nome Corso", `departments`.`name` AS "Nome Dipartimento"
FROM `students`
JOIN `degrees` ON `degrees`.`id` = `students`.`degree_id`
JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`surname`, `students`.`name`;

--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS "Corso di Laurea", `courses`.`name` AS "Corso", `teachers`.`surname` AS "Cognome", `teachers`.`name` AS "Nome"
FROM `degrees`
JOIN `courses` ON `courses`.`degree_id` = `degrees`.`id`
JOIN `course_teacher` ON `course_teacher`.`course_id` = `courses`.`id` 
JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id`;

--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `departments`.`name` AS `Nome_dipartimento`, `teachers`.`surname` AS `Nome`, `teachers`.`name` AS `Cognome`
FROM `departments`
JOIN `degrees` ON `departments`.`id` = `degrees`.`department_id`
JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `departments`.`name` = 'Dipartimento di Matematica'
ORDER BY `teachers`.`surname`, `teachers`.`name`;

--7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo. Successivamente, filtrare i tentativi con voto minimo 18.