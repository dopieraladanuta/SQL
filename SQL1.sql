--1
SELECT Pracownik.Imie, Pracownik.Nazwisko FROM Pracownik 
	JOIN Dzial ON Pracownik,IdDzial=Dzial.IdDzial 
	WHERE Dzial.IdDzial=2;
--2
SELECT AVG(Pracownik.Pensja) AS 'Srednia' FROM Pracownik;
--3
SELECT MAX(Pracownik.Pensja) AS 'PensjaMAX' FROM Pracownik;
--4
SELECT * FROM Klient 
	WHERE DATEADD(Year,-18,GETDATE())<DataUrodzenia;
--5
UPDATE Samochod 
	SET Usuniete=1 
	WHERE IdStan=3;
--6
SELECT TOP(1) Model.Nazwa, Marka.Nazwa, Samochod.RokProdukcji FROM Wypozyczenia 
	JOIN  Samochod ON Wypozyczenia.IdSamochod=Samochod.IdSamochod 
	JOIN Model ON Samochod.IdModel=Model.IdModel
	JOIN Marka ON Model.IdMarka=Marka.IdMarka
	ORDER BY Wypozyczenia.DataWypozyczenia DESC
--7
SELECT * FROM(SELECT TOP(3) Klient.Imie, Klient.Nazwisko FROM Wypozyczenia 
JOIN  Klient ON Wypozyczenia.IdKlienta=Klient.IdKlient
ORDER BY Wypozyczenia.DataWypozyczenia ) AS K ORDER BY K.Nazwisko
--8
SELECT Samochod.RokProdukcji FROM Samochod 
	JOIN Model ON Samochod.IdModel=Model.IdModel 
	WHERE Model.Pojemnosc='6000';
--9
SELECT Klient.IdKlient, Klient.Imie, Klient.Nazwisko FROM Wypozyczenia  
	RIGHT OUTER JOIN  Klient ON Wypozyczenia.IdKlienta=Klient.IdKlient;
--10
INSERT INTO Samochod (IdModel, RokProdukcji,IdStan) 
	VALUES (3,2019,2);
--11
SELECT COUNT(Pracownik.IdPracownik) FROM Pracownik 
	WHERE DATEADD(Year,-45,GETDATE())>DataUrodzenia;
--12
SELECT Klient.Imie, Klient.Nazwisko, Marka.Nazwa AS 'Marka', Model.Nazwa AS 'Model' FROM Klient 
	JOIN Wypozyczenia ON Wypozyczenia.IdKlienta=Klient.IdKlient 
	JOIN Samochod ON Wypozyczenia.IdSamochod=Samochod.IdSamochod 
	JOIN Model ON Samochod.IdModel=Model.IdModel
	JOIN Marka ON Model.IdMarka=Marka.IdMarka 
	WHERE Wypozyczenia.DataOddania IS NULL
