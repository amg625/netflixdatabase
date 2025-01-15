-- Identificar las series más exitosas en la base, se definen por cantidad de episodios y rating imdb

WITH EpisodiosRecientes AS (
		SELECT 
			serie_id,
			COUNT(episodio_id) AS num_episodios
		FROM Episodios
		GROUP BY serie_id
		),
		Calificaciones AS (
		SELECT 
			serie_id,
			AVG(rating_imdb) AS promedio_imdb
		FROM Episodios
		GROUP BY serie_id
		)
SELECT 
	s.titulo,
	er.num_episodios,
	c.promedio_imdb
    
FROM Series s
JOIN EpisodiosRecientes er ON s.serie_id = er.serie_id
JOIN Calificaciones c ON s.serie_id = c.serie_id
ORDER BY c.promedio_imdb DESC, er.num_episodios DESC;