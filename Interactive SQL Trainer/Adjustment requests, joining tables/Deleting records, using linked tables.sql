/*
Удалить всех авторов, которые пишут в жанре "Поэзия". Из таблицы book удалить все книги этих авторов. В запросе для отбора авторов использовать полное название жанра, а не его id.
*/

DELETE FROM author 
USING 
    author
    INNER JOIN book USING(author_id)
    INNER JOIN genre ON genre.genre_id = book.genre_id
WHERE name_genre = "Поэзия";
SELECT * FROM book;
SELECT * FROM author
