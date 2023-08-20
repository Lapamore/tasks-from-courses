/*
Студент прошел тестирование (то есть все его ответы занесены в таблицу testing), далее необходимо вычислить результат(запрос)
и занести его в таблицу attempt для соответствующей попытки.  Результат попытки вычислить как количество правильных ответов, 
деленное на 3 (количество вопросов в каждой попытке) и умноженное на 100. Результат округлить до целого.
Будем считать, что мы знаем id попытки,  для которой вычисляется результат, в нашем случае это 8.
*/

UPDATE attempt 
SET
    result =
    (
        SELECT ROUND((SUM(is_correct)/3)*100,0) as result 
        FROM answer
        INNER JOIN testing 
            ON testing.answer_id = answer.answer_id
        WHERE testing.attempt_id = 8
    )
    WHERE attempt_id = 8;
