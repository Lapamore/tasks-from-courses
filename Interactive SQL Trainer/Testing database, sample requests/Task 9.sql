/*
Для каждого вопроса вывести процент успешных решений, то есть отношение количества верных ответов к общему количеству ответов,
значение округлить до 2-х знаков после запятой. Также вывести название предмета, к которому относится вопрос, и общее количество ответов на этот вопрос.
В результат включить название дисциплины, вопросы по ней (столбец назвать Вопрос), а также два вычисляемых столбца Всего_ответов и Успешность. 
Информацию отсортировать сначала по названию дисциплины, потом по убыванию успешности, а потом по тексту вопроса в алфавитном порядке.
Поскольку тексты вопросов могут быть длинными, обрезать их 30 символов и добавить многоточие "...".
*/

SELECT 
    name_subject,
    CONCAT(LEFT(name_question,30),"...") as Вопрос,  
    COUNT(testing.question_id) as Всего_ответов,
    ROUND((SUM(is_correct)/ COUNT(is_correct))*100,2) as Успешность
FROM subject
    INNER JOIN question ON question.subject_id = subject.subject_id
    INNER JOIN answer ON answer.question_id = question.question_id
    INNER JOIN testing ON answer.answer_id = testing.answer_id
        
GROUP BY 1,2
ORDER BY 1,4 DESC,2