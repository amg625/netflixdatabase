-- ¿Cual es el episodio con la duración más larga?
SELECT titulo, duracion, descripcion FROM Episodios
ORDER BY duracion DESC;

-- ¿Quien es el actor o actriz que ha participado en la mayor cantidad de series?
SELECT actor_id,  COUNT(serie_id) AS 'numero de series' 
FROM Actuaciones GROUP BY actor_id;

-- ¿Cual es la serie con el mejor rating promedio segun imdb?
SELECT serie_id, AVG(rating_imdb) AS 'rating promedio'
FROM Episodios
GROUP BY serie_id
ORDER BY 'rating promedio' DESC;
