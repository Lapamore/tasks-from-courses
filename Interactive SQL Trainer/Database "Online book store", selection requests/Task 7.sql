/*
В таблице city для каждого города указано количество дней, за которые заказ может быть доставлен в этот город (рассматривается только этап "Транспортировка"). 
Для тех заказов, которые прошли этап транспортировки, вывести количество дней за которое заказ реально доставлен в город.
А также, если заказ доставлен с опозданием, указать количество дней задержки, в противном случае вывести 0. 
В результат включить номер заказа (buy_id), а также вычисляемые столбцы Количество_дней и Опоздание. Информацию вывести в отсортированном по номеру заказа виде.
*/

SELECT buy.buy_id, (DATEDIFF(date_step_end,date_step_beg)) as Количество_дней ,
IF(DATEDIFF(date_step_end,date_step_beg) - city.days_delivery > 0,DATEDIFF(date_step_end,date_step_beg) - city.days_delivery,0) as Опоздание
FROM city
    INNER JOIN client USING(city_id) 
    INNER JOIN buy USING(client_id)
    INNER JOIN buy_step USING(buy_id) 
    INNER JOIN step USING(step_id)
WHERE buy_step.step_id = 3 AND DATEDIFF(date_step_end,date_step_beg) IS NOT NULL; 
