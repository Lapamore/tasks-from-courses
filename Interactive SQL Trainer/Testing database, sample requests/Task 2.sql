/*
Вывести, сколько попыток сделали студенты по каждой дисциплине, а также средний результат попыток, который округлить до 2 знаков после запятой.
Под результатом попытки понимается процент правильных ответов на вопросы теста, который занесен в столбец result.
В результат включить название дисциплины, а также вычисляемые столбцы Количество и Среднее. Информацию вывести по убыванию средних результатов.
*/

SELECT name_subject, COUNT(attempt.student_id) as Количество, ROUND(AVG(result),2) as Среднее FROM attempt
RIGHT JOIN subject USING(subject_id)
GROUP BY 1
ORDER BY 3 DESC
