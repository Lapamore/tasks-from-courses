/*
Вывести авторов и суммарную стоимость их книг, если хотя бы одна их книга имеет цену выше средней по складу. 
Средняя цена рассчитывается как простое среднее, с помощью avg(). Информацию отсортировать по убыванию суммарной стоимости.
*/

SELECT author,SUM(price*amount) AS Стоимость FROM book
GROUP BY 1
HAVING Стоимость > AVG(price)
ORDER BY 2 DESC
