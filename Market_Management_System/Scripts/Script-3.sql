SELECT * FROM coupon;

SELECT * FROM COUPONBOX;

CREATE SEQUENCE AUTOORDER_SEQ START WITH 1 INCREMENT BY 1;

SELECT TO_DATE(ODATE) ODATE , o.ONUM ,i.INAME ,
	   o2.ODSTOCK ,o2.OPRICE ,o.STORE ,
	   o.OSTATE ,m.NAME ,o.ADDR , 
	   m.PHONE , p.PAYMENTAMT , p.DISCOUNTAMT 
	FROM "ORDER" o 
	INNER JOIN ORDERDETAIL o2 ON o2.ONUM = o.ONUM 
	INNER JOIN INVENTORY i ON i.ICODE = o2.ICODE 
	INNER JOIN "MEMBER" m ON m.ID = o.ID 
	INNER JOIN PAYMENT p ON p.ONUM = o.ONUM 
	WHERE o.ONUM = '50';
	
INSERT INTO MARKET.DELIVERYLIST
(DNUM, DNAME, ID, ROADADDR, ADDR,PHONE)
VALUES(DNUM_SEQ.NEXTVAL, 'test01' ,'test01', '서울특별시 금천구 시흥대로 153길 54-2', '406호','01012341234');



SELECT CSEQ, CNOTIFY, CDATE FROM COUPON WHERE CSEQ = '41';


SELECT c2.CNOTIFY, c2.CSEQ , c2.CDATE, c2.COUPON FROM COUPONBOX c, COUPON c2  
		WHERE c.CSEQ = c2.CSEQ 
		AND ID = 'test01'
		AND c2.CENABLE = 'Y';
		
	SELECT CSEQ, CNOTIFY, CTHUMBIMG, CDATE, COUPON FROM COUPON WHERE CSEQ = '1';
	
SELECT SUM(MMONEY) MMONEY
	FROM MILEAGE
	WHERE ID = 'test01' AND MSTATE = 'P'
	
	SELECT c2.CNOTIFY, c.CBSEQ , c2.CDATE, c2.COUPON FROM COUPONBOX c, COUPON c2  
		WHERE c.CSEQ = c2.CSEQ 
		AND ID = 'test01'
		AND c2.CENABLE = 'Y';
		
	
SELECT c2.CBSEQ, c.CNOTIFY, c.CSEQ, c.COUPON FROM COUPON c, CouponBox c2 WHERE c.CSEQ = c2.CSEQ;

DELETE FROM COUPONBOX c WHERE c.CSEQ ='1' AND c.ID = 'test01';