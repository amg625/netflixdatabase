-- ¿Qué generos son mas prevalentes en la base de datos?
-- Genera una lista de distintos generos y la cantidad de series por cada uno
SELECT genero,  COUNT(*) as 'Cantidad de series'
FROM series
GROUP BY genero
ORDER BY 'Cantidad de series' DESC;

-- ¿Cuales son las 3 series con mayor rating imdb y cuantos episodios tienen?
SELECT series.titulo, COUNT(episodios.episodio_id) AS 'Numero de episodios', AVG(episodios.rating_imdb) AS promedio_imdb
FROM series
JOIN episodios ON series.serie_id = episodios.serie_id
GROUP BY series.serie_id
ORDER BY promedio_imdb DESC
LIMIT 3;

-- ¿Cual es la duracion total de todos los episodios de la serie "Stranger Things"?
SELECT series.titulo, SUM(episodios.duracion) AS duracion_total
FROM series
JOIN episodios on series.serie_id = episodios.serie_id
WHERE series.titulo = 'Stranger Things';