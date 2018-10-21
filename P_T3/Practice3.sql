CREATE TABLE SchoolGoods  
   (  
    SchoolGoodID int PRIMARY KEY,  
    PencilsID int REFERENCES SchoolGoods(SchoolGoodID),
	ColoredPencilsID int REFERENCES SchoolGoods(PencilsID),
    EmployeeName nvarchar(50)   
   ) ; 
GO  

-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE NumbergRange(
	NUMBERS int
);	
GO 

INSERT NumbergRange 
(NUMBERS)
VALUES
(FLOOR(RAND()*(20-5+1)+5))
GO

INSERT NumbergRange 
(NUMBERS)
VALUES
(FLOOR(RAND()*(20-5+1)+5)),
(FLOOR(RAND()*(20-5+1)+5)),
(FLOOR(RAND()*(20-5+1)+5)),
(FLOOR(RAND()*(20-5+1)+5)),
(FLOOR(RAND()*(20-5+1)+5))
GO


SELECT MAX(NUMBERS) as maxnum, MIN(NUMBERS) as minnum 
FROM NumbergRange


DECLARE @numbermin INT
SET @numbermin = ((SELECT MIN(NUMBERS) FROM NumbergRange) - 1) 
DECLARE @numbermax INT
SET @numbermax = (SELECT MAX(NUMBERS) FROM NumbergRange) 
WHILE @numbermin < @numbermax
    BEGIN
        SET @numbermin = @numbermin + 1
        PRINT CONVERT(NVARCHAR, @numbermin)
		IF @numbermin = @numbermax
            BREAK;
        IF @numbermin <> @numbermax
            CONTINUE;
        PRINT 'End Of Cycle'
    END;



--------------------------------------------------------------------------------------------------------------------

CREATE TABLE ten(
	numbers_tab1 int
);	
GO

INSERT ten 
(numbers_tab1)
VALUES
(10),
(20),
(30)
GO


CREATE TABLE random_num(
	numbers_tab2 int
);	
GO

INSERT random_num 
(numbers_tab2)
VALUES
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5)),
(FLOOR(RAND()*(50-5+1)+5))
GO


SELECT numbers_tab1,
    CASE 
        WHEN numbers_tab1 = 10 THEN (SELECT SUM(numbers_tab2) FROM random_num WHERE numbers_tab2 < 10)
        WHEN numbers_tab1 = 20 THEN (SELECT SUM(numbers_tab2) FROM random_num WHERE numbers_tab2 < 20 AND numbers_tab2 > 10)
        WHEN numbers_tab1 = 30 THEN (SELECT SUM(numbers_tab2) FROM random_num WHERE numbers_tab2 < 30 AND numbers_tab2 > 20)
        ELSE 'Nothing match'
    END AS numbers_tab2
FROM ten


