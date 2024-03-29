/*
Посчитать стоимость всех экземпляров каждого автора без учета книг «Идиот» и «Белая гвардия». 
В результат включить только тех авторов, у которых суммарная стоимость книг (без учета книг «Идиот» и «Белая гвардия») более 5000 руб. 
Вычисляемый столбец назвать Стоимость. Результат отсортировать по убыванию стоимости.
*/

SELECT 
    author, 
    SUM(price*amount) as Стоимость 
FROM book
WHERE title NOT IN ('Идиот','Белая гвардия')
GROUP BY author
HAVING SUM(price*amount) >= 5000
ORDER BY SUM(price*amount) DESC;
