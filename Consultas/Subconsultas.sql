-- Identificar los 3 generos mas populares en funcion de la cantidad de series
-- Para cada genero identificar el titulo de la serie, año de lanzamiento y rating imdb promedio

SELECT
series.titulo AS 'Titulo de la serie',
series.año_lanzamiento AS 'Año de lanzamiento',
series.genero AS 'Género',
AVG(episodios.rating_imdb) AS 'Rating promedio IMDB'
FROM
series
JOIN 
episodios ON series.serie_id = episodios.serie_id
WHERE
series.genero IN (SELECT genero FROM (
						SELECT genero, COUNT(*) AS cantidad_de_series
                        FROM series
                        GROUP BY genero
                        ORDER BY cantidad_de_series DESC
                        LIMIT 3) AS top3)
GROUP BY
series.serie_id

ORDER BY
'Rating promedio IMDB' DESC;