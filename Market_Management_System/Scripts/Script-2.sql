SELECT p.PCODE, p.SELLERID, p.ICODE, p.ROTNUM, p.PDATE, p.LIFETIME, p.STOCK, p.INAME, j.OPRICE
		FROM PRODUCT p JOIN (SELECT j.ICODE, IPRICE, OPRICE
		FROM (SELECT ICODE, MAX(CDATE) CDATE
		FROM INVENPRICE i
		GROUP BY ICODE) j JOIN INVENPRICE i2 ON j.CDATE = i2.CDATE AND j.ICODE = i2.ICODE) j
		ON p.ICODE = j.ICODE JOIN (SELECT INAME, SUM(STOCK) AS STOCK
		FROM PRODUCT
		WHERE SELLERID = 'admin01' AND PSTATE = 'C'
		GROUP BY INAME) jj ON jj.INAME = p.INAME
		WHERE p.INAME = '빈츠' AND p.SELLERID = 'admin01' AND p.PSTATE = 'C';