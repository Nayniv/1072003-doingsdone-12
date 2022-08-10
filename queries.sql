INSERT INTO user (email, name, password)
VALUES ('rand@mail.com', 'Rand', '$2y$10$YNx6cugYYrZdaBkB8PKl0e2S2zU3/zUWI36HAZRe/gpa651HvJtGa'),
       ('met@mail.com', 'Met', '$2y$10$VuW7YMATeWtSfsGGlXKNR.91PZKCUig6dD5ilFoUI1Rd6ZyUbfXlq'),
       ('tom@mail.com', 'Tom', '$2y$10$ZuxjHqmnx7jXxfKbi7NNJO3O.VQijhPL4cp3yeLe30AT0rVp0Trdu');

INSERT INTO project (name, user_id)
VALUES ('Входящие', 1),
       ('Учеба', 1),
       ('Работа', 2),
       ('Домашние дела', 2),
       ('Авто', 3);

INSERT INTO task (dt_add, status, title, file, dt_completion, user_id, project_id)
VALUES (DATE_ADD(NOW(), INTERVAL - 2 DAY), 0, 'Собеседование в IT компании', null, '2021-12-12', 2, 3),
       (NOW(), 0, 'Выполнить тестовое задание', null, '2021-11-24', 2, 3),
       (DATE_ADD(NOW(), INTERVAL - 1 DAY), 1, 'Сделать задание первого раздела', null, '2021-11-26', 1, 2),
       (DATE_ADD(NOW(), INTERVAL - 8 HOUR), 0, 'Встреча с другом', null,'2021-11-23', 1, 1),
       (DATE_ADD(NOW(), INTERVAL - 1 HOUR), 0, 'Купить корм для кота', null, null, 2, 4),
       (DATE_ADD(NOW(), INTERVAL - 3 DAY), 0, 'Заказать пиццу', null, null, 2, 4);

/*получить список из всех проектов для одного пользователя*/

SELECT name FROM project
WHERE user_id = 1;

/*получить список из всех задач для одного проекта*/

SELECT * FROM task
JOIN project ON task.project_id = project.id
JOIN user ON task.user_id = user.id
WHERE project_id = 2;

/*пометить задачу как выполненную*/
UPDATE task SET status = 1 WHERE title = 'Заказать пиццу';

/*обновить название задачи по её идентификатору*/
UPDATE task SET title = 'Сделать задание пятого раздела' WHERE id = 3;
