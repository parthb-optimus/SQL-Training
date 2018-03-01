USE SQLTEST;
--Ans 1.
	SELECT Q1.TRAINNAME,
		   Q2.STATIONNAME,
		   Q1.DISTANCE,
		   Q1.SPEED
	FROM
		(
		----DISTANCE CALCULATION
		SELECT TRAINDETAILS.TRAINNAME,
			   SUM(JOURNEYDETAILS.DISTANCE) AS DISTANCE,
			   CONVERT(NUMERIC(10,2),3600*CAST (SUM(JOURNEYDETAILS.DISTANCE) AS FLOAT) / CAST(DATEDIFF(SECOND,MIN(JOURNEYDETAILS.DEPARTURE), MAX(JOURNEYDETAILS.SCHEDULEARRIVAL))AS FLOAT)) AS SPEED
		FROM TRAINDETAILS JOIN JOURNEYDETAILS 
		ON TRAINDETAILS.TRAINID = JOURNEYDETAILS.TRAINID
		GROUP BY TRAINDETAILS.TRAINNAME
		) Q1
	JOIN 
		(
		----STATIONNAME, TRAINNAME FORMAT
		SELECT DISTINCT	T.TRAINNAME,
			   STUFF((SELECT N', ' + CAST(S.STATIONNAME AS VARCHAR(255))
			   FROM JOURNEYDETAILS J, STATIONDETAILS S
			   WHERE S.STATIONID = J.STATIONID AND J.TRAINID = J1.TRAINID
			   FOR XML PATH (''), TYPE).value('text()[1]','nvarchar(max)'),1,2,N'') AS STATIONNAME
		FROM JOURNEYDETAILS J1 JOIN TRAINDETAILS T
		ON T.TRAINID = J1.TRAINID
		) Q2
	ON Q1.TRAINNAME = Q2.TRAINNAME



--Ans 2.(a)
	SELECT TOP 1 TRAINDETAILS.TRAINNAME
	FROM TRAINDETAILS RIGHT JOIN JOURNEYDETAILS 
	ON TRAINDETAILS.TRAINID = JOURNEYDETAILS.TRAINID
	GROUP BY TRAINDETAILS.TRAINNAME
	ORDER BY SUM(JOURNEYDETAILS.DISTANCE) DESC;



--Ans 2.(b)
	SELECT TOP 1 TRAINDETAILS.TRAINNAME,
		   CONVERT(NUMERIC(10,2),3600*CAST (SUM(JOURNEYDETAILS.DISTANCE) AS FLOAT) / CAST(DATEDIFF( SECOND,MIN(JOURNEYDETAILS.DEPARTURE), MAX(JOURNEYDETAILS.SCHEDULEARRIVAL))AS FLOAT)) AS SPEED
	FROM TRAINDETAILS JOIN JOURNEYDETAILS 
	ON TRAINDETAILS.TRAINID = JOURNEYDETAILS.TRAINID
	GROUP BY TRAINDETAILS.TRAINNAME
	ORDER BY SPEED DESC;



--Ans 2.(c)
	SELECT TRAINNAME 
	FROM (SELECT JOURNEYDETAILS.TRAINID AS JD, COUNT(JOURNEYDETAILS.TRAINID) AS VISITED
	FROM JOURNEYDETAILS INNER JOIN TRAINDETAILS 
	ON JOURNEYDETAILS.TRAINID = TRAINDETAILS.TRAINID GROUP BY JOURNEYDETAILS.TRAINID ) A
	INNER JOIN TRAINDETAILS B ON B.TRAINID = A.JD WHERE A.VISITED >= 3 



--Ans 2.(d)
	SELECT TRAINNAME 
	FROM TRAINDETAILS
	EXCEPT 
	(
		SELECT TRAINNAME 
		FROM TRAINDETAILS TD INNER JOIN JOURNEYDETAILS JD 
		ON TD.TRAINID=JD.TRAINID 
		WHERE STATIONID IN (102, 104) 
		GROUP BY TRAINNAME
	);



--Ans 3.
	SELECT Q1.TRAINID,
		   Q1.TRAINNAME,
		   Q1.DEPARTURE, 
		   Q2.ARRIVAL 
	FROM 
	(
		SELECT J.TRAINID,
			   T.TRAINNAME,
			   S.STATIONNAME AS DEPARTURE
		FROM JOURNEYDETAILS J INNER JOIN STATIONDETAILS S 
		ON J.STATIONID = S.STATIONID INNER JOIN TRAINDETAILS T 
		ON J.TRAINID = T.TRAINID 
		WHERE J.SCHEDULEARRIVAL IS NULL
	) Q1
	INNER JOIN 
	(
		SELECT J.TRAINID,
			   T.TRAINNAME,
			   S.STATIONNAME AS ARRIVAL 
		FROM JOURNEYDETAILS J INNER JOIN STATIONDETAILS S 
		ON J.STATIONID = S.STATIONID INNER JOIN TRAINDETAILS T 
		ON J.TRAINID = T.TRAINID 
		WHERE J.DEPARTURE IS NULL
	) Q2 
		ON Q1.TRAINID = Q2.TRAINID

--Ans 4.

	SELECT TD.TRAINNAME,  
		   MAIN.DELHI, 
		   MAIN.ALIGARH, 
		   MAIN.LUCKNOW, 
		   MAIN.KANPUR, 
		   MAIN.TOTALHOURS 
	FROM
		(
		SELECT Q1.TID,
			   Q1.DELHI, 
			   Q1.ALIGARH, 
			   Q2.LUCKNOW, 
			   Q2.KANPUR, 
			   Q1.DELHI+Q1.ALIGARH+Q2.LUCKNOW+Q2.KANPUR AS TOTALHOURS
		FROM
			 (
			 SELECT DELHI.TID,
					DELHI.DELHI,
					ALIGARH.ALIGARH 
			 FROM 
				(
					SELECT DEP.TRAINID AS TID, 
						   ISNULL ( DATEDIFF(HOUR, DEP.DEPARTURE, D.ARRIVAL),0) AS DELHI
					FROM
					(
						SELECT TRAINID,
						MIN(JOURNEYDETAILS.DEPARTURE) AS DEPARTURE
						FROM JOURNEYDETAILS
						GROUP BY TRAINID
					)DEP

					LEFT JOIN
					
					(
						SELECT TRAINID,
						SCHEDULEARRIVAL AS ARRIVAL
						FROM JOURNEYDETAILS
						WHERE STATIONID = 101
					)D
					ON DEP.TRAINID=D.TRAINID
				) DELHI 

			INNER JOIN 

			(
				SELECT DEP.TRAINID AS TID, 
					   ISNULL ( DATEDIFF(HOUR, DEP.DEPARTURE, A.ARRIVAL),0) AS ALIGARH
				FROM
				(
					SELECT TRAINID,
					MIN(JOURNEYDETAILS.DEPARTURE) AS DEPARTURE
					FROM JOURNEYDETAILS
					GROUP BY TRAINID
				)DEP
				LEFT JOIN
				(
					SELECT TRAINID,
					SCHEDULEARRIVAL AS ARRIVAL
					FROM JOURNEYDETAILS
					WHERE STATIONID = 102
				)A
				ON DEP.TRAINID=A.TRAINID
				) ALIGARH ON  DELHI.TID=ALIGARH.TID
			)Q1

		INNER JOIN
		(SELECT LUCKNOW.TID,
				LUCKNOW.LUCKNOW,
				KANPUR.KANPUR 
		 FROM 
		(
			SELECT DEP.TRAINID AS TID,
				   ISNULL ( DATEDIFF(HOUR, DEP.DEPARTURE, L.ARRIVAL),0) AS LUCKNOW
			FROM
			(
				SELECT TRAINID,
				MIN(JOURNEYDETAILS.DEPARTURE) AS DEPARTURE
				FROM JOURNEYDETAILS
				GROUP BY TRAINID
			)DEP
			LEFT JOIN
			(
				SELECT TRAINID,
				SCHEDULEARRIVAL AS ARRIVAL
				FROM JOURNEYDETAILS
				WHERE STATIONID = 103
			)L
			ON DEP.TRAINID=L.TRAINID
		)LUCKNOW 
		INNER JOIN
		(
			SELECT DEP.TRAINID AS TID, ISNULL ( DATEDIFF(HOUR, DEP.DEPARTURE, K.ARRIVAL),0) AS KANPUR
			FROM
			(
				SELECT TRAINID,
				MIN(JOURNEYDETAILS.DEPARTURE) AS DEPARTURE
				FROM JOURNEYDETAILS
				GROUP BY TRAINID
			)DEP
			LEFT JOIN
			(
				SELECT TRAINID,
				SCHEDULEARRIVAL AS ARRIVAL
				FROM JOURNEYDETAILS
				WHERE STATIONID = 104
			)K
			ON DEP.TRAINID=K.TRAINID
		)KANPUR 
		ON LUCKNOW.TID=KANPUR.TID)Q2
		ON Q1.TID = Q2.TID
		) MAIN
	JOIN
	TRAINDETAILS TD
	ON 
	TD.TRAINID= MAIN.TID;
